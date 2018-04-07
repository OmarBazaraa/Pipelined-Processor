LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

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

        EXE_Src                 : IN  STD_LOGIC_VECTOR(19 DOWNTO 0);
        EXE_Dst                 : IN  STD_LOGIC_VECTOR(19 DOWNTO 0);
        EXE_Ctrl                : IN  STD_LOGIC_VECTOR(19 DOWNTO 0);

        MEM_Src                 : IN  STD_LOGIC_VECTOR(19 DOWNTO 0);
        MEM_Dst                 : IN  STD_LOGIC_VECTOR(19 DOWNTO 0);
        MEM_Ctrl                : IN  STD_LOGIC_VECTOR(19 DOWNTO 0);

        WRB_Src                 : IN  STD_LOGIC_VECTOR(19 DOWNTO 0);
        WRB_Dst                 : IN  STD_LOGIC_VECTOR(19 DOWNTO 0);
        WRB_Ctrl                : IN  STD_LOGIC_VECTOR(19 DOWNTO 0);

        --
        -- Outputs
        --

        Src_Dout                : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
        Dst_Dout                : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);

        PC_Next                 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);

        Stall                   : OUT STD_LOGIC;
        Flush                   : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE hazard_unit OF hazard_unit IS

    SIGNAL PC_Flags             : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL PC_Plus_1            : STD_LOGIC_VECTOR( 9 DOWNTO 0);

    SIGNAL Src_Data             : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL Src_Data_FW          : STD_LOGIC_VECTOR(15 DOWNTO 0);

    SIGNAL Dst_Data             : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL Dst_Data_FW          : STD_LOGIC_VECTOR(15 DOWNTO 0);

    SIGNAL Load_Depend          : STD_LOGIC;
    SIGNAL Load_PC              : STD_LOGIC;
    SIGNAL WRB_Load_PC          : STD_LOGIC;

BEGIN

    --===================================================================================
    --
    -- SRC Data Forwarding
    --
 
    Src_Data    <=  Immediate_Val           WHEN Immediate_Load                                 ELSE
                    Port_In_Data            WHEN Port_In_RD                                     ELSE
                    PC_Flags                WHEN PC_Flags_Save                                  ELSE
                    Dst_Data_FW             WHEN Mem_Addr_Switch                                ELSE
                    Src_Data_FW;

                    -- Forward the output of the execution stage
    Src_Data_FW <=  MEM_Src(15 DOWNTO 0)    WHEN (MEM_Src(19) AND Rsrc=MEM_Src(18 DOWNTO 16))   ELSE
                    MEM_Dst(15 DOWNTO 0)    WHEN (MEM_Dst(19) AND Rsrc=MEM_Dst(18 DOWNTO 16))   ELSE

                    -- Forward the output of the memory stage
                    WRB_Dst(15 DOWNTO 0)    WHEN (WRB_Src(19) AND Rsrc=WRB_Src(18 DOWNTO 16))   ELSE
                    WRB_Dst(15 DOWNTO 0)    WHEN (WRB_Dst(19) AND Rsrc=WRB_Dst(18 DOWNTO 16))   ELSE

                    -- No forwarding
                    Rsrc_Data;


    Src_Dout    <=  Rsrc_WB & Rsrc & Src_Data;
    PC_Flags    <= "00" & Flags & PC_Fetching;

    --===================================================================================
    --
    -- DST Data Forwarding
    --

    Dst_Data    <=  Mem_EA                  WHEN Mem_EA_Load                                    ELSE
                    Shift_Val               WHEN Shift_Load                                     ELSE
                    Dst_Data_FW;

                    -- Forward the output of the execution stage
    Dst_Data_FW <=  MEM_Src(15 DOWNTO 0)    WHEN (MEM_Src(19) AND Rdst=MEM_Src(18 DOWNTO 16))   ELSE
                    MEM_Dst(15 DOWNTO 0)    WHEN (MEM_Dst(19) AND Rdst=MEM_Dst(18 DOWNTO 16))   ELSE

                    -- Forward the output of the memory stage
                    WRB_Dst(15 DOWNTO 0)    WHEN (WRB_Src(19) AND Rdst=WRB_Src(18 DOWNTO 16))   ELSE
                    WRB_Dst(15 DOWNTO 0)    WHEN (WRB_Dst(19) AND Rdst=WRB_Dst(18 DOWNTO 16))   ELSE

                    -- No forwarding
                    Rdst_Data;


    Dst_Dout    <=  Rdst_WB & Rdst & Dst_Data;

    --===================================================================================
    --
    -- PC Next Address Unit
    --

    PC_Plus_1   <=  PC_Fetching + (0 => '1', OTHERS => '0');

    PC_Next     <=  PC_Reset                WHEN RESET              ELSE
                    Src_Data_FW             WHEN Branch_Taken       ELSE
                    WRB_Src(9 DOWNTO 0)     WHEN WRB_Load_PC        ELSE
                    PC_Plus_1;

    --===================================================================================
    --
    -- Stall Detection unit
    --

    Load_Depend <=  (Rsrc_Load AND Rsrc=EXE_Src(18 DOWNTO 16)) OR
                    (Rdst_Load AND Rdst=EXE_Src(18 DOWNTO 16));

    Stall       <=  EXE_Ctrl(2) AND Load_Depend;

    --===================================================================================
    --
    -- Flush Detection unit
    --

    WRB_Load_PC <=  WRB_Src(19) AND WRB_Src(18 DOWNTO 16)="111";

    Load_PC     <=  (Rsrc_WB AND Rsrc="111") OR
                    (MEM_Src(19) AND MEM_Src(18 DOWNTO 16)="111") OR
                    (WRB_Load_PC);

    Flush       <=  Immediate_Load OR Branch_Taken OR Load_PC;

END ARCHITECTURE;