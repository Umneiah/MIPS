library ieee;
use ieee.std_logic_1164.all;
entity mux_3 is
port(
		result	: in	std_logic_vector(31 downto 0);
		readData: in	std_logic_vector(31 downto 0);
		memtoreg: in	std_logic_vector(1 downto 0);
		writeData: out	std_logic_vector(31 downto 0)
	);

end mux_3;
architecture arch1 of mux_3 is
begin
  
  process(memtoreg)
  begin
  	case memtoreg is 
  	    when "00" =>
  	       writeData <= result;
  	    when "11" =>
	       writeData <= readData; 
	    when others =>
	       writeData <= (others => 'Z');
	end case;
  end process;
 end arch1;
