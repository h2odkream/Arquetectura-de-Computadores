library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Register_file is
    Port ( Rs1_RF : in  STD_LOGIC_VECTOR (5 downto 0);-- me indica la posicion donde voy a guardar el dato
           Rs2_RF : in  STD_LOGIC_VECTOR (5 downto 0);
           Rd_RF : in  STD_LOGIC_VECTOR (5 downto 0);
           Reset : in  STD_LOGIC;
           DataToWrite : in  STD_LOGIC_VECTOR (31 downto 0);
           Crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Crs2 : out STD_LOGIC_VECTOR (31 downto 0));
end Register_File;

architecture Arq_register_file of Register_file is

			type Memory_RF is array (0 to 39) of STD_LOGIC_VECTOR (31 downto 0);
			signal registers : Memory_RF :=(others => x"00000000");
begin

process(Rs1_RF, Rs2_RF, Rd_RF, Reset, DataTowrite )
	begin
		registers(0) <= x"00000000";--para asegurar que se quede en ceros g0
		if(Reset = '1') then
			Crs1 <= (others => '0');
			Crs2 <= (others => '0');
			registers <= (others => x"00000000");
		else
			Crs1 <= registers(conv_integer(Rs1_RF));
			Crs2 <= registers(conv_integer(Rs2_RF));
			if(Rd_RF /= "00000") then
				registers(conv_integer(Rd_RF)) <= DataToWrite;	
			end if;
		end if;
end process;
end Arq_register_file;

