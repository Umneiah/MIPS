module alucontroller (input [5:0] funct,
input [2:0] aluop,
output reg [3:0] alucontrol);

always @ (*)
begin
case (aluop)
2'b00:  #5 alucontrol <= 3'b010;  //add
2'b01: #5 alucontrol <= 3'b110;  //sub
default: case(funct) 
6'b100000: #5 alucontrol <= 4'b0010;  //ADD
6'b100100: #5 alucontrol <= 4'b0000;  //AND
6'b101010: #5 alucontrol <= 4'b0111;  //SLT 
6'b100111: #5 alucontrol <= 4'b1100;  //NOR
6'b000000: #5 alucontrol <= 4'b0100;  //SLL
6'b001000: #5 alucontrol <= 4'b1111;  //jar
6'b100101: #5 alucontrol <= 4'b0110;  //or
6'b100010: #5 alucontrol <= 4'b0001;  //sub
/*parameter   AND = 4'b0000;
parameter   OR  = 4'b0001;
parameter   ADD = 4'b0010;
parameter   SUB = 4'b0110;
parameter   SLT = 4'b0111;
parameter   NOR = 4'b1100;
parameter   SLL = 4'b1101;*/
endcase
endcase
end
endmodule
