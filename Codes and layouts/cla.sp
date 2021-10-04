CLA Suryasasanka_2019102036
.include TSMC_180nm.txt
.param SUPPLY=1.8
.param LAMBDA=0.09u
.param width=10*LAMBDA
.global gnd vdd

VDD vdd gnd 'SUPPLY'
vin_a A0 0 pulse  1.8 0 0ns 100ps 100ps 50ns 100ns
*vin_a A0 0 pulse  0 1.8 0ns 100ps 100ps 100ns 200ns
vin_a1 A1 0 pulse 1.8 0 0ns 100ps 100ps 50ns 100ns
*vin_a1 A1 0 pulse 0 1.8 0ns 100ps 100ps 100ns 200ns
vin_a2 A2 0 pulse 1.8 0 0ns 100ps 100ps 50ns 100ns
*vin_a2 A2 0 pulse 0 1.8 0ns 100ps 100ps 100ns 200ns
vin_a3 A3 0 pulse 1.8 0 0ns 100ps 100ps 50ns 100ns
*vin_a3 A3 0 pulse 0 1.8 0ns 100ps 100ps 100ns 200ns

vin_b B0 0 pulse  1.8 0 0ns 100ps 100ps 50ns 100ns
*vin_b B0 0 pulse  0 1.8 0ns 100ps 100ps 100ns 200ns
vin_b1 B1 0 pulse 1.8 0 0ns 100ps 100ps 50ns 100ns
*vin_b1 B1 0 pulse 0 1.8 0ns 100ps 100ps 100ns 200ns
vin_b2 B2 0 pulse 1.8 0 0ns 100ps 100ps 50ns 100ns
*vin_b2 B2 0 pulse 0 1.8 0ns 100ps 100ps 100ns 200ns
vin_b3 B3 0 pulse 1.8 0 0ns 100ps 100ps 50ns 100ns
*vin_b3 B3 0 pulse 0 1.8 0ns 100ps 100ps 100ns 200ns



vin_c0 C0 0 pulse 1.8 0 0ns 100ps 100ps 100ns 200ns
vin_clk clk 0 pulse 1.8 0 0ns 100ps 100ps 50ns 100ns

.subckt xor a b y
.param width_N={width}
.param width_P={2*width}
M1 a_bar a gnd gnd CMOSN W={width_N} L={2*LAMBDA}
+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
M2 a_bar a vdd vdd CMOSP W={width_P} L={2*LAMBDA}
+AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

M3 b_bar b gnd gnd CMOSN W={width_N} L={2*LAMBDA}
+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
M4 b_bar b vdd vdd CMOSP W={width_P} L={2*LAMBDA}
+AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}


M5 D1 b_bar vdd vdd CMOSP W={width_P} L={2*LAMBDA}
+AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

M6 y a D1 vdd CMOSP W={width_P} L={2*LAMBDA}
+AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

M7 D2 b vdd vdd CMOSP W={width_P} L={2*LAMBDA}
+AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

M8 y a_bar D2 vdd CMOSP W={width_P} L={2*LAMBDA}
+AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

M9 y b D3 gnd CMOSN W={width_N} L={2*LAMBDA}
+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M10 D3 a gnd gnd CMOSN W={width_N} L={2*LAMBDA}
+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M11 y b_bar D4 gnd CMOSN W={width_N} L={2*LAMBDA}
+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M12 D4 a_bar gnd gnd CMOSN W={width_N} L={2*LAMBDA}
+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

.ends xor

.subckt and a b y 
.param width_N={width}
.param width_P={2*width}

M1 N a vdd vdd CMOSP W={width_P} L={2*LAMBDA}
+AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

M2 N b vdd vdd CMOSP W={width_P} L={2*LAMBDA}
+AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}


M3 N a D1 gnd CMOSN W={width_N} L={2*LAMBDA}
+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M4 D1 b gnd gnd CMOSN W={width_N} L={2*LAMBDA}
+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M5 y N gnd gnd CMOSN W={width_N} L={2*LAMBDA}
+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M6 y N vdd vdd CMOSP W={width_P} L={2*LAMBDA}
+AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
.ends and

.subckt or a b y
.param width_N={width}
.param width_P={2*width}

M1 D1 a vdd vdd CMOSP W={width_P} L={2*LAMBDA}
+AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

M2 N b D1 vdd CMOSP W={width_P} L={2*LAMBDA}
+AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}


M3 N a gnd gnd CMOSN W={width_N} L={2*LAMBDA}
+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M4 N b gnd gnd CMOSN W={width_N} L={2*LAMBDA}
+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M5 y N gnd gnd CMOSN W={width_N} L={2*LAMBDA}
+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M6 y N vdd vdd CMOSP W={width_P} L={2*LAMBDA}
+AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
.ends or

x1 A0 B0 P0 xor 
x2 A1 B1 P1 xor
x3 A2 B2 P2 xor
x4 A3 B3 P3 xor

x5 A0 B0 G0 and
x6 A1 B1 G1 and
x7 A2 B2 G2 and
x8 A3 B3 G3 and


V_c1 C1 G0 '0'           $G0

x9 P1 G0 PG10 and        $P1G0
x10 G1 PG10 C2 or        $G1+P1G0

x11 P2 PG10 PPG210 and   $P2P1G0 
x12 P2 G1 PG21 and       $P2G1
x13 PG21 PPG210 PGPPG or $P2G1+P2P1G0
x14 G2 PGPPG C3 or       $C3=G2+P2G1+P2P1G0

x15 P3 PPG210 PPPG3210 and   $P3P2P1G0
x16 P3 PG21 PPG321 and       $P3P2G1
x17 PPPG3210 PPG321 last1 or $P3P2G1+P3P2P1G0

x18 P3 G2 PG32 and           $P3G2
x19 G3 PG32 last2 or         $G3+P3G2

x20 last2 last1 Cout or      $G3+P3G2+P3P2G1+P3P2P1G0
x21 P0 C0 S0 xor
x22 P1 C1 S1 xor
x23 P2 C2 S2 xor
x24 P3 C3 S3 xor


.tran 0.1n 100n

.measure tran tpdcout
+TRIG v(A0) val = 'SUPPLY/2' RISE = 1
+TARG v(Cout) val = 'SUPPLY/2' RISE = 1


.measure tran tpds3
+TRIG v(A0) val = 'SUPPLY/2' RISE = 1
+TARG v(S3) val = 'SUPPLY/2' RISE = 1

.control
set hcopypscolor = 1
set color0=white
set color1=black

run
plot v(A0)
plot v(A1)
plot v(A2)
plot v(A3)
plot v(S0) 
plot v(S1) 
plot v(S2) 
plot v(S3)
plot v(Cout)

.endc 
