
module mux_regdst(in1, in2 , ra , b , sel , out);
input [4:0] in1, in2 ,ra , b ;
input [1:0] sel;
output reg [4:0]  out ;
assign #5  ra = 5'b11111 ;
assign #5 b = 5'bxxxxx ;
always @ (in1, in2, sel)
begin 
case(sel)  
2'b00 : #5 out = in1 ;
2'b01 : #5 out = in2 ;
2'b10 : #5 out = ra ;
2'b11 : #5 out = b ; 
endcase
end 
endmodule 

