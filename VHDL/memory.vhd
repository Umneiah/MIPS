
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

entity memory is
Port ( clk : in std_logic;
addr : in std_logic_vector (31 downto 0);
din : in std_logic_vector (31 downto 0);
memWrite : in std_logic;
memRead : in std_logic;
dout : out std_logic_vector (31 downto 0));
end memory;

architecture Behavioral of memory is
type TRam is array(0 to 63) of std_logic_vector(31 downto 0);
impure function init_bram (ram_file_name : in string) return TRam is
file ramfile : text is in ram_file_name;
variable line_read : line;
variable ram_to_return : TRam;
begin
  for i in TRam'range loop
  readline(ramfile, line_read);
  read(line_read, ram_to_return(i));
  end loop;
return ram_to_return;
end function;
signal Ram : TRam := init_bram("mem.dat");
begin
process (clk)
begin
if clk'event and clk = '1' then  --if rising_edge(clk) then
if memWrite = '1' then
Ram(conv_integer(addr)) <= din;
end if;
if memRead = '1' then
dout <= Ram(conv_integer(addr));
end if;
end if;
end process;
end Behavioral;