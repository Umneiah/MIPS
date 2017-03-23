library IEEE;
USE IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity extend is
port ( slv_16  : buffer std_logic_vector(15 downto 0);
       out_sll : buffer std_logic_vector(31 downto 0);
       out1_sll  : buffer std_logic_vector(31 downto 0)
);
end extend;
architecture sign of extend is
begin
out1_sll <= ( 15 downto 0 => slv_16(15)) & slv_16;
out_sll <=  to_stdlogicvector(to_bitvector(out1_sll) sll 2) ;
end architecture sign;
