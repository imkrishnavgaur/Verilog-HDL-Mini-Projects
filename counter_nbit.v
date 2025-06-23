module counter_nbit
	//Parameters Section
	#( parameter CNT_WIDTH = 3)
	// Ports Section
	(input clk,
	input reset_n,
	output reg [CNT_WIDTH-1:0] counter);
	
	// Use non blocking statements for sequential logic
	always @(posedge clk or negedge reset_n) begin
		if (!reset_n)
			counter <= 0;
		else 
			counter <= counter + 1'b1;
	end
endmodule