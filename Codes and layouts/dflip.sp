Dff Suryasasanka_2019102036
.include TSMC_180nm.txt
.param SUPPLY=1.8
.param LAMBDA=0.09u
.param width=10*LAMBDA
.global gnd vdd

VDD vdd gnd 'SUPPLY'

vclk clk 0 pulse 0 1.8 0ns 100ps 100ps 5ns 10ns
Vin_d B3 gnd pwl (0 0v 10.095ns 0v 10.095ns 1.8v 100ns 1.8v)

.subckt not y x 
.param width_N={width}
.param width_P={2*width}

M1 y x gnd gnd CMOSN W={width_N} L={2*LAMBDA}
+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M2 y x vdd vdd CMOSP W={width_P} L={2*LAMBDA}
+AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
.ends not

.subckt nand a b y
.param width_N={width}
.param width_P={2*width}

M1 y a vdd vdd CMOSP W={width_P} L={2*LAMBDA}
+AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

M2 y b vdd vdd CMOSP W={width_P} L={2*LAMBDA}
+AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}


M3 y a D1 gnd CMOSN W={width_N} L={2*LAMBDA}
+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M4 D1 b gnd gnd CMOSN W={width_N} L={2*LAMBDA}
+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

.ends nand

.subckt nand3 a b c y
.param width_N={width}
.param width_P={2*width}

M1 y a vdd vdd CMOSP W={width_P} L={2*LAMBDA}
+AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

M2 y b vdd vdd CMOSP W={width_P} L={2*LAMBDA}
+AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

M3 y c vdd vdd CMOSP W={width_P} L={2*LAMBDA}
+AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

M4 y a D1 gnd CMOSN W={width_N} L={2*LAMBDA}
+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M5 D1 b D2 gnd CMOSN W={width_N} L={2*LAMBDA}
+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M6 D2 c gnd gnd CMOSN W={width_N} L={2*LAMBDA}
+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

.ends nand3

.subckt d_ff clk D Q Q_bar

x1 D R R1 nand
x2 R1 clk S R nand3
x3 clk S1 S nand
x4 R1 S S1 nand

x5 S Q_bar Q nand
x6 R Q Q_bar nand


.ends d_ff

x7 clk B3 Q Q_bar d_ff 

.tran 0.1n 100n

.measure tran tcq
+TRIG v(clk) val = 'SUPPLY/2' RISE = 2
+TARG v(Q) val = 'SUPPLY/2' RISE = 1

.control
set hcopypscolor = 1
set color0=white
set color1=black

run
plot v(clk) v(B3)+2 v(Q)+4 

.endc
