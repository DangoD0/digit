module LED8_1(en,in1,in2,in3,in4,in5,in6,sel,out);
	input [3:0] in1,in2,in3,in4,in5,in6;
	input en;
	input [2:0] sel;
	output [3:0] out;
	reg [3:0] out;
	always @(en,in1,in2,in3,in4,in5,in6,sel)
	begin
		if(!en) out = 4'b1111;
		else case(sel)
			3'b000:out = in6;
			3'b001:out = in5;
			3'b010:out = in4;
			3'b011:out = in3;
			3'b100:out = 4'b0000;
			3'b101:out = in2;
			3'b110:out = 4'b0000;
			3'b111:out = in1;
		endcase
	end
endmodule