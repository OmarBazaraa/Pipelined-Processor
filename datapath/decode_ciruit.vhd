LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY decode_ciruit IS
    PORT(
        Instr                   : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
        Flags                   : IN  STD_LOGIC_VECTOR( 3 DOWNTO 0);

        Rsrc                    : OUT STD_LOGIC_VECTOR( 2 DOWNTO 0);
        Rsrc_WB                 : OUT STD_LOGIC;
        Rsrc_Load               : OUT STD_LOGIC;
        
        Rdst                    : OUT STD_LOGIC_VECTOR( 2 DOWNTO 0);
        Rdst_WB                 : OUT STD_LOGIC;
        Rdst_Load               : OUT STD_LOGIC;
        
        Immediate_Load          : OUT STD_LOGIC;

        Shift_Load              : OUT STD_LOGIC;
        Shift_Val               : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);
        
        ALU_Opr                 : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);
        Flags_EN                : OUT STD_LOGIC;
        Flags_Restore           : OUT STD_LOGIC;
        
        Mem_EA                  : OUT STD_LOGIC_VECTOR( 9 DOWNTO 0);
        Mem_EA_Load             : OUT STD_LOGIC;
        Mem_Addr_Switch         : OUT STD_LOGIC;
        Mem_RD                  : OUT STD_LOGIC;
        Mem_WR                  : OUT STD_LOGIC;
        
        Port_In_RD              : OUT STD_LOGIC;
        Port_Out_WR             : OUT STD_LOGIC;

        MOV                     : OUT STD_LOGIC;
        
        PC_Flags_Save           : OUT STD_LOGIC;
        
        Branch_Taken            : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE arch_decode_ciruit OF decode_ciruit IS

    SIGNAL Instr_Type           : STD_LOGIC_VECTOR(1 DOWNTO 0);

    SIGNAL MOV_Type             : STD_LOGIC;
    SIGNAL ALU_Type             : STD_LOGIC;
    SIGNAL MEM_Type             : STD_LOGIC;
    SIGNAL JMP_Type             : STD_LOGIC;

    SIGNAL MOV_Write            : STD_LOGIC;
    SIGNAL MOV_Instr            : STD_LOGIC;

    SIGNAL ALU_Stack            : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL ALU_Write            : STD_LOGIC;
    SIGNAL ALU_MUL              : STD_LOGIC;
    SIGNAL ALU_SHF              : STD_LOGIC;

    SIGNAL Mem_Load             : STD_LOGIC;
    SIGNAL Mem_Store            : STD_LOGIC;
    SIGNAL Mem_Read             : STD_LOGIC;

    SIGNAL Branch               : STD_LOGIC;
    SIGNAL BranchCond           : STD_LOGIC;
    SIGNAL BranchSwitch         : STD_LOGIC_VECTOR(1 DOWNTO 0);

    SIGNAL Stack                : STD_LOGIC;
    SIGNAL Stack_Push           : STD_LOGIC;
    SIGNAL Stack_Pop            : STD_LOGIC;

BEGIN

    Instr_Type      <= Instr(15 DOWNTO 14);
    MOV_Type        <= '1' WHEN (Instr_Type="00") ELSE '0';
    ALU_Type        <= '1' WHEN (Instr_Type="01") ELSE '0';
    MEM_Type        <= '1' WHEN (Instr_Type="10") ELSE '0';
    JMP_Type        <= '1' WHEN (Instr_Type="11") ELSE '0';

    --===================================================================================
    --
    -- SRC
    --
    Rsrc            <= Instr(2 DOWNTO 0);
    Rsrc_WB         <= ALU_MUL OR Mem_Read;
    Rsrc_Load       <= ALU_Write OR Branch OR MOV_Instr;

    --===================================================================================
    --
    -- DST
    --
    Rdst            <= Instr(5 DOWNTO 3);
    Rdst_WB         <= Stack OR (ALU_Write OR MOV_Write);
    Rdst_Load       <= Stack OR (ALU_Write AND (NOT ALU_SHF));

    --===================================================================================
    --
    -- Move Instructions
    --

    MOV_Write       <= MOV_Type AND Instr(13);
    MOV_Instr       <= MOV_Type AND Instr(12);
    MOV             <= MOV_Instr;
    Immediate_Load  <= MOV_Type AND Instr(11);
    Port_In_RD      <= MOV_Type AND Instr(10);
    Port_Out_WR     <= MOV_Type AND Instr( 9);

    --===================================================================================
    --
    -- ALU Instructions
    --

    ALU_Opr         <= Instr(13 DOWNTO 10) WHEN ALU_Type='1' ELSE ALU_Stack;

    ALU_Stack       <= ("0" & Stack & Stack & Stack_Push);   -- INC / DEC
    ALU_Write       <= ALU_Type AND (Instr(13) OR Instr(12));
    ALU_MUL         <= '1' WHEN (ALU_Type='1' AND Instr(13 DOWNTO 10)="1000")   ELSE '0';
    ALU_SHF         <= '1' WHEN (ALU_Type='1' AND Instr(13 DOWNTO 11)="111")    ELSE '0';

    Shift_Load      <= ALU_SHF;
    Shift_Val       <= Instr(9 DOWNTO 6);
    Flags_EN        <= ALU_Type;

    --===================================================================================
    --
    -- Memory Instructions
    --

    Mem_EA          <= Instr(12 DOWNTO 3);
    Mem_EA_Load     <= MEM_Type;
    Mem_Addr_Switch <= Stack_Pop;
    Mem_Load        <= MEM_Type AND Instr(13);
    Mem_Store       <= MEM_Type AND (NOT Instr(13));
    Mem_Read        <= Mem_Load OR Stack_Pop;
    Mem_RD          <= Mem_Read;
    Mem_WR          <= Mem_Store OR Stack_Push;

    --===================================================================================
    --
    -- Branch & Stack Instructions
    --

    Branch          <= JMP_Type AND Instr(11);
    BranchSwitch    <= Instr(13 DOWNTO 12);
    Branch_Taken    <= Branch AND BranchCond;

    Stack           <= JMP_Type AND Instr(10);
    Stack_Push      <= Stack AND (NOT Instr(9));
    Stack_Pop       <= Stack AND Instr(9);

    Flags_Restore   <= JMP_Type AND Instr(8);
    PC_Flags_Save   <= JMP_Type AND Instr(7);

    WITH BranchSwitch SELECT
    BranchCond      <=  '1'         WHEN "00",
                        Flags(0)    WHEN "01",
                        Flags(1)    WHEN "10",
                        Flags(2)    WHEN OTHERS;
    
END ARCHITECTURE;