module mux_4_to_1(in1, in2 , a , b , sel , out);
input [31:0] in1, in2 , a , b;
input [1:0] sel;
output reg [31:0]  out ;
assign #5 a = 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
assign #5 b = 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz ;
always @ (in1, in2, sel)
begin 
case(sel)
2'b01 : #5 out = in1 ;
2'b00 : #5 out = in2 ;
2'b10 : #5 out = a ;
2'b11 : #5 out = b ; 
endcase
end 
endmodule 
