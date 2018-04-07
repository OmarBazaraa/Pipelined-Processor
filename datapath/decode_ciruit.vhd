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
        
        ALU_Opr                 : OUT STD_LOGIC_VECTOR( 5 DOWNTO 0);
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

    SIGNAL Instr_Type           : STD_LOGIC;

    SIGNAL MOV_Type             : STD_LOGIC;
    SIGNAL ALU_Type             : STD_LOGIC;
    SIGNAL MEM_Type             : STD_LOGIC;
    SIGNAL JMP_Type             : STD_LOGIC;

    SIGNAL MOV_Rdst_WB          : STD_LOGIC;

    SIGNAL ALU_Opcode           : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL ALU_Stack            : STD_LOGIC_VECTOR(4 DOWNTO 0);

    SIGNAL ALU_2_Opr            : STD_LOGIC;
    SIGNAL ALU_1_Opr            : STD_LOGIC;
    SIGNAL ALU_0_Opr            : STD_LOGIC;

    SIGNAL Instr_MUL            : STD_LOGIC;

    SIGNAL MEM_Load             : STD_LOGIC;
    SIGNAL MEM_Store            : STD_LOGIC;

    SIGNAL Branch               : STD_LOGIC;
    SIGNAL BranchCond           : STD_LOGIC;
    SIGNAL BranchSwitch         : STD_LOGIC_VECTOR(1 DOWNTO 0);

    SIGNAL Stack                : STD_LOGIC;
    SIGNAL Stack_Push           : STD_LOGIC;
    SIGNAL Stack_Pop            : STD_LOGIC;

BEGIN

    Instr_Type      <= Instr(15 DOWNTO 14);
    MOV_Type        <= (Instr_Type="00");
    ALU_Type        <= (Instr_Type="01");
    MEM_Type        <= (Instr_Type="10");
    JMP_Type        <= (Instr_Type="11");

    --===================================================================================
    --
    -- SRC
    --
    Rsrc            <= Instr(2 DOWNTO 0);
    Rsrc_WB         <= Instr_MUL OR Mem_RD;
    Rsrc_Load       <= ALU_2_Opr OR Branch;

    --===================================================================================
    --
    -- DST
    --
    Rdst            <=  Instr(5 DOWNTO 3);
    Rdst_WB         <=  Stack OR ALU_1_Opr OR ALU_2_Opr OR MOV_Rdst_WB;
    Rdst_Load       <=  Stack OR ALU_1_Opr OR (ALU_2_Opr AND (NOT Shift_Load));

    --===================================================================================
    --
    -- Move Instructions
    --

    MOV_Rdst_WB     <= MOV_Type AND Instr(13);
    MOV             <= MOV_Type AND Instr(12);
    Immediate_Load  <= MOV_Type AND Instr(11);
    Port_In_RD      <= MOV_Type AND Instr(10);
    Port_Out_WR     <= MOV_Type AND Instr( 9);

    --===================================================================================
    --
    -- ALU Instructions
    --

    ALU_Opr         <= ALU_Opcode WHEN ALU_Type='1' ELSE ALU_Stack;

    ALU_Opcode      <= Instr(13) & (Instr(9) AND (NOT Instr(13))) & Instr(12 DOWNTO 10);
    ALU_Stack       <= ("0" & Stack & "00" & Stack_Push);   -- INC / DEC

    ALU_2_Opr       <= ALU_Type AND Instr(13);
    ALU_1_Opr       <= ALU_Type AND (NOT Instr(13)) AND Instr(9);
    ALU_0_Opr       <= ALU_Type AND (NOT Instr(13)) AND (NOT Instr(9));

    Shift_Val       <= Instr(9 DOWNTO 6);

    Instr_MUL       <= ALU_2_Opr AND (ALU_Opcode="010");
    Shift_Load      <= ALU_2_Opr AND (ALU_Opcode(2 DOWNTO 1)="11");

    Flags_EN        <= ALU_Type;

    --===================================================================================
    --
    -- Memory Instructions
    --

    MEM_Load        <= MEM_Type AND Instr(13);
    MEM_Store       <= MEM_Type AND (NOT Instr(13));

    Mem_EA          <= Instr(12 DOWNTO 3);
    Mem_EA_Load     <= MEM_Type;
    Mem_Addr_Switch <= Stack_Pop;
    Mem_RD          <= MEM_Load OR Stack_Pop;
    Mem_WR          <= MEM_Store OR Stack_Push;

    --===================================================================================
    --
    -- Branch & Stack Instructions
    --

    BranchSwitch    <= Instr(13 DOWNTO 12);
    Branch          <= JMP_Type AND Instr(11);
    Branch_Taken    <= Branch AND BranchCond;

    Stack           <= JMP_Type AND Instr(10);
    Stack_Push      <= Stack AND (NOT Instr(9));
    Stack_Pop       <= Stack AND Instr(9);

    Flags_Restore   <= JMP_Type AND Instr(8);
    PC_Flags_Save   <= JMP_Type AND Instr(7);

    WITH BranchSwitch SELECT
        BranchCond  <=  '1'         WHEN "00",
                        Flags(0)    WHEN "01",
                        Flags(1)    WHEN "10",
                        Flags(2)    WHEN OTHERS;
    
END ARCHITECTURE;