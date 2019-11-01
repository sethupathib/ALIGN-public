.subckt Switch_NMOS  D G S
M0 D G S 0 NMOS
.ends Switch_NMOS

.subckt Switch_PMOS  D G S
M0 D G S 0 PMOS
.ends Switch_PMOS

.subckt SCM_NMOS DA DB S
M0 DA DA S 0 NMOS
M1 DB DA S 0 NMOS
.ends SCM_NMOS

.subckt CMFB_NMOS DA DB GB S
M0 DA DA S 0 NMOS
M1 DB GB S 0 NMOS
.ends CMFB_NMOS

.subckt CASCODED_CMC_PMOS DA GA DB S
M0 DA GA SA vdd PMOS
M1 DB GA SB vdd PMOS
M2 SA DB S vdd PMOS
M3 SB DB S vdd PMOS
.ends CASCODED_CMC_PMOS

.subckt CASCODED_CMC_NMOS DA S DB GA
M0 DA GA SA vss NMOS
M1 DB GA SB vss NMOS
M2 SA DA S vss NMOS
M3 SB DA S vss NMOS
.ends CASCODED_CMC_NMOS

.subckt CMC_NMOS_S  DA DB G S
M0 DA G S 0 NMOS
M1 DB G S 0 NMOS
.ends CMC_NMOS_S

.subckt CMC_PMOS_S  DA DB G S
M0 DA G S vdd PMOS
M1 DB G S vdd PMOS
.ends CMC_PMOS_S

.subckt DP_NMOS  DA DB GA GB S
M0 DA GA S 0 NMOS
M1 DB GB S 0 NMOS
.ends DP_NMOS

.subckt CMC_PMOS DA DB SA SB G
M0 DA G SA 0 PMOS
M1 DB G SB 0 PMOS
.ends CMC_PMOS

.subckt CMC_NMOS DA DB SA SB G
M0 DA G SA 0 NMOS
M1 DB G SB 0 NMOS
.ends CMC_NMOS

.subckt DCL_NMOS D S
M0 D D S 0 NMOS
.ends DCL_NMOS

.subckt DCL_PMOS D S
M0 D D S 0 PMOS
.ends DCL_PMOS

.subckt 2_stage_inv b0_inv b0_buf B0
MM7 b0_buf b0_inv VSS VSS NMOS
MM4 b0_inv B0 VSS VSS NMOS
MM6 b0_buf b0_inv VDD VDD PMOS
MM5 b0_inv B0 VDD VDD PMOS
.ends 2_stage_inv
