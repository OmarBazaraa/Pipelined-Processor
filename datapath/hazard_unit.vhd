LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY hazard_unit IS
    PORT(
        RESET                   : IN  STD_LOGIC;
        INTR                    : IN  STD_LOGIC;

        --
        -- Control signals of decode stage
        --

        Rsrc                    : IN  STD_LOGIC_VECTOR( 2 DOWNTO 0);
        Rsrc_WB                 : IN  STD_LOGIC;
        Rsrc_Load               : IN  STD_LOGIC;
        Rsrc_Data               : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);

        Rdst                    : IN  STD_LOGIC_VECTOR( 2 DOWNTO 0);
        Rdst_WB                 : IN  STD_LOGIC;
        Rdst_Load               : IN  STD_LOGIC;
        Rdst_Data               : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
        
        Immediate_Load          : IN  STD_LOGIC;
        Immediate_Val           : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);

        Shift_Load              : IN  STD_LOGIC;
        Shift_Val               : IN  STD_LOGIC_VECTOR( 3 DOWNTO 0);

        PC_Flags_Save           : IN  STD_LOGIC;
        PC_Fetching             : IN  STD_LOGIC_VECTOR( 9 DOWNTO 0);
        PC_To_Store             : IN  STD_LOGIC_VECTOR( 9 DOWNTO 0);
        PC_Reset                : IN  STD_LOGIC_VECTOR( 9 DOWNTO 0);
        PC_INTR                 : IN  STD_LOGIC_VECTOR( 9 DOWNTO 0);
        Flags                   : IN  STD_LOGIC_VECTOR( 3 DOWNTO 0);

        Mem_Addr_Switch         : IN  STD_LOGIC;
        Mem_EA_Load             : IN  STD_LOGIC;
        Mem_EA                  : IN  STD_LOGIC_VECTOR( 9 DOWNTO 0);   

        Port_In_RD              : IN  STD_LOGIC;
        Port_In_Data            : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);

        Branch_Taken            : IN  STD_LOGIC;

        --
        -- Inputs of forward stages
        --

        DEC_Ctrl                : IN  STD_LOGIC_VECTOR( 9 DOWNTO 0);

        EXE_Src                 : IN  STD_LOGIC_VECTOR(19 DOWNTO 0);
        EXE_Dst                 : IN  STD_LOGIC_VECTOR(19 DOWNTO 0);
        EXE_Ctrl                : IN  STD_LOGIC_VECTOR( 9 DOWNTO 0);

        MEM_Src                 : IN  STD_LOGIC_VECTOR(19 DOWNTO 0);
        MEM_Dst                 : IN  STD_LOGIC_VECTOR(19 DOWNTO 0);
        MEM_Ctrl                : IN  STD_LOGIC_VECTOR( 4 DOWNTO 0);

        WRB_Src                 : IN  STD_LOGIC_VECTOR(19 DOWNTO 0);
        WRB_Dst                 : IN  STD_LOGIC_VECTOR(19 DOWNTO 0);
        WRB_Ctrl                : IN  STD_LOGIC_VECTOR( 1 DOWNTO 0);

        --
        -- Outputs
        --

        Src_Dout                : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
        Dst_Dout                : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);

        PC_Next                 : OUT STD_LOGIC_VECTOR( 9 DOWNTO 0);

        Stall                   : OUT STD_LOGIC;
        Flush                   : OUT STD_LOGIC;

        INTR_Stall              : OUT STD_LOGIC;
        RESET_Stall             : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE hazard_unit OF hazard_unit IS

    SIGNAL PC_Flags             : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL PC_Plus_1            : STD_LOGIC_VECTOR( 9 DOWNTO 0);

    SIGNAL Eff_Addr             : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL Shift_Data           : STD_LOGIC_VECTOR(15 DOWNTO 0);

    SIGNAL Src_Data             : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL Src_Data_FW          : STD_LOGIC_VECTOR(15 DOWNTO 0);

    SIGNAL Dst_Data             : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL Dst_Data_FW          : STD_LOGIC_VECTOR(15 DOWNTO 0);

    SIGNAL Load_Depend          : STD_LOGIC;
    SIGNAL Load_PC              : STD_LOGIC;
    SIGNAL Load_Use_Stall       : STD_LOGIC;

    SIGNAL DEC_PC_WB            : STD_LOGIC;
    SIGNAL EXE_PC_WB            : STD_LOGIC;
    SIGNAL MEM_PC_WB            : STD_LOGIC;
    SIGNAL WRB_PC_WB            : STD_LOGIC;



    SIGNAL DEC_ALU_Dec          : STD_LOGIC;
    SIGNAL EXE_ALU_Dec          : STD_LOGIC;

    SIGNAL DEC_Addr_Pre_Zero    : STD_LOGIC;
    SIGNAL EXE_Addr_Pre_Zero    : STD_LOGIC;

    SIGNAL DEC_Addr_Intr        : STD_LOGIC;
    SIGNAL EXE_Addr_Intr        : STD_LOGIC;

    SIGNAL DEC_Addr_Reset       : STD_LOGIC;
    SIGNAL EXE_Addr_Reset       : STD_LOGIC;

BEGIN

    --===================================================================================
    --
    -- SRC Data Forwarding
    --
 
    Src_Data    <=  Immediate_Val           WHEN Immediate_Load='1'     ELSE
                    PC_Flags                WHEN PC_Flags_Save='1'      ELSE
                    Dst_Data_FW             WHEN Mem_Addr_Switch='1'    ELSE
                    Src_Data_FW;

                    -- Forward the output of the execution stage
    Src_Data_FW <=  MEM_Src(15 DOWNTO 0)    WHEN (MEM_Src(19)='1' AND Rsrc=MEM_Src(18 DOWNTO 16))   ELSE
                    MEM_Dst(15 DOWNTO 0)    WHEN (MEM_Dst(19)='1' AND Rsrc=MEM_Dst(18 DOWNTO 16))   ELSE

                    -- Forward the output of the memory stage
                    WRB_Src(15 DOWNTO 0)    WHEN (WRB_Src(19)='1' AND Rsrc=WRB_Src(18 DOWNTO 16))   ELSE
                    WRB_Dst(15 DOWNTO 0)    WHEN (WRB_Dst(19)='1' AND Rsrc=WRB_Dst(18 DOWNTO 16))   ELSE

                    -- No forwarding
                    Rsrc_Data;

    Src_Dout    <=  Rsrc_WB & Rsrc & Src_Data;


    PC_Flags    <= "00" & Flags & PC_To_Store;

    --===================================================================================
    --
    -- DST Data Forwarding
    --

    Dst_Data    <=  Eff_Addr                WHEN Mem_EA_Load='1'        ELSE
                    Port_In_Data            WHEN Port_In_RD='1'         ELSE
                    Shift_Data              WHEN Shift_Load='1'         ELSE
                    Dst_Data_FW;

                    -- Forward the output of the execution stage
    Dst_Data_FW <=  MEM_Src(15 DOWNTO 0)    WHEN (MEM_Src(19)='1' AND Rdst=MEM_Src(18 DOWNTO 16))   ELSE
                    MEM_Dst(15 DOWNTO 0)    WHEN (MEM_Dst(19)='1' AND Rdst=MEM_Dst(18 DOWNTO 16))   ELSE

                    -- Forward the output of the memory stage
                    WRB_Src(15 DOWNTO 0)    WHEN (WRB_Src(19)='1' AND Rdst=WRB_Src(18 DOWNTO 16))   ELSE
                    WRB_Dst(15 DOWNTO 0)    WHEN (WRB_Dst(19)='1' AND Rdst=WRB_Dst(18 DOWNTO 16))   ELSE

                    -- No forwarding
                    Rdst_Data;

    Dst_Dout    <=  Rdst_WB & Rdst & Dst_Data;


    Eff_Addr    <=  "000000" & Mem_EA;
    Shift_Data  <=  "000000000000" & Shift_Val;

    --===================================================================================
    --
    -- PC Next Address Unit
    --

    PC_Plus_1   <=  PC_Fetching + "0000000001";

    PC_Next     <=  Src_Data_FW(9 DOWNTO 0) WHEN Branch_Taken='1'   ELSE
                    WRB_Src(9 DOWNTO 0)     WHEN WRB_PC_WB='1'      ELSE
                    PC_Reset                WHEN RESET='1'          ELSE
                    PC_INTR                 WHEN INTR='1'           ELSE
                    PC_Plus_1;

    --===================================================================================
    --
    -- Stall Detection unit
    --

    Load_Depend     <=  '1' WHEN
                                (Rsrc_Load='1' AND Rsrc=EXE_Src(18 DOWNTO 16)) OR
                                (Rdst_Load='1' AND Rdst=EXE_Src(18 DOWNTO 16)) ELSE
                        '0';

    Load_Use_Stall  <=  EXE_Ctrl(1) AND Load_Depend;

    Stall           <=  Load_Use_Stall;   

    --===================================================================================
    --
    -- Flush Detection unit
    --

    DEC_PC_WB       <=  '1' WHEN (Rsrc_WB='1' AND Rsrc="111")                       ELSE '0';
    EXE_PC_WB       <=  '1' WHEN (EXE_Src(19)='1' AND EXE_Src(18 DOWNTO 16)="111")  ELSE '0';
    MEM_PC_WB       <=  '1' WHEN (MEM_Src(19)='1' AND MEM_Src(18 DOWNTO 16)="111")  ELSE '0';
    WRB_PC_WB       <=  '1' WHEN (WRB_Src(19)='1' AND WRB_Src(18 DOWNTO 16)="111")  ELSE '0';

    Load_PC         <=  DEC_PC_WB OR EXE_PC_WB OR MEM_PC_WB OR WRB_PC_WB;

    Flush           <=  (Immediate_Load OR Branch_Taken OR Load_PC) AND (NOT Load_Use_Stall);

    --===================================================================================
    --
    -- Interrupt Stall Detection unit
    --

    -- Note: Ctrl(9..6)=ALU_Opr

    DEC_ALU_Dec         <=  '1' WHEN DEC_Ctrl(9 DOWNTO 6)="0111" ELSE '0';
    EXE_ALU_Dec         <=  '1' WHEN EXE_Ctrl(9 DOWNTO 6)="0111" ELSE '0';

    DEC_Addr_Pre_Zero   <=  '1' WHEN Dst_Data(9 DOWNTO 2)="00000000"    ELSE '0';
    EXE_Addr_Pre_Zero   <=  '1' WHEN EXE_Dst(9 DOWNTO 2)="00000000"     ELSE '0';


    -- Stall interrupt when previous instructions are writing in M[1]

    DEC_Addr_Intr       <=  '1' WHEN
                                    DEC_Addr_Pre_Zero='1' AND
                                    Dst_Data(1)=DEC_ALU_Dec AND
                                    Dst_Data(0)=(NOT DEC_ALU_Dec)
                                ELSE
                            '0';

    EXE_Addr_Intr       <=  '1' WHEN
                                    DEC_Addr_Pre_Zero='1' AND
                                    EXE_Dst(1)=EXE_ALU_Dec AND
                                    EXE_Dst(0)=(NOT EXE_ALU_Dec)
                                ELSE
                            '0';

    -- Note: Ctrl(2)=Mem_WR
    INTR_Stall          <=  INTR AND (
                                (DEC_Ctrl(2) AND DEC_Addr_Intr) OR
                                (EXE_Ctrl(2) AND EXE_Addr_Intr)
                            );

    --===================================================================================
    --
    -- Reset Stall Detection unit
    --

    -- Stall reset when previous instructions are writing in M[0]

    DEC_Addr_Reset      <=  '1' WHEN    DEC_Addr_Pre_Zero='1' AND
                                        Dst_Data(1)='0' AND
                                        Dst_Data(0)=DEC_ALU_Dec
                                ELSE
                            '0';

    EXE_Addr_Reset      <=  '1' WHEN    EXE_Addr_Pre_Zero='1' AND
                                        EXE_Dst(1)='0' AND
                                        EXE_Dst(0)=EXE_ALU_Dec
                                ELSE
                            '0';

    -- Note: Ctrl(2)=Mem_WR
    RESET_Stall         <=  RESET AND (
                                (DEC_Ctrl(2) AND DEC_Addr_Reset) OR
                                (EXE_Ctrl(2) AND EXE_Addr_Reset)
                            );

END ARCHITECTURE;