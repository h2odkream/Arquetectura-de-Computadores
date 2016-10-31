LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY NPC_Tb IS
END NPC_Tb;
 
ARCHITECTURE ArqTb_NPC OF NPC_Tb IS 
 
    COMPONENT NPC
    PORT(
         Registre : IN  std_logic_vector(31 downto 0);
         Reset : IN  std_logic;
         clk : IN  std_logic;
         Registreout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   signal Registre : std_logic_vector(31 downto 0) := (others => '0');--crea una de tipo vector(para este caso) y los inicializa en 0(others => '0')
   signal Reset : std_logic := '0';
   signal clk : std_logic := '0';
  
 	--Outputs
   signal Registreout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: NPC PORT MAP (
          Registre => Registre,
          Reset => Reset,
          clk => clk,
          Registreout => Registreout
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
