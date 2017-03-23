library IEEE;
USE IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adder_1 is
   port( PC_4,out1_sll : in std_logic_vector(31 downto 0);
         result : out std_logic_vector(31 downto 0));
end adder_1;

architecture behave of adder_1 is
begin
result <= PC_4 + out1_sll;

end behave;