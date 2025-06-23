module testbench();

	// declare variables and nets for module ports
	reg a;
	reg b;
	wire sum;
	wire carry;
	
	// instatiate the module using the "dot name" style
	half_adder_structural HALF_ADD(
	.a(a), //name of port then name of variable 
	.b(b),
	.sum(sum),
	.carry(carry),
	);
	
	// Generate stimulus and monitor module ports
	initial begin
		$monitor("a =%b, b =%b, sum =%b, carry =%b", a, b, sum, carry);
	end
	
	inital begin
		#1; a = 0; b =0;
		#1; a = 0; b =1;
		#1; a = 1; b =0;
		#1; a = 1; b =1;
		#1; a = 0; b =0;
	end
	
endmodule