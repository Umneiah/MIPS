module shift_left_2( sign_extend, input_2_ALU); 
input [31:0] sign_extend;
output [31:0] input_2_ALU;
reg [31:0] input_2_ALU;
always @(sign_extend)
begin
#5 input_2_ALU <= sign_extend<<2;                                  
end
endmodule
