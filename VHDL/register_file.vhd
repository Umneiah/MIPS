    LIBRARY IEEE;
    use IEEE.std_logic_1164.ALL;
    use IEEE.NUMERIC_STD.ALL;
    entity register_file is  

        port
        (
        readData1     : out std_logic_vector(31 downto 0);
        read_data_2     : out std_logic_vector(31 downto 0);
        readAddress1  : in  std_logic_vector(4 downto 0);
        readAddress2  : in std_logic_vector(4 downto 0);
        writeAddress  : in std_logic_vector(4 downto 0);
        writeData     : in std_logic_vector(31 downto 0);
        clk           : in std_logic;
        writeEn       : in std_logic
        );
    end register_file;

    architecture behavioral of register_file is
    type registerFile is array(0 to 31) of std_logic_vector(31 downto 0);
    signal registers : registerFile;
    --signal writeEn : std_logic ;
    begin

        regFile: process(clk)
        begin
            if rising_edge(clk) then 
                if(writeEn = '1') then
                    registers(to_integer(unsigned(writeAddress))) <= writeData;
                end if;
                if falling_edge(clk) then
                    readData1 <= registers(to_integer(unsigned(readAddress1)));
                    read_data_2 <= registers(to_integer(unsigned(readAddress2)));
                end if;
            end if;
        end process;
    end behavioral;


