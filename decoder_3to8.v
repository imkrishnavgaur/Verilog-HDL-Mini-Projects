module decoder_3to8
	(input [2:0] a,
	 input enable,
	 output reg [7:0] y
	);
	
	//Whenever there is a change in the bus 'a' or 'enable' -> execute the always block.
	always @(a or enable) begin // wildcard could also be used 
		if (enable == 0)
			y = 6'b0;
		else 
			y = 1 << a;
	end

endmodule