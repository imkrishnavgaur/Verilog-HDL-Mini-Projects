module half_adder_dataflow(
	input a;
	input b;
	output sum,
	output carry
	);
	
	// Dataflow uses continuous assignments
	assign sum = a^b; //a XOR b, LHS net type because it is continuously being asigned
	assign carry = a & b; // a AND b
	
endmodule