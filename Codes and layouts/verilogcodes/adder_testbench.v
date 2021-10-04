`timescale 1ns / 1ps
module adder_tb;

reg [3:0] a,b;
reg clk;
wire [4:0] sum;

adder uut (clk, a, b, sum);

initial begin
	$dumpfile ("adder_o.vcd");
	$dumpvars (0,adder_tb);
	clk = 0;
	#10; 
	a=3;
	b=4;
	#10; 
	
	a=5;
	b=7;
	#10;

//	a=8; 
//	b=2;
	$finish;
end
always #5  clk = ~clk ;

endmodule
