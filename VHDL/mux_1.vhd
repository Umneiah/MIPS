library ieee;
use ieee.std_logic_1164.all;
entity mux_1 is
port(
		rt	: in	std_logic_vector(4 downto 0);
		rd	: in	std_logic_vector(4 downto 0);
		reg_dst	: in	std_logic_vector(1 downto 0);
		y	: out	std_logic_vector(4 downto 0)
	);

end mux_1;
architecture arch1 of mux_1 is
begin


  process(reg_dst)
  begin
  	case reg_dst is 
  	    when "00" =>
  	       y <= rt;
  	    when "11" =>
	       y <= rd; 
	    when others =>
	       y <= "ZZZZZ";
	end case;
  end process;
 end arch1;
