module full_adder_behaviour(
	input a,
	input b,
	input carry_in,
	// output reg because it is used in an always procedure
	output reg sum,
	output reg carry_out
	);
	
	always @(*) begin
		{carry_out,sum} = a + b + carry_in;
	end

endmodule