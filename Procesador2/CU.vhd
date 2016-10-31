
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity CU is
    Port ( Op : in  STD_LOGIC_VECTOR (1 downto 0);
           Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           AluOp : out  STD_LOGIC_VECTOR (5 downto 0));
end CU;

architecture Arq_CU of CU is

begin
		process(Op,Op3)
			begin 
				if(Op = "10") then
					case(Op3) is
								when "000000" =>			--Add
										AluOp <= Op3;
								when "010000" =>        --sub
										AluOp <= Op3;
								when "000010" => 			--Or
										AluOp <= Op3;
								when "000001" => 			--And
										AluOp <= Op3;
								when "000011" => 			--Xor
										AluOp <= Op3;
								when "000110" => 			--Orn
										AluOp <= Op3;
								when "000101" => 			--Andn
										AluOp <= Op3;
								when "000111" => 			--Xnor
										AluOp <= Op3;
								when others => 
										AluOp <= (others => '0');
					  end case;
			     end if;			
     end process;

end Arq_CU;

