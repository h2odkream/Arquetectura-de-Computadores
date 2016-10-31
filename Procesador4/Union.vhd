
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Union is
    Port ( Clk_union : in  STD_LOGIC;
           Reset_union : in  STD_LOGIC;
           Salida : out  STD_LOGIC_VECTOR (31 downto 0));
end Union;
	
architecture Arq_Union of Union is

COMPONENT PC
	PORT(
		Registre_PC : IN std_logic_vector(31 downto 0);
		Reset : IN std_logic;
		Clk : IN std_logic;          
		Registreout_PC : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
   
	COMPONENT Add
	PORT(
		Registre1_add : IN std_logic_vector(31 downto 0);
		Registre2_add : IN std_logic_vector(31 downto 0);          
		Registreout_add : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT instructionMemory
	PORT(
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

		COMPONENT Register_file
	PORT(
		Rs1_RF : IN std_logic_vector(5 downto 0);
		Rs2_RF : IN std_logic_vector(5 downto 0);
		Rd_RF : IN std_logic_vector(5 downto 0);
		Reset : IN std_logic;
		DataToWrite : IN std_logic_vector(31 downto 0);          
		Crs1 : OUT std_logic_vector(31 downto 0);
		Crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT SEU
	PORT(
		simm13 : IN std_logic_vector(12 downto 0);          
		RegistreoutMUX : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT MUX
	PORT(
		Crs2 : IN std_logic_vector(31 downto 0);
		inmediato : IN std_logic_vector(31 downto 0);
		Aux_i : IN std_logic;          
		RegistreoutALU : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT CU
	PORT(
		Op : IN std_logic_vector(1 downto 0);
		Op3 : IN std_logic_vector(5 downto 0);          
		AluOp : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
		
	COMPONENT ALU
	PORT(
		Registro1_ALU : IN std_logic_vector(31 downto 0);
		Registro2_ALU : IN std_logic_vector(31 downto 0);
		AluOp : IN std_logic_vector(5 downto 0); 
		Carry : IN std_logic;  
		AluResult : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	
		COMPONENT PSR_Modifier
	PORT(
		ALUOP : IN std_logic_vector(5 downto 0);
		ALU_Result : IN std_logic_vector(31 downto 0);
		Crs1 : IN std_logic_vector(31 downto 0);
		MuxOut : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		nzvc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	COMPONENT PSR
	PORT(
		nzvc : IN std_logic_vector(3 downto 0);
		reset : IN std_logic;
		clk : IN std_logic; 
		ncwp : IN std_logic;  
		carry : OUT std_logic;
		cwp : OUT std_logic
		);
	END COMPONENT;
  
  COMPONENT WindowsManager
	PORT(
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		cwp : IN std_logic;
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		nrs1 : OUT std_logic_vector(5 downto 0);
		nrs2 : OUT std_logic_vector(5 downto 0);
		nrd : OUT std_logic_vector(5 downto 0);
		ncwp : OUT std_logic
		);
	END COMPONENT;

	

	
	signal aux_Add, aux_npc, aux_pc, aux_im, aux_seu, aux_crs2,aux_crs1,aux_mux,aux_alu: std_logic_vector(31 downto 0);
	signal aux_cu : std_logic_vector(5 downto 0);
	signal aux_nzvc : std_logic_vector(3 downto 0);
	signal aux_carry,aux_ncwp,aux_cwp : std_logic := '0';
	signal aux_nrs1,aux_nrs2,aux_nrd : std_logic_vector(5 downto 0);
begin

		--NPC
	   Inst_nPC: PC PORT MAP(
		Registre_PC => aux_add,
		Reset => Reset_union,
		Clk => Clk_union,
		Registreout_PC => aux_npc
	);

		--PC
		Inst_PC: PC PORT MAP(
		Registre_PC => aux_npc,
		Reset => Reset_union,
		Clk => Clk_union,
		Registreout_PC => aux_pc 
	);
		--ADD
		Inst_Add: Add PORT MAP(
		Registre1_add => aux_npc,
		Registre2_add => "00000000000000000000000000000001",
		Registreout_add => aux_add
	);
	
		--IM
		Inst_instructionMemory: instructionMemory PORT MAP(
		address => aux_pc,
		reset => Reset_union,
		outInstruction => aux_im
	);
		--RF
		Inst_Register_file: Register_file PORT MAP(
		Rs1_RF => aux_nrs1,
		Rs2_RF => aux_nrs2,
		Rd_RF => aux_nrd,
		Reset => Reset_union,
		DataToWrite => aux_alu,
		Crs1 => aux_crs1,
		Crs2 => aux_crs2
	);
	
		--SEU
		Inst_SEU: SEU PORT MAP(
		simm13 => aux_im(12 downto 0),
		RegistreoutMUX => aux_seu
	);
		--MUX
		Inst_MUX: MUX PORT MAP(
		Crs2 => aux_crs2,
		inmediato => aux_seu,
		Aux_i => aux_im(13),
		RegistreoutALU => aux_mux
	);
		--CU
		Inst_CU: CU PORT MAP(
		Op => aux_im(31 downto 30),
		Op3 => aux_im(24 downto 19),
		AluOp => aux_cu
	);
	
		--ALU
		Inst_ALU: ALU PORT MAP(
		Registro1_ALU => aux_crs1,
		Registro2_ALU => aux_mux,
		AluOp => aux_cu,
		Carry => aux_carry ,
		AluResult => aux_alu 
	);
	
		--PSR	Modifier
		Inst_PSR_Modifier: PSR_Modifier PORT MAP(
		ALUOP => aux_cu,
		ALU_Result => aux_alu,
		Crs1 => aux_crs1,
		MuxOut => aux_mux,
		nzvc => aux_nzvc,
		reset => Reset_union
	);
	
		--PSR
		Inst_PSR: PSR PORT MAP(
		nzvc => aux_nzvc,
		reset => Reset_union,
		clk => Clk_union,
		ncwp => aux_ncwp,
		carry => aux_carry ,
		cwp => aux_cwp
	);
	
		Inst_WindowsManager: WindowsManager PORT MAP(
		rs1 => aux_im(18 downto 14),
		rs2 => aux_im(4 downto 0),
		rd => aux_im(29 downto 25) ,
		cwp => aux_cwp,
		op => aux_im(31 downto 30),
		op3 => aux_im(24 downto 19),
		nrs1 => aux_nrs1,
		nrs2 => aux_nrs2,
		nrd => aux_nrd,
		ncwp => aux_ncwp 
	);
	
	
	
	
	
	
	
		salida <= aux_alu;
	
end Arq_Union;

