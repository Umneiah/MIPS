module mux_2_to_1(in1, in2 , sel , out);
input [31:0] in1 , in2;
input sel ;
output reg [31:0] out;
always @(in1, in2 , sel )
begin 
case ( sel)
1'b0: #5 out = in1 ;
1'b1: #5 out = in2 ;
endcase
end
endmodule 



