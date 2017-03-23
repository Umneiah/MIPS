library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;


entity Inst_Fetsh is 
port(out1,out6 : out std_logic_vector (5 downto 0);
      out2,out3,out4,out5: out std_logic_vector (4 downto 0);
      out7: out std_logic_vector (15 downto 0); 
      out8 : out std_logic_vector (27 downto 0);
      inIM: in std_logic_vector (31 downto 0)); 
end Inst_Fetsh;

architecture IM of Inst_Fetsh is
signal instruction_array: std_logic_vector(31 downto 0);
begin

process(inIM)
file file_pointer:text;     
variable line_content : string(1 to 4);
variable line_num : line;

begin
--file_open ( file_pointer , "instruction.txt", READ_MODE);
--while not endfile(file_pointer) loop
--readline(file_pointer,line_num);
--READ (line_num,line_content);
--end loop;

--file_close(file_pointer);
--variable inIM: bit_vector (31 downto 0); 
case (inIm(31 downto 26)) is
when "000000" =>   -- add , sll , jr , slt , and , nor
  out1 <= inIM(31 downto 26);
  out2 <= inIM(25 downto 21);
  out3 <= inIM(20 downto 16);
  out4 <= inIM(15 downto 11);
  out5 <= inIM(10 downto 6);
  out6 <= inIM(5 downto 0);
 -- out7 <= ( others => 'x');
 --out8 <= "xxxxxxxxxxxxxxxxxxxxxxxxxx";
when "000100" =>   --branch(000100)
  out1 <= inIm(31 downto 26);
  out2 <= inIM(25 downto 21);
  out3 <= inIM(20 downto 16);
 -- out4 = "xxxxx";
 -- out5 = "xxxxx";
 -- out6 = "xxxxxx";
  out7 <= inIM(15 downto 0);
 --out8 = "xxxxxxxxxxxxxxxxxxxxxxxxxx";
when "100011" => --lw (100011)
  out1 <= inIm(31 downto 26);
  out2 <= inIM(25 downto 21);
  out3 <= inIM(20 downto 16);
  --out4 = "xxxxx";
  --out5 = "xxxxx";
  --out6 = "xxxxxx";
  out7 <= inIM(15 downto 0);
 --out8 = "xxxxxxxxxxxxxxxxxxxxxxxxxx";
when "101011" => --sw(101011)
 out1 <= inIM(31 downto 26);
 out2 <= inIM(25 downto 21);
 out3 <= inIM(20 downto 16);
 --out4 <= "xxxxx";
 --out5 <= "xxxxx";
 --out6 <= "xxxxxx";
 out7 <= inIM(15 downto 0);
 --out8 <= "xxxxxxxxxxxxxxxxxxxxxxxxxx";
when "000110" => --jal(000110)
 out1 <= inIM(31 downto 26);
 --out2 <= "xxxxx";
 --out3 <= "xxxxx";
 --out4 <= "xxxxx";
 --out5 <= "xxxxx";
 --out6 <= "xxxxxx";
 --out7 <= "xxxxxxxxxxxxxxxx";
 out8 <= inIM(25 downto 0);
when "001100" => --andi (001100)
 out1 <= inIM(31 downto 26);
 out2 <= inIM(25 downto 21);
 out3 <= inIM(20 downto 16);
 --out4 <= "xxxxx";
 --out5 <= "xxxxx";
 --out6 <= "xxxxxx";
 out7 <= inIM(15 downto 0);
 --out8 <= "xxxxxxxxxxxxxxxxxxxxxxxxxx";
when others =>
out1 <= "000000" ;
out2 <= "00000" ;
out3 <= "00000" ;
out4 <= "00000" ;
out5 <= "00000" ;
out6 <= "000000" ;
out7 <= "0000000000000000" ;
out8 <= "00000000000000000000000000";
end case;
end process; 
end IM;
------------------------------------------------------------------
------------------------------------------------------------------


