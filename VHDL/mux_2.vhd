library IEEE;
USE IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity mux_2 is
  port ( alu_src  : in std_logic;
	 read_data_2, sign_extend : in std_logic_vector (31 downto 0);
         alu_in_2 : out std_logic_vector (31 downto 0));
end mux_2;

architecture behave of mux_2 is
begin
  process ( alu_src, read_data_2, sign_extend ) begin
    if  alu_src = '1'  then
      alu_in_2 <= sign_extend;
    else
      alu_in_2 <= read_data_2;
    end if;
end process;
end behave;
