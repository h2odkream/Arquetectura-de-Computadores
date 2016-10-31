

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC is
    Port ( Registre_PC : in  STD_LOGIC_VECTOR (31 downto 0);
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Registreout_PC : out  STD_LOGIC_VECTOR (31 downto 0));
end PC;

architecture ArqPC of PC is


begin
-- process es sensible a estas entradas.
	process(Registre_PC,Reset,Clk)
		begin 
		if(rising_edge(Clk))then
			if(Reset = '1') then
				Registreout_PC <=(others=>'0');-- asigna cero a la direccion que tiene
			else
				Registreout_PC <= Registre_PC;	-- le asigna el valor de entrada a la salida				
			end if;	
		end if;
	end process;		

end ArqPC;
	
