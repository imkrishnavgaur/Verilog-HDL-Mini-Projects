module clock_div3(input clock_in,
					input reset_n,
					output clock_out);
					
	// Internal variables for the FFs
	reg qa , qb, qc;
	
	// Flip-flop A - positive clock edge
	always @(posedge clock_in or negedge reset_n)
	begin 
		if(!reset_n)
			qa <= 1'b0;
		else 
			qa <= 	(~ qa) & (~qb);
	end
	
	// Flip-flop B - positive clock edge 
	always @(posedge clock_in or negedge reset_n)
	begin
		if(!reset_n)
			qb <= 1'b0;
		else 
			qb <= qa;
	end
	
	// Flip-flop C - negative clock edge
	always @(negedge clock_in or negedge reset_n)
	begin
		if(!reset_n)
			qc <= 1'b0;
		else
			qc <= qb;
		end
		
		//MAke the final OR Gate (makes 50% duty cycle)
		assign clock_out = qb | qc;
	
	endmodule