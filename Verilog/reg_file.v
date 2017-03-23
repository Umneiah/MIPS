module reg_file(readAddress1, readAddress2, writeAddress, clk, writeEn, writeData ,  readData1, readData2);
input writeEn, clk ;
input [4:0] readAddress1, readAddress2, writeAddress ;
input [31:0] writeData;
output reg [31:0] readData1, readData2;
 reg [31:0] Mem[0:31];
initial begin
#10 $readmemb ("memory.list" , Mem);
end
always@(posedge clk) 
begin
       
        #5 readData1 <= Mem[readAddress1];
        #5 readData2 <= Mem[readAddress2];
        end
       
always@(negedge clk )
begin

 if (writeEn==1)
        begin
        #5 Mem[writeAddress]<= writeData;
        end
end

endmodule
