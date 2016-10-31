library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.STD_LOGIC_ARITH.ALL;

entity WindowsManager is
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           cwp : in  STD_LOGIC;
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrd : out  STD_LOGIC_VECTOR (5 downto 0);
           ncwp : out  STD_LOGIC);
end WindowsManager;

architecture Arq_WM of WindowsManager is

begin
process(rs1,rs2,rd, cwp)
	begin
		--Registros locales
		if (rs1>="10000" and rs1<="10111") then
			nrs1<=conv_std_logic_vector(conv_integer(rs1)+(conv_integer(cwp)*16),6);
		end if;
		if (rs2>="10000" and rs2<="10111") then
			nrs2<=conv_std_logic_vector(conv_integer(rs2)+(conv_integer(cwp)*16),6);
		end if;
		if (rd>="10000" and rd<="10111") then
			nrd<=conv_std_logic_vector(conv_integer(rd)+(conv_integer(cwp)*16),6);
		end if;
		
		--Registros de entrada
		if (rs1>="11000" and rs1<="11111") then
			nrs1<=conv_std_logic_vector(conv_integer(rs1)-(conv_integer(cwp)*16),6); --Pasa de 5 bits a 6.
		end if;
		if (rs2>="11000" and rs2<="11111") then
			nrs2<=conv_std_logic_vector(conv_integer(rs2)-(conv_integer(cwp)*16),6);
		end if;
		if (rd>="11000" and rd<="11111") then
			nrd<=conv_std_logic_vector(conv_integer(rd)-(conv_integer(cwp)*16),6);
		end if;
		
		--Registros Globales
		if (rs1>="00000" and rs1<="00111") then
			nrs1<='0'&rs1;
		end if;
		if (rs2>="00000" and rs2<="00111") then
			nrs2<='0'&rs2;
		end if;
		if (rd>="00000" and rd<="00111") then
			nrd<='0'&rd;
		end if;
end process;

 
process(op,op3,cwp)
	begin
		
		if (op="10") then 
			if (op3="111100")then --Save cwp<=cwp-1 } cwp<='0'
				ncwp<='0';
			end if;
			
			if (op3="111101")then--Restore cwp<=cwp+1 } cwp<='1'
				ncwp<='1';
			end if;
		end if;
		
				
end process;

end Arq_WM;

