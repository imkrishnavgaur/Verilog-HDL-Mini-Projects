`timescale 1us/1ns
module tb_shift_reg_siso();

	// Testbench variables 
	reg sdi;
	reg clk = 0;
	reg reset_n;
	wire sdo;
	
	// instantiate the DUT
	shift_reg_siso SISO0(
		.reset_n(reset_n),
		.clk(clk),
		.sdi(sdi),
		.sdo(sdo)
	);
	
	// Create the clock signal
	always begin #0.5 clk = ~clk; end
	
	// Create stimulus
	initial begin
		#1; // apply reset to the circuit
		reset_n = 0; sdi = 0;
		
		#1.3; // release reset
		reset_n = 1;
		
		// set sdi for 1 clock
		@(posedge clk); sdi = 1'b1; @(posedge clk); sdi = 1'b0;
		
		// wait for the bit to shift_reg_siso
		repeat (5) @(posedge clk);
		@(posedge clk); sdi = 1'b1;
		@(posedge clk);
		@(posedge clk); sdi = 1'b0;
	end
	
	// This will stop the simulator whrn the time expires 
	initial begin
		#40 $finish;
	end
endmodule