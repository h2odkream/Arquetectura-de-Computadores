library IEEE;
USE ieee.std_logic_1164.ALL;
  
ENTITY PC_Tb IS
END PC_Tb;
 
ARCHITECTURE behavior OF PC_Tb IS 
 
    COMPONENT PC
    PORT(
         Registre_PC : IN  std_logic_vector(31 downto 0);
         Reset : IN  std_logic;
         Clk : IN  std_logic;
         Registreout_PC : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Registre_PC : std_logic_vector(31 downto 0) := (others => '0');
   signal Reset : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal Registreout_PC : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          Registre_PC => Registre_PC,
          Reset => Reset,
          Clk => Clk,
          Registreout_PC => Registreout_PC
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
			Registre_PC <= x"11111111"; 
		reset <= '0'; 
			wait for 100 ns;
			
			reset <= '1';
			wait for 100 ns;
			Registre_PC <= x"01001111";
			wait for 100 ns;
			Registre_PC <= x"01111112";
			wait for 100 ns;
			-- Trabaja en Hexadecimal
			Registre_PC <= x"F0011003";
      wait;
   end process;

END;
	