module adder_PC_4(outPC  , adder_out);
input [31:0] outPC  ;
output reg [31:0] adder_out ;
//assign #5 constant = 32'b0000000000000000000000000001 ;
always @ (outPC)
 adder_out = outPC + 32'b0000000000000000000000000001 ;
endmodule
