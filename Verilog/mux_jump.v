module mux_jump(in1, in2 , sel , out);
input [31:0] in1 , in2;
input sel ;
output reg [31:0] out;
always @(in1 , in2 ,sel)
begin 
case (sel)
1'b1: out = in1 ;
1'b0: out = in2 ;
endcase
end
endmodule 
