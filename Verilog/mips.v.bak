module mips ;
wire [31:0]  inPC  , outPC , write_data , read_data_1 , read_data_2 , immediate_out , input_2_upper_ALU      
             , input_2_ALU , alu_1_result , read_data, instruction ,alu_2_result ,PC_branch ,jump_adress  , PC_4  ;
wire  regwrite , zero , memread , memwrite  , branch , alusrc  , reset  ,
     jump ,  Branch_adder_out  ;
wire [1:0] regdst ,  memtoreg ;
wire [2:0] aluop ;
wire [5:0] op , funct ;
wire [4:0] rs , rt , rd , shamt ,write_reg   ;
wire [3:0] alucontrol;
wire [15:0] immediate_in;
wire [25:0] jr;
reg clk =0;
//reg [5:0] i ; reg [31:0] instruction_fetched ;
parameter a = 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
parameter b = 5'bzzzzz;
parameter constant = 32'b0000000000000000000000000100;
parameter ra = 5'b11111;
always #350 clk = ~clk ;


//always @(clk)
//begin
//for (i=0 ; i<=50 ; i = i+1)
//begin
//assign instruction_fetched = i;
//assign inPC = instruction_fetched + 1  ;
//end
//end
PC  pc1(outPC , inPC , clk , reset); //tmam
instruction_fetch  IF(outPC , instruction ); //tmam
Instruction_decoder  ID(op , rs , rt , rd , shamt , funct , immediate_in , jr , instruction); //tmam
mux_regdst  mux_5bits(rt, rd ,ra ,b , regdst , write_reg); //tmam
reg_file   rf1(rs , rt , write_reg , clk , regwrite , write_data , read_data_1 , read_data_2); //tmam
sign_extention  se1(immediate_in,immediate_out);//tmam
mux_2_to_1   mux_alusrc(read_data_2 , immediate_out , alusrc , input_2_ALU );//tmam
alucontroller  alucontrol1(funct , aluop , alucontrol);//tmam
alu_32bit   alu1( alucontrol, read_data_1, input_2_ALU, shamt , alu_1_result , zero) ; //tmam
memory   mem( alu_1_result ,  memread , memwrite ,read_data_2 , read_data ) ; //tmam
mux_memtoreg MUX2(read_data , alu_1_result , PC_4 , a , memtoreg ,  write_data); //tmam
controlunit  cu1(op, memtoreg, memwrite, memread,branch, alusrc,regdst, regwrite,jump,aluop); //tmam
adder_PC_4  add1(outPC  , PC_4); //tmam
shift_left_2_Jump   sf1( jr, PC_4 , jump_adress);//tmam
shift_left_2   sf2( immediate_out , input_2_upper_ALU); //tmam
adder  add_2( PC_4 , input_2_upper_ALU , alu_2_result); //tmam
and  a1 ( Branch_adder_out , branch ,zero); //tmam
mux_2_to_1  mux_branch_adder_out(PC_4, alu_2_result , Branch_adder_out , PC_branch); //tmam
mux_jump   mux_jumb ( jump_address , PC_branch ,jump , inPC); //tmam
//end 
//end
endmodule 
