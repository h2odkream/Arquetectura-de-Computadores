
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
		write_enable : in std_logic;
		DataToReg : IN std_logic_vector(31 downto 0);          
		Crs1 : OUT std_logic_vector(31 downto 0);
		Crs2 : OUT std_logic_vector(31 downto 0);
		Crd : out  STD_LOGIC_VECTOR (31 downto 0)
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
		Op2 : IN std_logic_vector(5 downto 0); 
		op3 : IN std_logic_vector(2 downto 0);
		icc : IN std_logic_vector(3 downto 0);
		cond : IN std_logic_vector(3 downto 0);          
		Aluop : OUT std_logic_vector(5 downto 0);
		wrenmem : OUT std_logic;
		rfsource : OUT std_logic_vector(1 downto 0);
		pcsource : OUT std_logic_vector(1 downto 0);
		rfdest : OUT std_logic;
		write_enable : OUT std_logic
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
		icc:	OUT std_logic_vector(3 downto 0);	
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
		ncwp : OUT std_logic;
		O7 : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

  COMPONENT DataMemory
	PORT(
		reset : IN std_logic;
		cRD : IN std_logic_vector(31 downto 0);
		addres : IN std_logic_vector(4 downto 0);
		wrenmem : IN std_logic;          
		datatomem : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT MuxDataMemory
	PORT(
		a : IN std_logic_vector(31 downto 0);
		b : IN std_logic_vector(31 downto 0);
		c : IN std_logic_vector(31 downto 0);
		sel : IN std_logic_vector(1 downto 0);          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
  COMPONENT MUXRF
	PORT(
		a : IN std_logic_vector(5 downto 0);
		b : IN std_logic_vector(5 downto 0);
		sel : IN std_logic;          
		salida : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

 COMPONENT SEU22
	PORT(
		imm22 : IN std_logic_vector(21 downto 0);          
		imm32 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT SEU30
	PORT(
		imm30 : IN std_logic_vector(29 downto 0);          
		imm32 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT MUXUP
	PORT(
		a : IN std_logic_vector(31 downto 0);
		b : IN std_logic_vector(31 downto 0);
		c : IN std_logic_vector(31 downto 0);
		d : IN std_logic_vector(31 downto 0);
		sel : IN std_logic_vector(1 downto 0);          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
--Sinals	
	signal aux_Add, aux_npc, aux_pc, aux_im, aux_seu, aux_crs2, aux_crs1, aux_mux, aux_alu,aux_datatomem, aux_datatoreg, aux_imm32, auxdisp30, addbranchesout, addcallout, aux_MUXUP, aux_cRD : std_logic_vector(31 downto 0);
	signal aux_nzvc, aux_icc : std_logic_vector(3 downto 0);
	signal aux_carry,aux_ncwp,aux_cwp, aux_wrenmem, aux_write_enable, aux_rfdest : std_logic := '0';
	signal aux_nrs1,aux_nrs2,aux_nrd, aux_O7, aux_cu, aux_muxRF : std_logic_vector(5 downto 0);
	signal aux_rf_source, aux_pcsource : std_logic_vector(1 downto 0);
begin

		--NPC
	   Inst_nPC: PC PORT MAP(
		Registre_PC => aux_MUXUP,
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
		Rd_RF => aux_muxRF,
		Reset => Reset_union,
		DataToReg => aux_datatoreg,
		write_enable => aux_write_enable,
		Crs1 => aux_crs1,
		Crs2 => aux_crs2,
		Crd => aux_cRD
		
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
		Op2 => aux_im(24 downto 22),
		Op3 => aux_im(24 downto 19),
		icc => aux_icc, -- conecta con el PSR
		cond => aux_im(28 downto 25),
		wrenmem => aux_wrenmem,
		rfsource => aux_rf_source,
		rfdest => aux_rfdest,
		pcsource => aux_pcsource,
		write_enable => aux_write_enable,
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
		icc => aux_icc,
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
		ncwp => aux_ncwp,
		O7 => aux_O7		
	);
	
	
	Inst_DataMemory: DataMemory PORT MAP(
		reset => Reset_union,
		cRD => aux_cRD,
		addres => aux_alu(4 downto 0),
		wrenmem => aux_wrenmem,
		datatomem => aux_datatomem
	);

	Inst_MuxDataMemory: MuxDataMemory PORT MAP(
		a => aux_datatomem,
		b => aux_alu,
		c => aux_pc,
		sel => aux_rf_source,
		salida => aux_datatoreg
	);
		
	Inst_MUXRF: MUXRF PORT MAP(
		a => aux_nrd,
		b => aux_O7,
		sel => aux_rfdest,
		salida =>aux_muxRF 
	);

	Inst_SEU22: SEU22 PORT MAP(
		imm22 => aux_im(21 downto 0),
		imm32 => aux_imm32
	);

	Inst_SEU30: SEU30 PORT MAP(
		imm30 => aux_im(29 downto 0),
		imm32 => auxdisp30
	);
	
	Inst_Adddisp22: Add PORT MAP(
		Registre1_add => aux_pc,
		Registre2_add => aux_imm32,
		Registreout_add => addbranchesout
	);
	
	Inst_Adddisp30: Add PORT MAP(
		Registre1_add => aux_pc,
		Registre2_add =>auxdisp30, 
		Registreout_add => addcallout
	);
	
	Inst_MUXUP: MUXUP PORT MAP(
		a => addcallout,
		b => addbranchesout,
		c => aux_add,
		d => aux_alu,
		sel => aux_pcsource,
		salida => aux_MUXUP
	);

	
		salida <= aux_alu;
	
end Arq_Union;

