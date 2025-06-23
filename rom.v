module rom
		#(parameter WIDTH = 8,
		  parameter DEPTH = 16,
		  parameter DEPTH_LOG = $clog2(DPETH))
		(input clk,
		 input [DEPTH_LOG-1:0] addr_rd,
		 output reg [WIDTH-1:0] data_out
		);
	
	// Declare the RAM array
	reg [WIDTH-1:0] rom [0:DEPTH-1];
	
	// Load the ROM with the data from the rom_init.hex
	// Relative location depends on the Modelsim project location
	initial begin
		$readmemh("../rom_init.hex", rom, 0, DEPTH-1);
	end
	
	// Read is synchronous 
	always @(posedge clk) begin
		data_out <= rom[addr_rd];
	end
	
endmodule 