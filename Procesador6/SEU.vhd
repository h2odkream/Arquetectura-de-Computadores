library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SEU is
    Port ( simm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           RegistreoutMUX : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU;

architecture ArqSEU of SEU is

begin

process(simm13)
		begin
			-- numero mas significativo 
				if(simm13(12) = '1')then -- si el numero esta en la posicion 12 es 1
					RegistreoutMUX(12 downto 0) <= simm13;
					RegistreoutMUX(31 downto 13) <= (others=>'1');
				else
					RegistreoutMUX(12 downto 0) <= simm13;
					RegistreoutMUX(31 downto 13) <= (others=>'0');
				end if;
			--end if;
		end process;
end ArqSEU;

