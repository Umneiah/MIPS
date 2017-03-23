library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity andGate is	
   port( branch, zero : in std_logic;
            add_out : out std_logic );
end andGate;

architecture func of andGate is 
begin
   add_out <= branch and zero; 
end func;
