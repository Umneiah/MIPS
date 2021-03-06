module memory( address ,  memRead , memWrite , writeData , readData ) ;
input [31:0] address, writeData ;
input memRead ;
input memWrite ;                      
output [31:0] readData ;
reg [31:0] readData ;
reg [31:0] data_mem [0:50] ;
//reg clk;
initial begin
 #10  $readmemb("memory.list",data_mem);
end
always @ ( address ) 
  begin
 
    if ( memRead == 0 && memWrite == 1 ) //&& clk == 1 )	//sw			
      begin
      data_mem[address] <= writeData ;
      end
    else if ( memRead == 1 && memWrite == 0 ) //&& clk == 1)	//lw
      begin
     readData <= data_mem[address];
      end
  end
endmodule 
