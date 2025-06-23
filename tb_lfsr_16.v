`timescale 1us/1ns
module tb_lfsr_16();
	
	// Testbench variables
	reg clk = 0;
	reg reset_n;
	reg enable;
	wire [15:0] lfsr;
	
	// Instantiate the DUT
	lfsr_16 LFSR(
		.clk(clk), .reset_n(reset_n), .enable(enable),
		.lfsr(lfsr)
	);
	
	always begin #0.5 clk = ~clk; end
	
	initial begin
		$monitor($time, " enable = %d, lfsr = 0x%x", enable, lfsr);
		#1; reset_n = 0; enable = 0;
		#1.2; reset_n = 1;
		repeat(2) @(posedge clk);
		enable = 1;
		
		repeat(10) @(posedge clk);
		enable = 0;
	end

	initialbegin
		#20 $stop;
	end
endmodule