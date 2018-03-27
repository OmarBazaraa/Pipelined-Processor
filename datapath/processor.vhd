LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.Utilities.ALL;

ENTITY processor IS
    PORT(
        EXT_CLK, HARD_RST       : IN  STD_LOGIC;
        RESET                   : IN  STD_LOGIC;
        INTR                    : IN  STD_LOGIC;
        PORT_IN                 : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
        PORT_OUT                : IN  STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE arch_processor OF processor IS

    SIGNAL CurPC        : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL NxtPC        : STD_LOGIC_VECTOR(15 DOWNTO 0);

    SIGNAL CurInstr     : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL NxtInstr     : STD_LOGIC_VECTOR(15 DOWNTO 0);

    SIGNAL IR_EN        : STD_LOGIC;

BEGIN

    --===================================================================================
    --
    -- Fetch Stage
    --

    -- Program Memory
    PROG_MEM:
    ENTITY work.RAM
    GENERIC(n => 16, m => 10);
    PORT MAP(
        CLK             => EXT_CLK,
        WR              => '0',
        Address         => CurPC(9 DOWNTO 0),
        Dout            => NxtInstr
    );

    -- IR
    IR:
    ENTITY work.register_edge_falling
    GENERIC MAP(n => 16)
    PORT MAP(EXT_CLK, HARD_RST, IR_EN, '0', NxtInstr, CurInstr);

    -- Next PC calculation
    

    --===================================================================================
    --
    -- Decode Stage
    --

    REG_FILE:
    ENTITY work.register_file
    PORT MAP(
        CLK             => EXT_CLK,
        RST             => HARD_RST,
        PC_WR           => '1',
        PC_Din          => NxtPC,
        Reg_A_WR        => ,
        Reg_A_WR_Addr   => ,
        Reg_A_Din       => ,
        Reg_B_WR        => ,
        Reg_B_WR_Addr   => ,
        Reg_B_Din       => ,
        PC_Dout         => CurPC,
        Reg_A_RD_Addr   => ,
        Reg_A_Dout      => ,
        Reg_B_RD_Addr   => ,
        Reg_B_Dout      => 
    );

    --===================================================================================
    --
    -- Execute Stage
    --

    --===================================================================================
    --
    -- Memory Stage
    --

    DATA_MEM:
    ENTITY work.RAM
    GENERIC(n => 16, m => 10);
    PORT MAP(
        CLK             => EXT_CLK,
        WR              => ,
        Address         => ,
        Din             => ,
        Dout            => 
    );

    --===================================================================================
    --
    -- Write Back Stage
    --

    
END ARCHITECTURE;