module adder(A, B, sum);
input [31:0] A, B;
output [31:0] sum;
assign #5 sum = A + B;
endmodule


module ALUes();
adder add_2(input_2_ALU, PC_4, ALU_result);
adder add_1(outPC ,32'b0000000000000000000000000100 ,PC_4);

endmodule 
