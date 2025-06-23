`timescale 1us/1ns
module tb_tristate();

	reg din;
	reg sel;
	wire dout;
	
	//isnt DUT
	tristate_buffer_1bit TRI1(
		.din(din),
		.sel(sel),
		.dout(dout)
	);
	
	//gen stimulus
	initial begin
		$monitor(din,sel,dout);
	end
		
	initial begin
		#1; sel = 0; din = 0;
		#1; sel = 0; din = 1;
		#1; sel = 1; din = 0;
		#1; sel = 1; din = 1;
		#2; din = 0;
		#5; $stop;
	end 
	
endmodule
		