
library ieee;
    USE ieee.std_logic_1164.all;
    USE ieee.std_logic_unsigned.all;
    use IEEE.numeric_std.all;
entity mux_4 is
  port ( add_out : in std_logic;
	 PC_4, alu_result : in std_logic_vector (31 downto 0);
         branch_adress : out std_logic_vector (31 downto 0));
end mux_4;

architecture behave of mux_4 is
begin
  process ( add_out, PC_4, alu_result ) begin
    if  add_out = '1'  then
      branch_adress <= alu_result;
    else
      branch_adress <= PC_4;
    end if;
end process;
end behave;