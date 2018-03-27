LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY control_unit IS
    PORT(
        RESET               : IN  STD_LOGIC;
        INTR                : IN  STD_LOGIC;

        Instr               : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);

        PC                  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
        Rsrc_Val            : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
        Rdst_Val            : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
        Immediate_Val       : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
        Flags               : IN  STD_LOGIC_VECTOR( 3 DOWNTO 0);

        EXE_MEM_Src         : IN  STD_LOGIC_VECTOR(20 DOWNTO 0);
        EXE_MEM_Dst         : IN  STD_LOGIC_VECTOR(20 DOWNTO 0);
        EXE_MEM_Ctrl        : IN  STD_LOGIC_VECTOR(20 DOWNTO 0);

        MEM_WB_Src          : IN  STD_LOGIC_VECTOR(20 DOWNTO 0);
        MEM_WB_Dst          : IN  STD_LOGIC_VECTOR(20 DOWNTO 0);
        MEM_WB_Ctrl         : IN  STD_LOGIC_VECTOR(20 DOWNTO 0);

        IR_EN               : OUT STD_LOGIC;
        PC_EN               : OUT STD_LOGIC;
        
        Flush_IR            : OUT STD_LOGIC;

        PC_Nxt              : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);

        Src_Dout            : OUT STD_LOGIC_VECTOR(20 DOWNTO 0);
        Dst_Dout            : OUT STD_LOGIC_VECTOR(20 DOWNTO 0);
        Ctrl_Dout           : OUT STD_LOGIC_VECTOR(20 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE arch_control_unit OF control_unit IS

    SIGNAL Branch           : STD_LOGIC;
    SIGNAL Flush            : STD_LOGIC;

    SIGNAL Src_Val          : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL Rsrc             : STD_LOGIC_VECTOR( 2 DOWNTO 0);
    SIGNAL Rsrc_WB          : STD_LOGIC;
    SIGNAL Rsrc_Load        : STD_LOGIC;

    SIGNAL Dst_Val          : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL Rdst             : STD_LOGIC_VECTOR( 2 DOWNTO 0);
    SIGNAL Rdst_WB          : STD_LOGIC;
    SIGNAL Rdst_Load        : STD_LOGIC;

    SIGNAL Immediate_Load   : STD_LOGIC;

    SIGNAL Shift_Val        : STD_LOGIC_VECTOR( 3 DOWNTO 0);
    SIGNAL Shift_Load       : STD_LOGIC;
 
    SIGNAL ALU_Opr          : STD_LOGIC_VECTOR( 5 DOWNTO 0);

    SIGNAL Flags_EN         : STD_LOGIC;
    SIGNAL Flags_Restore    : STD_LOGIC;
    SIGNAL Flags_Save       : STD_LOGIC;

    SIGNAL Mem_Addr         : STD_LOGIC_VECTOR( 9 DOWNTO 0);    
    SIGNAL Mem_Addr_SP      : STD_LOGIC;
    SIGNAL Mem_Addr_Switch  : STD_LOGIC;
    SIGNAL Mem_WR           : STD_LOGIC;
    SIGNAL Mem_RD           : STD_LOGIC;
    
    SIGNAL Port_In_RD       : STD_LOGIC;
    SIGNAL Port_Out_WR      : STD_LOGIC;
BEGIN
    
END ARCHITECTURE;