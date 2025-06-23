`timescale 1us/1ns //mandatory because we have delays
module built_in_gates(
	// declare moduleles inputs and outputs 
	input a,b,c,
	output o1,o2,o3,o4,o10
	);
	
	//gates without delays 
	and and1 (o1, a, b);
	nand (o2, c, d);
	buf buf1 (o3, c);
	
	//gates with delays 
	buf #1 buf_dly (o10,c);
	and #3 (o4, a, b);
	
endmodule