import pathlib

from .compiler import generate_hierarchy
from .cell_fabric import generate_primitive
from .compiler.util import logging
from .pnr import generate_pnr
from .gdsconv.json2gds import convert_GDSjson_GDS_fps

def schematic2layout(netlist_dir, pdk_dir, netlist_file=None, subckt=None, working_dir=None, flatten=False, unit_size_mos=10, unit_size_cap=10):

    if working_dir is None:
        working_dir = pathlib.Path.cwd().resolve()
    if not working_dir.is_dir():
        logging.error("Working directory doesn't exist. Please enter a valid directory path")
        print("Working directory doesn't exist. Please enter a valid directory path")
        exit(0)

    pdk_dir = pathlib.Path(pdk_dir).resolve()
    if not pdk_dir.is_dir():
        logging.error("PDK directory doesn't exist. Please enter a valid directory path")
        print("PDK directory doesn't exist. Please enter a valid directory path")
        exit(0)

    netlist_dir = pathlib.Path(netlist_dir).resolve()
    if not netlist_dir.is_dir():
        logging.error("Netlist directory doesn't exist. Please enter a valid directory path")
        print("Netlist directory doesn't exist. Please enter a valid directory path")
        exit(0)

    netlist_files = [x for x in netlist_dir.iterdir() if x.is_file() and x.suffix in ('.sp', '.cdl')]
    if not netlist_files:
        print("No spice files found in netlist directory. Exiting...")
        logging.error(
            "No spice files found in netlist directory. Exiting...")
        exit(0)

    if netlist_file:
        netlist_file = pathlib.Path(netlist_file).resolve()
        netlist_files = [x for x in netlist_files if netlist_file == x]
        if not netlist_files:
            print(f"No spice file {netlist_file} found in netlist directory. Exiting...")
            logging.error(
                f"No spice files {netlist_file} found in netlist directory. Exiting...")
            exit(0)

    if subckt is None:
        assert len(netlist_files) == 1, "Encountered multiple spice files. Cannot infer top-level circuit"
        subckt = netlist_files[0].stem

    for netlist in netlist_files:
        logging.info(f"READ file: {netlist} subckt={subckt}, flat={flatten}")
        # Generate hierarchy
        topology_dir = working_dir / '1_topology'
        topology_dir.mkdir(exist_ok=True)
        primitives = generate_hierarchy(netlist, subckt, topology_dir, flatten, unit_size_mos , unit_size_cap)
        # Generate primitives
        primitive_dir = (working_dir / '2_primitives')
        primitive_dir.mkdir(exist_ok=True)
        for block_name, block_args in primitives.items():
            generate_primitive(block_name, **block_args, pdkdir=pdk_dir, outputdir=primitive_dir)
        # Generate .map & .lef inputs for PnR
        with (primitive_dir / f'{subckt}.map').open(mode='wt') as mp, \
             (primitive_dir / f'{subckt}.lef').open(mode='wt') as lp:
            for file_ in primitive_dir.iterdir():
                if file_.suffixes == ['.gds', '.json']:
                    true_stem = file_.stem.split('.')[0]
                    mp.write(f'{true_stem} {true_stem}.gds\n')
                elif file_.suffix == '.lef' and file_.stem != subckt:
                    lp.write(file_.read_text())
        # Copy over necessary collateral & run PNR tool
        pnr_dir = working_dir / '3_pnr'
        pnr_dir.mkdir(exist_ok=True)
        # TODO: Copying is bad ! Rewrite C++ code to accept fully qualified paths
        (pnr_dir / f'{subckt}.map').write_text((primitive_dir / f'{subckt}.map').read_text())
        (pnr_dir / f'{subckt}.lef').write_text((primitive_dir / f'{subckt}.lef').read_text())
        (pnr_dir / f'{subckt}.v').write_text((topology_dir / f'{subckt}.v').read_text())
        (pnr_dir / 'layers.json').write_text((pdk_dir / 'layers.json').read_text())
        for file_ in topology_dir.iterdir():
            if file_.suffix == '.const':
                (pnr_dir / file_.name).write_text(file_.read_text())
        for file_ in primitive_dir.iterdir():
            if file_.suffix == '.json':
                (pnr_dir / file_.name).write_text(file_.read_text())
        output = generate_pnr(
            pnr_dir,
            f'{subckt}.lef',
            f'{subckt}.v',
            f'{subckt}.map',
            'layers.json',
            subckt)
        if output is None:
            print("Cannot proceed further")
            sys.exit(-1)
        # Convert gds.json to gds
        output_dir = working_dir / 'Results'
        convert_GDSjson_GDS_fps(output_dir / f'{subckt}_0.gds.json', output_dir / f'{subckt}_0.gds')
