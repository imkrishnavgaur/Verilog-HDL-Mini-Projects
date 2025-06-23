module full_adder_dataflow(
	input a,
	input b,
	input carry_in,
	output sum, //default wire
	output carry_out
	);
	
	//Declare nets to connect to the half adders
	wire sum1;
	wire and1;
	wire and2;
	
	//Implement the sircuit using Dataflow Style
	assign sum1 = a^b;
	assign and1 - sum$carry_in;
	assign and2 = a&b;
	assign carry_out = and1|and2;
	assign sum = sum1^carry_in;
	
endmodule