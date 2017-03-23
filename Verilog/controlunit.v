module controlunit(input [5:0] op,
output reg [1:0] memtoreg, 
output reg memwrite, memread,
output reg branch, alusrc,
output reg [1:0] regdst, 
output reg regwrite,
output reg jump,
output reg [2:0] aluop);

always @ (*)
begin
if (op == 6'b000000) //Rtype
begin
#5 regwrite <= 1'b1;
#5 regdst <= 2'b1; 
#5 alusrc <= 1'b0; 
#5 branch <= 1'b0; 
#5 memwrite <= 1'bx; 
#5 memtoreg <= 1'b0; 
#5 jump <= 1'b0; 
#5 memread <= 1'bx; 
#5 aluop <= 2'b10;
end
//////////
else if (op == 6'b100011)  //LW
begin
#5 regwrite <= 1'b1;
#5 regdst <= 2'b0;
#5 alusrc <= 1'b1;
#5 branch <= 1'b0;
#5 memwrite <=1'b0;
#5 memtoreg <= 2'b1;
#5 jump <= 1'b0;
#5 memread <= 1'b1;
#5 aluop <= 2'b00;
end
///////
else if(op == 6'b101011) //SW
begin
#5 regwrite <= 1'b0;
#5 regdst <= 2'b0;
#5 alusrc <= 1'b1;
#5 branch <= 1'b0;
#5 memwrite <= 1'b1;
#5 memtoreg <= 2'bxx;
#5 jump <= 1'b0;
#5 memread <= 1'b0;
#5 aluop <= 2'b00;
end
//////////
else if (op == 6'b000100) //BEQ
begin
#5 regwrite <= 1'b0;
#5 regdst <= 2'bx;
#5 alusrc <= 1'b0;
#5 branch <= 1'b1;
#5 memwrite <= 1'bx;
#5 memtoreg <= 2'bx;
#5 jump <= 1'bx;
#5 memread <= 1'bx;
#5 aluop <= 2'b01;
end
//////////
else if (op == 6'b001000)  //ADDI
begin
#5 regwrite <= 1'b1;
#5 regdst <= 2'b0;
#5 alusrc <= 1'b1;
#5 branch <= 1'b0;
#5 memwrite <= 1'b0;
#5 memtoreg <= 1'b0;
#5 jump <= 1'b0;
#5 memread <= 1'b0;
#5 aluop <= 2'b00;
end
//////////
else if (op == 6'b000011) //Jal 
begin
#5 regwrite <= 1'bx;
#5 regdst <= 2'b10;
#5 alusrc <= 1'bx;
#5 branch <= 1'b0;
#5 memwrite <= 1'bx;
#5 memtoreg <= 2'b10;
#5 jump <= 1'b1;
#5 memread <= 1'bx;
#5 aluop <= 2'bxx;
end
/////////
else if (op == 6'b001100) //Andi 
begin
#5 regwrite <= 1'b1;
#5 regdst <= 2'b00;
#5 alusrc <= 1'b1;
#5 branch <= 1'b0;
#5 memwrite <= 1'b0;
#5 memtoreg <= 2'b00;
#5 jump <= 1'b0;
#5 memread <= 1'b0;
#5 aluop <= 3'b101;
end
end
endmodule 
