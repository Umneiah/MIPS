module Instruction_decoder (out1 , out2 , out3 , out4 , out5 , out6 , out7 , out8 , in);
input [31:0] in;
output reg[5:0] out1;
output  reg [4:0] out2;
output  reg [4:0] out3;
output reg [4:0] out4;
output reg [4:0] out5;
output reg [5:0] out6;
output reg [15:0] out7;
output reg [25:0] out8;
always @ (in) 
begin
case(in[31:26])
0:begin #30 // add , sll , jr , slt , and , nor
 assign  out1 = in[31:26];
 assign  out2 = in[25:21]; 
 assign  out3 = in[20:16]; 
 assign  out4 = in[15:11]; 
 assign  out5 = in[10:6]; 
 assign  out6 = in[5:0];
 assign  out7 = 16'bz;
 assign  out8 = 26'bz;
 //assign {out1 , out2 , out3 , out4 , out5 , out6 } = in ;
end
8:begin #30 //addi(001000)
 assign  out1 = in[31:26];
 assign  out2 = in[25:21];
 assign  out3 = in[20:16];
 assign  out4 = 5'bz;
 assign  out5 = 5'bz;
 assign  out6 = 6'bz;
 assign  out7 = in[15:0];
 assign  out8 = 26'bz;
end
4:begin #30 //branch(000100)
 assign  out1 = in[31:26];
 assign  out2 = in[25:21];
 assign  out3 = in[20:16];
 assign  out4 = 5'bz;
 assign  out5 = 5'bz;
 assign  out6 = 6'bz;
 assign  out7 = in[15:0];
 assign  out8 = 26'bz;
end

35:begin #30 //lw (100011)
 assign  out1 = in[31:26];
 assign  out2 = in[25:21];
 assign  out3 = in[20:16];
 assign  out4 = 5'bz;
 assign  out5 = 5'bz;
 assign  out6 = 6'bz;
 assign  out7 = in[15:0];
 assign  out8 = 26'bz;
end
43:begin #30 //sw(101011)
 assign  out1 = in[31:26];
 assign  out2 = in[25:21];
 assign  out3 = in[20:16];
 assign  out4 = 5'bz;
 assign  out5 = 5'bz;
 assign  out6 = 6'bz;
 assign  out7 = in[15:0];
 assign  out8 = 26'bz;
end
3:begin #30 // jal(000011)
 assign  out1 = in[31:26];
 assign  out2 = 5'bz;
 assign  out3 = 5'bz;
 assign  out4 = 5'bz;
 assign  out5 = 5'bz;
 assign  out6 = 6'bz;
 assign  out7 = 16'bz;
 assign  out8 = in[25:0];
end

12:begin #30 // andi (001100)
 assign  out1 = in[31:26];
 assign  out2 = in[25:21];
 assign  out3 = in[20:16];
 assign  out4 = 5'bz;
 assign  out5 = 5'bz;
 assign  out6 = 6'bz;
 assign  out7 = in[15:0];
 assign  out8 = 26'bz;
end

/*default #30
begin
assign  out1 = 0 ;
assign  out2 = 0 ;
assign  out3 = 0 ;
assign  out4 = 0 ;
assign  out5 = 0 ;
assign  out6 = 0 ;
assign  out7 = 0 ;
assign  out8 = 0 ;
end*/
endcase
end
endmodule 
