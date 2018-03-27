LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY control_unit IS
    PORT(
        EXT_CLK, HARD_RST   : IN  STD_LOGIC;
        INTR                : IN  STD_LOGIC;

        IR                  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
        PC                  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
        Src                 : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
        Dst                 : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
        Imm                 : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
        Flags               : IN  STD_LOGIC_VECTOR( 3 DOWNTO 0);

        PC_NXT              : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        PC_EN               : OUT STD_LOGIC;
        IR_EN               : OUT STD_LOGIC;
        Branch              : OUT STD_LOGIC;
        Flush               : OUT STD_LOGIC;

        SrcVal              : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        Rsrc                : OUT STD_LOGIC_VECTOR( 2 DOWNTO 0);
        RsrcWB              : OUT STD_LOGIC;
        RsrcLoad            : OUT STD_LOGIC;

        DstVal              : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        Rdst                : OUT STD_LOGIC_VECTOR( 2 DOWNTO 0);
        RdstWB              : OUT STD_LOGIC;
        RdstLoad            : OUT STD_LOGIC;

        ImmediateLoad       : OUT STD_LOGIC;

        ShiftAmount         : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);
        ShiftEN             : OUT STD_LOGIC;

        ALU_Opr             : OUT STD_LOGIC_VECTOR( 5 DOWNTO 0);
        FlagEN              : OUT STD_LOGIC;
        FlagRestore         : OUT STD_LOGIC;
        FlagSave            : OUT STD_LOGIC;

        MemAddr             : OUT STD_LOGIC_VECTOR( 9 DOWNTO 0);
        MemAddrSP           : OUT STD_LOGIC;
        MemAddrSwitch       : OUT STD_LOGIC;
        MemRD               : OUT STD_LOGIC;
        MemWR               : OUT STD_LOGIC;

        PortIn              : OUT STD_LOGIC;
        PortOut             : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE arch_control_unit OF control_unit IS

BEGIN
    
END ARCHITECTURE;