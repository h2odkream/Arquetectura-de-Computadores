library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Add is
    Port ( Registre1_add : in  STD_LOGIC_VECTOR (31 downto 0);
           Registre2_add : in  STD_LOGIC_VECTOR (31 downto 0);
           Registreout_add : out  STD_LOGIC_VECTOR (31 downto 0));
end Add;

architecture ArqAdd of Add is

begin
	process(Registre1_add, Registre2_add)
		begin 
			Registreout_add <= Registre1_add + Registre2_add;
	end process ;

end ArqAdd;

