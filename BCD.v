module BCD(clk,en,in1,in2,in3,in4,in5,in6,out,a,b,c,d,e,f,g,h,ds);
	input [3:0] in1,in2,in3,in4,in5,in6;
	input en;
	reg [2:0] sel;
	output [3:0] out;
	output a,b,c,d,e,f,g,h;
	assign h = 1'b0;
	output reg[7:0]ds;
	//reg a,b,c,d,e,f,g;
	input clk;
	initial
	begin
		ds = 8'b01111111;
	end
	always @(posedge clk)
	begin
		ds <= {ds[0],ds[7:1]};
	end
	always @(ds)
	begin
		case (ds)
			8'b01111111:sel = 3'b111;
			8'b10111111:sel = 3'b110;
			8'b11011111:sel = 3'b101;
			8'b11101111:sel = 3'b100;
			8'b11110111:sel = 3'b011;
			8'b11111011:sel = 3'b010;
			8'b11111101:sel = 3'b001;
			8'b11111110:sel = 3'b000;
		endcase
	end
	LED8_1(en,in1,in2,in3,in4,in5,in6,sel,out);
	BCD_7(out,a,b,c,d,e,f,g);
endmodule