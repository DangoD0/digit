module m_4(clk_50mhz,clk_5hz,rst);
input clk_50mhz,rst;
output clk_5hz;
reg clk_5hz;
reg [31:0]cntl;
parameter N = 50000;

always @(posedge clk_50mhz)
if(!rst)
 begin
  cntl<=1'b0;
  clk_5hz<=1'b0;
 end
else 
 if(cntl<N/2-1)
  cntl<= cntl+1'b1;
 else
  begin 
   cntl<=1'b0;
   clk_5hz<=~clk_5hz;
  end
endmodule