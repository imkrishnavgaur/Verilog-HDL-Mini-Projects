module tristate_buffer_1bit(
	input din,
	input sel,
	output dout
	);
	
	//tri-state buffer, active high en.
	bufif1 B1 (dout, din, sel);
	
endmodule