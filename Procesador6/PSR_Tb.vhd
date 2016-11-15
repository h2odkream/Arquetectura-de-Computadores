LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY PSR_Tb IS
END PSR_Tb;
 
ARCHITECTURE behavior OF PSR_Tb IS 
 
    COMPONENT PSR
    PORT(
         nzvc : IN  std_logic_vector(3 downto 0);
         reset : IN  std_logic;
         clk : IN  std_logic;
         ncwp : IN  std_logic;
         carry : OUT  std_logic;
         cwp : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal nzvc : std_logic_vector(3 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal ncwp : std_logic := '0';

 	--Outputs
   signal carry : std_logic;
   signal cwp : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR PORT MAP (
          nzvc => nzvc,
          reset => reset,
          clk => clk,
          ncwp => ncwp,
          carry => carry,
          cwp => cwp
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

		reset <= '1';
		ncwp <= '1';
		nzvc <= "0000";
      wait for 100 ns;
		reset <= '0';
		ncwp <= '1';
		nzvc <= "1010";
		

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
