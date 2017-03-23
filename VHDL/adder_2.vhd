library IEEE;
USE IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity adder_2 is
   port( outPC : in std_logic_vector(31 downto 0);
         result_2 : out std_logic_vector(31 downto 0));
end adder_2;
architecture behave of adder_2 is
begin
result_2 <= outPC + "00000000000000000000000000000100";
end behave;