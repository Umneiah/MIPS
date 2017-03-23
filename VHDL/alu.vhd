library ieee;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY alu IS
port (
readData1, mux2 : IN std_logic_vector(31 DOWNTO 0); 
alucontrol : IN std_logic_vector(3 DOWNTO 0);
shamt : IN std_logic_vector(4 DOWNTO 0);
result : OUT std_logic_vector(31 DOWNTO 0);
zero : OUT std_logic
);
END alu;

ARCHITECTURE behave OF alu IS
BEGIN 
PROCESS(readData1, mux2, alucontrol)

VARIABLE readData1_uns : UNSIGNED(31 DOWNTO 0); --extend lsb bits with zeros
VARIABLE mux2_uns : UNSIGNED(31 DOWNTO 0); --we use variables to excute the commands in their order and not together 
VARIABLE result_uns : UNSIGNED(31 DOWNTO 0);
VARIABLE zero_uns : UNSIGNED(0 DOWNTO 0);
VARIABLE shamt_uns : UNSIGNED (4 DOWNTO 0);

BEGIN --initialize
readData1_uns := UNSIGNED(readData1);  
mux2_uns := UNSIGNED(mux2); -- := used with variables
shamt_uns := UNSIGNED (shamt); 
result_uns := (OTHERS => '0'); --default other cases=0
zero_uns(0) := '0'; 

CASE alucontrol IS --selection cases
-- add
WHEN "0010" =>
result_uns := (readData1_uns + mux2_uns);
-- sub
WHEN "0110" =>
result_uns := (readData1_uns - mux2_uns);
-- and
WHEN "0000" =>
result_uns := (readData1_uns AND mux2_uns);
-- or
WHEN "0001" =>
result_uns := readData1_uns OR mux2_uns;
-- sll
WHEN "0100" => 
result_uns := readData1_uns sll TO_INTEGER (shamt_uns) ;
--nor
WHEN "1100" =>
result_uns := readData1_uns NOR mux2_uns;
-- slt
WHEN "0111" =>
result_uns := readData1_uns - mux2_uns;
IF SIGNED(result_uns) < 0 THEN
result_uns := TO_UNSIGNED(1, result_uns'LENGTH);
ELSE
result_uns := (OTHERS => '0');
END if;
WHEN OTHERS => result_uns := (OTHERS => 'X');
END CASE;
IF TO_INTEGER(result_uns) = 0 THEN
zero_uns(0) := '1';
ELSE
zero_uns(0) := '0';
END IF;
result <= std_logic_vector(result_uns);
zero <= zero_uns(0);
END PROCESS;
END behave;
