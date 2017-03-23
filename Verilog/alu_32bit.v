module alu_32bit ( alu_control, readData1, mux, shamt , result , zero) ;

input  [3:0]  alu_control ;
input  [31:0] mux ;
input  [31:0] readData1 ;

input [4:0] shamt;
output reg zero ; 
output [31:0] result ;

reg [31:0] result ;

parameter   AND = 4'b0000;
parameter   OR  = 4'b0110;
parameter   ADD = 4'b0010;
parameter   SUB = 4'b0001;
parameter   SLT = 4'b0111;
parameter   NOR = 4'b1100;
parameter   SLL = 4'b0100;
always@ (readData1, mux , shamt)
  begin
 #30
   assign result = (alu_control == AND ) ? readData1 & mux :
                    (alu_control == OR )  ? readData1 | mux :
                    (alu_control == ADD ) ? readData1 + mux :
                    (alu_control == SUB ) ? readData1 - mux :
                    ((alu_control == SLT) && (readData1 < mux) )  ? 1'b1 :
                    ((alu_control == SLT) && (readData1 > mux) )  ? 1'b0 :
                    (alu_control == NOR ) ? ~(readData1 | mux)  :
                    (alu_control == SLL ) ? readData1 << shamt : 32'b00000000000000000000000000000000 ;
   #5 assign zero = (result==0) ?  1'b1 : 1'b0 ;
  end 
endmodule 



