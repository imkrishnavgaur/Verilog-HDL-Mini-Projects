module d_latch(
	input d,
	input enable,
	output q,
	output q_not
	);
	
	reg dlatch;
	
	// the dlatch is level sensitive
	always @(enable or d)
		if(enable)
			dlatch <= d;
	end
	
	assign q = dlatch;
	assign q_not = ~q;
	
endmodule