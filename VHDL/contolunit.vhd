
entity controlunit is 
port (op: IN bit_vector (5 downto 0);
memtoreg: OUT bit_vector (1 downto 0);
memwrite: OUT bit;
branch, alusrc: OUT bit;
regdst: OUT BIT_VECTOR (1 downto 0);
regwrite: OUT bit; 
memread: OUT bit;
jump: OUT bit;
aluop: OUT BIT_VECTOR (2 downto 0));
end;

architecture behave of controlunit is

Constant RType : bit_vector(5 Downto 0) := "000000";
Constant lw : bit_vector(5 Downto 0) := "100011";
Constant sw: bit_vector(5 Downto 0) := "101011";
Constant BEQ : bit_vector(5 Downto 0) := "000100";
Constant ADDI : bit_vector(5 Downto 0) := "001000";
Constant JAL : bit_vector(5 Downto 0) := "000011";
Constant ANDI : bit_vector(5 Downto 0) := "001100";
begin
process(op) 
begin
if (op = RType) then --Rtype
			regwrite <= '1';
			regdst <= "01"; 
			alusrc <= '0'; 
			branch <= '0'; 
			memwrite <= '0'; 
			memtoreg <= "00"; 
			jump <= '0'; 
			memread <= '0'; 
			aluop <= "010";

elsif (op = lw) then  --LW

			regwrite <= '1';
			regdst <= "00";
			alusrc <= '1';
			branch <= '0';
			memwrite <= '0';
			memtoreg <= "01";
			jump <= '0';
			memread <= '1';
			aluop <= "000";

elsif(op = sw)then --SW

			regwrite <= '0';
			regdst <= "00";
			alusrc <= '1';
			branch <= '0';
			memwrite <= '1';
			memtoreg <= "01";
			jump <= '0';
			memread <= '0';
			aluop <= "000";

elsif(op = BEQ)then --BEQ

			regwrite <= '0';
			regdst <= "00";
			alusrc <= '0';
			branch <= '1';
			memwrite <= '0';
			memtoreg <= "00";
			jump <= '0';
			memread <= '0';
			aluop <= "001";

elsif (op = ADDI) then --ADDI

			regwrite <= '1';
			regdst <= "00";
			alusrc <= '1';
			branch <= '0';
			memwrite <= '0';
			memtoreg <= "00";
			jump <= '0';
			memread <= '0';
			aluop <= "000";

elsif (op = JAL)then --Jal 

			regwrite <= '1';
			regdst <= "00";
			alusrc <= '0';
			branch <= '0';
			memwrite <= '0';
			memtoreg <= "10";
			jump <= '1';
			memread <= '0';
			aluop <= "000";

elsif (op = ANDI)then --Andi 

			regwrite <= '1';
			regdst <= "00";
			alusrc <= '1';
			branch <= '0';
			memwrite <= '0';
			memtoreg <= "00";
			jump <= '0';
			memread <= '0';
			aluop <= "101";
END if;

end process;
end behave;