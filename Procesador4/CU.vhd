
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
								when "000100" =>        --sub
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
								when "010001" => 			--Andcc
										AluOp <= Op3;
								when "010101" => 			--AndNcc
										AluOp <= Op3;		
								when "010010" => 			--Orcc
										AluOp <= Op3;		
								when "010110" => 			--OrNcc
										AluOp <= Op3;									
								when "010011" => 			--Xorcc
										AluOp <= Op3;		
								when "010111" => 			--Xnorcc
										AluOp <= Op3;		
								when "010000" => 			--Addcc
										AluOp <= Op3;	
								when "001000" => 			--addx
										AluOp <= Op3;	
								when "011000" => 			--addxcc
										AluOp <= Op3;	
								when "010100" => 			--Subcc
										AluOp <= Op3;	
								when "001100" => 			--Subx
										AluOp <= Op3;	
								when "011100" => 			--Subxcc
										AluOp <= Op3;	
								when "100101" => 			--Sll
										AluOp <= Op3;
								when "100110" => 			--Srl
										AluOp <= Op3;
								when "111100" => 			--save
										AluOp <= Op3;
								when "111101" => 			--restore
										AluOp <= Op3;
								
								when others => 
										AluOp <= (others => '0');
					  end case;
			     end if;			
     end process;

end Arq_CU;

