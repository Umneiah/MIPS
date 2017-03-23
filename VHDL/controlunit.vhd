library IEEE;
USE IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity controlunit is 
port (op: IN std_logic_vector (5 downto 0);
memtoreg: OUT std_logic_vector (1 downto 0);
memWrite: OUT std_logic;
branch, alu_src: OUT std_logic;
reg_dst: OUT std_logic_vector (1 downto 0);
writeEn: OUT std_logic;
memRead: OUT std_logic;
jump: OUT std_logic;
aluop: OUT std_logic_vector (2 downto 0));
end;

architecture behave of controlunit is

Constant RType : std_logic_vector(5 Downto 0) := "000000";
Constant lw : std_logic_vector(5 Downto 0) := "100011";
Constant sw: std_logic_vector(5 Downto 0) := "101011";
Constant BEQ : std_logic_vector(5 Downto 0) := "000100";
Constant ADDI : std_logic_vector(5 Downto 0) := "001000";
Constant JAL : std_logic_vector(5 Downto 0) := "000011";
Constant ANDI : std_logic_vector(5 Downto 0) := "001100";
begin
process(op) 
begin
if (op = RType) then --Rtype
			writeEn <= '1';
			reg_dst <= "01"; 
			alu_src <= '0'; 
			branch <= '0'; 
			memWrite <= '0'; 
			memtoreg <= "00"; 
			jump <= '0'; 
			memRead <= '0'; 
			aluop <= "010";

elsif (op = lw) then  --LW

			writeEn <= '1';
			reg_dst <= "00";
			alu_src <= '1';
			branch <= '0';
			memWrite <= '0';
			memtoreg <= "01";
			jump <= '0';
			memRead <= '1';
			aluop <= "000";

elsif(op = sw)then --SW

			writeEn <= '0';
			reg_dst <= "00";
			alu_src <= '1';
			branch <= '0';
			memWrite <= '1';
			memtoreg <= "01";
			jump <= '0';
			memRead <= '0';
			aluop <= "000";

elsif(op = BEQ)then --BEQ

			writeEn <= '0';
			reg_dst <= "00";
			alu_src <= '0';
			branch <= '1';
			memWrite <= '0';
			memtoreg <= "00";
			jump <= '0';
			memRead <= '0';
			aluop <= "001";

elsif (op = ADDI) then --ADDI

			writeEn <= '1';
			reg_dst <= "00";
			alu_src <= '1';
			branch <= '0';
			memWrite <= '0';
			memtoreg <= "00";
			jump <= '0';
			memRead <= '0';
			aluop <= "000";

elsif (op = JAL)then --Jal 

			writeEn <= '1';
			reg_dst <= "00";
			alu_src <= '0';
			branch <= '0';
			memWrite <= '0';
			memtoreg <= "10";
			jump <= '1';
			memRead <= '0';
			aluop <= "000";

elsif (op = ANDI)then --Andi 

			writeEn <= '1';
			reg_dst <= "00";
			alu_src <= '1';
			branch <= '0';
			memWrite <= '0';
			memtoreg <= "00";
			jump <= '0';
			memRead <= '0';
			aluop <= "101";
END if;

end process;
end behave;
