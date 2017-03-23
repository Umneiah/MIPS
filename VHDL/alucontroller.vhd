library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity alucontroller is
port (funct: in std_logic_vector (5 downto 0);
aluop: in std_logic_vector (2 downto 0);
alucontrol: out std_logic_vector (3 downto 0));
end;

architecture behave of alucontroller is
begin
process (aluop, funct) begin
case aluop is
when "000" => alucontrol <= "0010"; --add 
when "001" => alucontrol <= "0110"; --sub 
when others => case funct is 
when "100000" => alucontrol <= "0010";  --add
when "100010" => alucontrol <= "0110";  --sub
when "100100" => alucontrol <= "0000";  --and
when "100101" => alucontrol <= "0001";  --or
when "101010" => alucontrol <= "0111";  --slt
when "000000" => alucontrol <= "0100";  --sll
when "100111" => alucontrol <= "1100";  --nor
when "001000" => alucontrol <= "1111";  --jar
when others => alucontrol <= (others => '0');

end case;
end case;
end process;
end behave;
