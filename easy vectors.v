module easy_vectors();

	reg [7:0] a = 0;
	wire [1:0] c;
	wire [1:0] d;
	
	assign c[1:0] = a[3:2];
	assign d[1:0] = a[2:3];
	
	initial begin
		$monitor("PROC2 a=%b, c=%b, d=%b",a, c, d);
		$monitor("PROC2 a=%b, c=%b",a, c);
	end
	
	initial begin
		#1 a = 8'b1010_1010;
		#1 a = 8'b0101_0101;
	end
	
endmodule