library IEEE;
USE IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity PC is 
port (outPC: out std_logic_vector(31 downto 0) := "00000000000000000000000000000000"  ;
PC_in: in std_logic_vector (31 downto 0); clk , reset: in std_logic);
end PC;

architecture PC_code of PC is 

begin
process(clk , reset)
begin
if reset = '1' then 
outPC <= "00000000000000000000000000000000" ;
elsif clk = '1' and clk'event then
outPC <= PC_in;
end if;
end process;
end PC_code;


