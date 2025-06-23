module verilog_example_3();

	reg x = 1'b0;
	reg y = 1'b1;
	reg z;
	
	//A procedure example
	always @(z) begin
		$display("x=%b, y=%b, z=%b", x, y, z);
	end
	
	//another procedure 
	initial begin
		#2; //wait two time units 
		z = x^y; //bit-wise XOR bw x and y
		#10;
		y = 0;
		z = x | y; //bitwise or
		#10;
		z = ~z;
		#10;
	end
	
endmodule