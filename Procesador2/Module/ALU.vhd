library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port ( Registro1_ALU : in  STD_LOGIC_VECTOR (31 downto 0);
           Registro2_ALU : in  STD_LOGIC_VECTOR (31 downto 0);
           AluOp : in  STD_LOGIC_VECTOR (5 downto 0);
           --Carry : in  STD_LOGIC;
           AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture ArqAlu of ALU is

begin
		process(Registro1_ALU,Registro2_ALU,AluOp)
			begin
			   
				case (AluOp) is 
					when "000000" => -- add
						AluResult <= Registro1_ALU + Registro2_ALU;	
					when "000100" => -- sub
						AluResult <= Registro1_ALU - Registro2_ALU;
					when "000010" => -- or
						AluResult <= Registro1_ALU or Registro2_ALU;
					when "000001" => --and
						AluResult <= Registro1_ALU and Registro2_ALU;
					when "000011" => --xor
						AluResult <= Registro1_ALU xor Registro2_ALU;
					when "000110" => --orn
						AluResult <= Registro1_ALU or not Registro2_ALU;
					when "000101" => --andn
						AluResult <= Registro1_ALU and not Registro2_ALU;
					when "000111" => --xnor
						AluResult <= Registro1_ALU nor Registro2_ALU;
						
					when others => -- Cae el nop
						AluResult <= (others=>'0');
				end case;
			
			end process;

end ArqAlu;

