module qiangda(clk_50M,clk,Buzzer,ds,clr,in,add,stu,a,b,c,d,e,f,g);
input clk_50M,clr,add,stu;
output a,b,c,d,e,f,g;
output reg clk;
input [3:0] in;
output reg Buzzer;
output reg[7:0]ds;
reg EnFlat,Buclk;
reg [3:0] cnt,score1,score2,score3,score4,person;
reg answer = 3'd0;
reg [3:0] BuL;
reg [3:0] out;
assign h = 1'b0;
initial
	begin
		cnt = 4'b1111;
		score1 = 4'b0000;
		score2 = 4'b0000;
		score3 = 4'b0000;
		score4 = 4'b0000;
		person = 4'b0000;
		BuL = 4'd0;
		EnFlat = 1'b1;
		Buclk = 1'b0;
		Buzzer = 1'b1;
	end
m_4(clk_50M,clk,1);
always @(posedge clk)
	begin
		if(EnFlat == 1'b1)
		begin
			if(in == 4'b1000)
			begin
				EnFlat = 1'b0;
				person = 4'b1010;
				Buclk = 1'b1;
				answer = 3'd1;
			end
			else if(in == 4'b0100)
			begin
				EnFlat = 1'b0;
				person = 4'b1011;
				Buclk = 1'b1;
				answer = 3'd2;
			end
			else if(in == 4'b0010)
			begin
				EnFlat = 1'b0;
				person = 4'b1100;
				Buclk = 1'b1;
				answer = 3'd3;
			end
			else if(in == 4'b0001)
			begin
				EnFlat = 1'b0;
				person = 4'b1101;
				Buclk = 1'b1;
				answer = 3'd4;
			end
		end
		else
		begin
			case (answer)
					3'd1:begin if(add) begin score1 = score1 + 1;EnFlat = 1'b1;cnt = 4'b1111;end else if(stu) begin score1 = score1 - 1;EnFlat = 1'b1;cnt = 4'b1111;end end
					3'd2:begin if(add) begin score2 = score2 + 1;EnFlat = 1'b1;cnt = 4'b1111;end else if(stu) begin score2 = score2 - 1;EnFlat = 1'b1;cnt = 4'b1111;end end
					3'd3:begin if(add) begin score3 = score3 + 1;EnFlat = 1'b1;cnt = 4'b1111;end else if(stu) begin score3 = score3 - 1;EnFlat = 1'b1;cnt = 4'b1111;end end
					3'd4:begin if(add) begin score4 = score4 + 1;EnFlat = 1'b1;cnt = 4'b1111;end else if(stu) begin score4 = score4 - 1;EnFlat = 1'b1;cnt = 4'b1111;end end
			endcase
		end
		if(clr)
		begin
			EnFlat = 1'b1;
			person = 4'b0000;
			Buzzer = 1'b1;
			Buclk = 1'b0;
			score1 = 4'b0000;score2 = 4'b0000;score3 = 4'b0000;score4 = 4'b0000;
			cnt = 4'b1111;
		end
		if(EnFlat == 1'b1)
		begin
			if(BuL < 4'd1000)BuL = BuL + 4'd1;
			else
			begin
				BuL = 4'd0;
				if(cnt > 4'b0000) cnt = cnt - 1;
				if(cnt == 4'b0000)
				begin
					EnFlat = 1'b0;
					Buclk = 1'b1;
				end
				if(Buclk == 1'b1)
				begin
					if(Buzzer == 1'b0) begin Buzzer = 1'b1;Buclk = 1'b0; end
					else Buzzer = 1'b0;
				end
			end
		end
		
	end
BCD(clk,1,cnt,person,score1,score2,score3,score4,out,a,b,c,d,e,f,g,h,ds);
endmodule