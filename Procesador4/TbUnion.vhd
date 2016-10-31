LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TbUnion IS
END TbUnion;
 
ARCHITECTURE behavior OF TbUnion IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Union
    PORT(
         Clk_union : IN  std_logic;
         Reset_union : IN  std_logic;
         Salida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk_union : std_logic := '0';
   signal Reset_union : std_logic := '0';

 	--Outputs
   signal Salida : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_union_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Union PORT MAP (
          Clk_union => Clk_union,
          Reset_union => Reset_union,
          Salida => Salida
        );

   -- Clock process definitions
   Clk_union_process :process
   begin
		Clk_union <= '0';
		wait for Clk_union_period/2;
		Clk_union <= '1';
		wait for Clk_union_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		Reset_union <= '1';
		wait for 100 ns;
		Reset_union <= '0';
			


      wait;
   end process;

END;
