module adder_nbit
	// Parameters section
	#( parameter N = 3) // but we can override this
	// Ports section
	(input [N-1:0] a,
	 input [N-1:0] b,
	 output reg [N:0] sum);
	 
	// Wildcard operator is best for the procedure's
	// sesitivity list
	always @(*) begin
		sum[N:0] = a[N-1:0] + b[N-1:0];
		//sum = a + b;
	end

endmodule

`timescale 1us/1ns
module tb_adder_nbit();

	parameter ADDER_WIDTH = 10;
	reg [ADDER_WIDTH-1:0] a;
	reg [ADDER_WIDTH-1:0] b;
	wire [ADDER_WIDTH:0] sum;
	
	// instantiate the parameterized DUT
	adder_nbit
	#(.N(ADDER_WIDTH))
	ADDER1
	(
		.a(a), .b(b), .sum(sum)
	);
	
	// create stimulus 
	initial begin
		$monitor($time, "a = %d, b = %d, sum = %d",a,b,sum);
		// testbench vars here
	end
	
endmodule