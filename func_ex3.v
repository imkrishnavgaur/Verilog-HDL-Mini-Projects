`timescale 1us/1ns
module func_ex3();

	// Recursive function example 
	function automatic integer factorial (input integer N);
		// Internal variable for intermediary result]
		// Have to be declared before "begin/end"
		integer result = 0;
		begin
			if (N==0)
				result = 1;
			else 
				result = N * factorial(N-1);
			
			factorial = result 
		end
	endfunction
	
	initial begin
		#1 $display ($time, " factorail(2) = %d", factorial(5));
	end
	
endmodule