`timescale 1us/1ns

module tb_gates();

	//declare nets and variables
	reg a,b,c;
	wire o1,o2,o3,o4,o10;
	
	//instantiate the DUT
	built_in_gates GATES1(
	.a(a), .b(b), .c(c), .o1(o1), .o2(o2), .o3(o3), .o4(o4), .o10(o10)
	);
	
	//generate stimulus 
	initial begin 
		#0.5; a = 1; b=0; c =1; 
		#1; a = 0; b=1;c=0;
		#2; a= 0; b=0;c=1;
		#1; a=1; b=1; c =1;
		#1; a=0; b =0; c =0;
		#5;
	end

endmodule