#Use this file as a script for gnuplot
#(See http://www.gnuplot.info/ for details)

set title" #Blocks= 12, #Terminals= 3, #Nets= 6, Area=8.80589e+07, HPWL= 41612 "

set nokey
#   Uncomment these two lines starting with "set"
#   to save an EPS file for inclusion into a latex document
# set terminal postscript eps color solid 20
# set output "result.eps"

#   Uncomment these two lines starting with "set"
#   to save a PS file for printing
# set terminal postscript portrait color solid 20
# set output "result.ps"


set xrange [-20210:20210]

set yrange [-50:20210]

set label "m17" at 17920 , 2016 center 

set label "B" at 17920 , 3192


set label "S" at 17600 , 1176


set label "m18" at 800 , 2016 center 

set label "B" at 800 , 3192


set label "S" at 480 , 1176


set label "m19" at 2240 , 2016 center 

set label "B" at 2240 , 3192


set label "S" at 1920 , 1176


set label "m16" at 8000 , 2016 center 

set label "B" at 8000 , 3192


set label "D" at 7840 , 504


set label "G" at 7840 , 2016


set label "S" at 8000 , 336


set label "m21" at 5120 , 2016 center 

set label "B" at 5120 , 3192


set label "S" at 4800 , 1176


set label "m39" at 3680 , 2016 center 

set label "B" at 3680 , 3192


set label "S" at 3360 , 1176


set label "m40" at 6560 , 2016 center 

set label "B" at 6560 , 3192


set label "S" at 6240 , 1176


set label "m41" at 19360 , 2016 center 

set label "B" at 19360 , 3192


set label "S" at 19040 , 1176


set label "m28" at 9440 , 2016 center 

set label "B" at 9440 , 3192


set label "G" at 9280 , 2016


set label "S" at 9120 , 420


set label "m38_m35_m34" at 11920 , 2184 center 

set label "B" at 10240 , 168


set label "DA" at 10240 , 168


set label "DB" at 10240 , 168


set label "DC" at 10240 , 168


set label "S" at 10240 , 168


set label "m14_m15" at 16320 , 2016 center 

set label "B" at 16320 , 3192


set label "DA" at 16000 , 1260


set label "DB" at 16320 , 672


set label "S" at 16320 , 336


set label "m37_m36" at 14560 , 2016 center 

set label "B" at 14560 , 3192


set label "DA" at 14240 , 504


set label "DB" at 14560 , 672


set label "GA" at 14240 , 2016


set label "GB" at 14560 , 2184


set label "S" at 14560 , 336


set label "vout" at 10240 , 0 center 

set label "ibias" at 10240 , 0 center 

set label "vcm_in" at 14560 , 0 center 

plot[:][:] '-' with lines linestyle 3, '-' with lines linestyle 7, '-' with lines linestyle 1, '-' with lines linestyle 0

# block m17 select 0 bsize 4
	17280	168
	17280	3864
	18560	3864
	18560	168
	17280	168

# block m18 select 0 bsize 4
	160	168
	160	3864
	1440	3864
	1440	168
	160	168

# block m19 select 0 bsize 4
	1600	168
	1600	3864
	2880	3864
	2880	168
	1600	168

# block m16 select 0 bsize 4
	7360	168
	7360	3864
	8640	3864
	8640	168
	7360	168

# block m21 select 0 bsize 4
	4480	168
	4480	3864
	5760	3864
	5760	168
	4480	168

# block m39 select 0 bsize 4
	3040	168
	3040	3864
	4320	3864
	4320	168
	3040	168

# block m40 select 0 bsize 4
	5920	168
	5920	3864
	7200	3864
	7200	168
	5920	168

# block m41 select 0 bsize 4
	18720	168
	18720	3864
	20000	3864
	20000	168
	18720	168

# block m28 select 0 bsize 4
	8800	168
	8800	3864
	10080	3864
	10080	168
	8800	168

# block m38_m35_m34 select 0 bsize 4
	10240	168
	10240	4200
	13600	4200
	13600	168
	10240	168

# block m14_m15 select 0 bsize 4
	15520	168
	15520	3864
	17120	3864
	17120	168
	15520	168

# block m37_m36 select 0 bsize 4
	13760	168
	13760	3864
	15360	3864
	15360	168
	13760	168


EOF
	17352	3160
	17352	3224
	18488	3224
	18488	3160
	17352	3160

	17560	264
	17560	2088
	17640	2088
	17640	264
	17560	264

	232	3160
	232	3224
	1368	3224
	1368	3160
	232	3160

	440	264
	440	2088
	520	2088
	520	264
	440	264

	1672	3160
	1672	3224
	2808	3224
	2808	3160
	1672	3160

	1880	264
	1880	2088
	1960	2088
	1960	264
	1880	264

	7432	3160
	7432	3224
	8568	3224
	8568	3160
	7432	3160

	7608	472
	7608	536
	8072	536
	8072	472
	7608	472

	7608	1984
	7608	2048
	8072	2048
	8072	1984
	7608	1984

	7768	304
	7768	368
	8232	368
	8232	304
	7768	304

	4552	3160
	4552	3224
	5688	3224
	5688	3160
	4552	3160

	4760	264
	4760	2088
	4840	2088
	4840	264
	4760	264

	3112	3160
	3112	3224
	4248	3224
	4248	3160
	3112	3160

	3320	264
	3320	2088
	3400	2088
	3400	264
	3320	264

	5992	3160
	5992	3224
	7128	3224
	7128	3160
	5992	3160

	6200	264
	6200	2088
	6280	2088
	6280	264
	6200	264

	18792	3160
	18792	3224
	19928	3224
	19928	3160
	18792	3160

	19000	264
	19000	2088
	19080	2088
	19080	264
	19000	264

	8872	3160
	8872	3224
	10008	3224
	10008	3160
	8872	3160

	9048	1984
	9048	2048
	9512	2048
	9512	1984
	9048	1984

	9080	264
	9080	576
	9160	576
	9160	264
	9080	264

	10240	168
	10240	168
	10240	168
	10240	168
	10240	168

	10240	168
	10240	168
	10240	168
	10240	168
	10240	168

	10240	168
	10240	168
	10240	168
	10240	168
	10240	168

	10240	168
	10240	168
	10240	168
	10240	168
	10240	168

	10240	168
	10240	168
	10240	168
	10240	168
	10240	168

	15592	3160
	15592	3224
	17048	3224
	17048	3160
	15592	3160

	15960	432
	15960	2088
	16040	2088
	16040	432
	15960	432

	16088	640
	16088	704
	16552	704
	16552	640
	16088	640

	15928	304
	15928	368
	16712	368
	16712	304
	15928	304

	13832	3160
	13832	3224
	15288	3224
	15288	3160
	13832	3160

	14008	472
	14008	536
	14472	536
	14472	472
	14008	472

	14328	640
	14328	704
	14792	704
	14792	640
	14328	640

	14008	1984
	14008	2048
	14472	2048
	14472	1984
	14008	1984

	14328	2152
	14328	2216
	14792	2216
	14792	2152
	14328	2152

	14168	304
	14168	368
	14952	368
	14952	304
	14168	304


EOF

	10220	-20
	10220	20
	10260	20
	10260	-20
	10220	-20

	10220	-20
	10220	20
	10260	20
	10260	-20
	10220	-20

	14540	-20
	14540	20
	14580	20
	14580	-20
	14540	-20

EOF

#Net: net023
	17600	1176
	16000	1260
	17600	1176

	17600	1176
	14240	504
	17600	1176


#Net: net049
	1920	1176
	7840	2016
	1920	1176

	1920	1176
	9280	2016
	1920	1176

	1920	1176
	16320	672
	1920	1176

	1920	1176
	14560	672
	1920	1176


#Net: vout
	7840	504
	9440	3192
	7840	504

	7840	504
	9120	420
	7840	504

	7840	504
	10240	168
	7840	504

	7840	504
	14240	2016
	7840	504

	7840	504
	10240	0
	7840	504


#Net: net048
	19040	1176
	10240	168
	19040	1176

	19040	1176
	14560	336
	19040	1176


#Net: ibias
	10240	168
	10240	0
	10240	168


#Net: vcm_in
	14560	2184
	14560	0
	14560	2184


EOF

pause -1 'Press any key'