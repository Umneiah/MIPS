library IEEE;
USE IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity mux_5 is
  port ( jump  : in std_logic;
        branch_adress,result_2: in std_logic_vector (31 downto 0);
        before_i_address: in std_logic_vector (25 downto 0);
         PC_in : out std_logic_vector (31 downto 0);
         jump_address : buffer std_logic_vector(31 downto 0);
         out8 : buffer std_logic_vector(27 downto 0);
         before_i_28bits : buffer std_logic_vector(27 downto 0)
         );
end mux_5;

architecture behave of mux_5 is
begin
before_i_28bits <= "00" & before_i_address;
out8 <=  to_stdlogicvector(to_bitvector(before_i_28bits) sll 2);
jump_address <=result_2(31 DOWNTO 28) & out8(27 DOWNTO 0 );
  process ( jump, branch_adress, jump_address ) begin
    if  jump = '1'  then
      PC_in <= jump_address;
    else
      PC_in <= branch_adress;  
      end if;
end process;
end behave;
