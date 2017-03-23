module instruction_fetch (address , instruction );
input [31:0] address;
output reg [31:0] instruction;
reg [31:0] instruction_memory_array [0:39];

initial begin 
#10 $readmemb ("machinecode1.txt" , instruction_memory_array );
end 
always @ (address) 
begin
#5 assign instruction = instruction_memory_array [address];
end 
endmodule 
