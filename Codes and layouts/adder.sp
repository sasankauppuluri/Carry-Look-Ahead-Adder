Adder Suryasasanka_2019102036
.include TSMC_180nm.txt
.param SUPPLY=1.8
.param LAMBDA=0.09u
.param width=10*LAMBDA
.global gnd vdd

VDD vdd gnd 'SUPPLY'
*vin_a DA0 0 pulse  1.8 0 0ns 100ps 100ps 100ns 200ns
vin_a DA0 0 pulse  0 1.8 0ns 100ps 100ps 100ns 200ns
*vin_a1 DA1 0 pulse 1.8 0 0ns 100ps 100ps 100ns 200ns
vin_a1 DA1 0 pulse 0 1.8 0ns 100ps 100ps 100ns 200ns
*vin_a2 DA2 0 pulse 1.8 0 0ns 100ps 100ps 100ns 200ns
vin_a2 DA2 0 pulse 0 1.8 0ns 100ps 100ps 100ns 200ns
*vin_a3 DA3 0 pulse 1.8 0 0ns 100ps 100ps 100ns 200ns
vin_a3 DA3 0 pulse 0 1.8 0ns 100ps 100ps 100ns 200ns

*vin_b DB0 0 pulse  1.8 0 0ns 100ps 100ps 100ns 200ns
vin_b DB0 0 pulse  0 1.8 0ns 100ps 100ps 100ns 200ns
*vin_b1 DB1 0 pulse 1.8 0 0ns 100ps 100ps 100ns 200ns
vin_b1 DB1 0 pulse 0 1.8 0ns 100ps 100ps 100ns 200ns
*vin_b2 DB2 0 pulse 1.8 0 0ns 100ps 100ps 100ns 200ns
vin_b2 DB2 0 pulse 0 1.8 0ns 100ps 100ps 100ns 200ns
vin_b3 DB3 0 pulse 1.8 0 0ns 100ps 100ps 100ns 200ns
*vin_b3 DB3 0 pulse 0 1.8 0ns 100ps 100ps 100ns 200ns



vin_cin C0 0 pulse 1.8 0 0ns 100ps 100ps 100ns 200ns
vin_clk clk 0 pulse 1.8 0 0ns 100ps 100ps 25ns 50ns


.subckt not y x 
.param width_N={width}
.param width_P={2*width}

M1 y x gnd gnd CMOSN W={width_N} L={2*LAMBDA}
+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M2 y x vdd vdd CMOSP W={width_P} L={2*LAMBDA}
+AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
.ends not

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

*---------------------------------- Input D-flipflop
x101 clk DA0 A0 A0_bar d_ff
x102 clk DA1 A1 A1_bar d_ff
x103 clk DA2 A2 A2_bar d_ff
x104 clk DA3 A3 A3_bar d_ff
x105 clk DB0 B0 B0_bar d_ff
x106 clk DB1 B1 B1_bar d_ff
x107 clk DB2 B2 B2_bar d_ff
x108 clk DB3 B3 B3_bar d_ff


*----------------------------------P and G block
x1 A0 B0 P0 xor 
x2 A1 B1 P1 xor
x3 A2 B2 P2 xor
x4 A3 B3 P3 xor

x5 A0 B0 G0 and
x6 A1 B1 G1 and
x7 A2 B2 G2 and
x8 A3 B3 G3 and
*------------------------------CLA block

V_c1 C1 G0 '0'           $G0

x9 P1 G0 PG10 and	 $P1G0
x10 G1 PG10 C2 or	 $G1+P1G0

x11 P2 PG10 PPG210 and   $P2P1G0 
x12 P2 G1 PG21 and  	 $P2G1
x13 PG21 PPG210 PGPPG or $P2G1+P2P1G0
x14 G2 PGPPG C3 or 	 $C3=G2+P2G1+P2P1G0

x15 P3 PPG210 PPPG3210 and   $P3P2P1G0
x16 P3 PG21 PPG321 and       $P3P2G1
x17 PPPG3210 PPG321 last1 or $P3P2G1+P3P2P1G0

x18 P3 G2 PG32 and           $P3G2
x19 G3 PG32 last2 or         $G3+P3G2

x20 last2 last1 Cout or	     $G3+P3G2+P3P2G1+P3P2P1G0
  
*----------------Sum block

x21 P0 C0 S0 xor
x22 P1 C1 S1 xor
x23 P2 C2 S2 xor
x24 P3 C3 S3 xor

*----------------Output D-flipflop
x201 clk S0 Q0 Q0_bar d_ff
x202 clk S1 Q1 Q1_bar d_ff
x203 clk S2 Q2 Q2_bar d_ff
x204 clk S3 Q3 Q3_bar d_ff
x205 clk Cout Q4 Q4_bar d_ff 

.tran 0.1n 100n




.control
set hcopypscolor = 1
set color0=white
set color1=black

run
plot v(clk)

plot v(DA0)
plot v(DA1)
plot v(DA2)
plot v(DA3)

plot v(DB0)
plot v(DB1)
plot v(DB2)
plot v(DB3)

plot v(Q0)
plot v(Q1)
plot v(Q2)
plot v(Q3)
plot v(Q4)

.endc
      
