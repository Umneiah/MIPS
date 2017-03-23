module PC (outPC , inPC , clk , reset ); 
  input [31:0] inPC;
  input clk , reset ;
  output reg [31:0] outPC ;
initial begin
outPC = 32'b0000000000000000000000000000000;
end
always @(posedge clk)
begin
if(reset == 1)
#5 outPC <= 32'b0;
else  
#5 outPC <= inPC;
end 
endmodule 

