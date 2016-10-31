
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Tb_SEU IS
END Tb_SEU;
 
ARCHITECTURE behavior OF Tb_SEU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEU
    PORT(
         simm13 : IN  std_logic_vector(12 downto 0);
         RegistreoutMUX : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal simm13 : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal RegistreoutMUX : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU PORT MAP (
          simm13 => simm13,
          RegistreoutMUX => RegistreoutMUX
        );

  
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      simm13 <= "1000001010101";
		
		wait for 100 ns;	
      simm13 <= "0000001010101";
      
      -- insert stimulus here 

      wait;
   end process;

END;
