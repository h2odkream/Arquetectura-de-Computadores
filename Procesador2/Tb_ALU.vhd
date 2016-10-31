
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY Tb_ALU IS
END Tb_ALU;
 
ARCHITECTURE behavior OF Tb_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         Registro1_ALU : IN  std_logic_vector(31 downto 0);
         Registro2_ALU : IN  std_logic_vector(31 downto 0);
         AluOp : IN  std_logic_vector(5 downto 0);
         Carry : IN  std_logic;
         AluResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Registro1_ALU : std_logic_vector(31 downto 0) := (others => '0');
   signal Registro2_ALU : std_logic_vector(31 downto 0) := (others => '0');
   signal AluOp : std_logic_vector(5 downto 0) := (others => '0');
   signal Carry : std_logic := '0';

 	--Outputs
   signal AluResult : std_logic_vector(31 downto 0);
   
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          Registro1_ALU => Registro1_ALU,
          Registro2_ALU => Registro2_ALU,
          AluOp => AluOp,
          Carry => Carry,
          AluResult => AluResult
        );

  

END;
