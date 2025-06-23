module half_adder_structural;(
	input a,
	input b,
	output sum,
	output carry
	);
	
	// instantiate verilog built-in primitives and connect them with nets
	xor XOR1 (sum, a, b);
	and AND1 (carry, a, b);
	
endmodule