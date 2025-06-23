`timescale 1us/1ns
module tb_shift_register_piso();
	
	// Testbench variables 
	reg sdi;
	reg [3:0] d;
	reg preload;
	reg clk = 0;
	reg reset_n;
	wire sdo;
	
	// Instantiate the DUT
	shift_reg_piso PISO0(
		.reset_n(reset_n),
		.clk(clk),
		.d(d),
		.sdi(sdi),
		.pl(preload),
		.sdo(sdo)
	);
	
	// Create the clock signal
	always begin #0.5 clk = ~clk; end
	
	// Create stimulus
	initial begin
		#1; // apply reset to the circuit 
		reset_n = 0; sdi = 0; preload = 0; d = 0;
		#1.3; // release the reset 
		reset_n = 1;
		
		// Preload the register with the value 4'b0101 and let it shift
		@(posedge clk); d = 4'b0101; preload = 1; @(posedge clk); preload = 0;
		// Wait for the bits to shift
		repeat (5) @(posedge clk);
	end
	
	initial begin
		#20 $stop;
	end
endmodule