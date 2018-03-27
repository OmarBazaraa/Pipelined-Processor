LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

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

    SIGNAL Flags_EN     : STD_LOGIC;
    SIGNAL Flags_Din    : STD_LOGIC_VECTOR( 3 DOWNTO 0);
    SIGNAL Flags_Dout   : STD_LOGIC_VECTOR( 3 DOWNTO 0);

    -------------------------------------------------------
    --
    -- Execute Stage
    --

    -- From decode stage
    SIGNAL EXE_NxtSrc       : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL EXE_NxtDst       : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL EXE_NxtCtrl      : STD_LOGIC_VECTOR(19 DOWNTO 0);
    
    -- To execute stage
    SIGNAL EXE_CurSrc       : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL EXE_CurDst       : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL EXE_CurCtrl      : STD_LOGIC_VECTOR(19 DOWNTO 0);

    SIGNAL EXE_Opr          : STD_LOGIC_VECTOR( 4 DOWNTO 0);
    SIGNAL EXE_Res1         : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL EXE_Res2         : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL EXE_Flags        : STD_LOGIC_VECTOR( 3 DOWNTO 0);
    SIGNAL EXE_FlagEN       : STD_LOGIC;

    -------------------------------------------------------
    --
    -- Memory Stage
    --

    -- From execute stage
    SIGNAL MEM_NxtSrc       : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL MEM_NxtDst       : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL MEM_NxtCtrl      : STD_LOGIC_VECTOR(13 DOWNTO 0);
    
    -- To memory stage
    SIGNAL MEM_CurSrc       : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL MEM_CurDst       : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL MEM_CurCtrl      : STD_LOGIC_VECTOR(13 DOWNTO 0);

    SIGNAL MEM_Addr         : STD_LOGIC_VECTOR(10 DOWNTO 0);
    SIGNAL MEM_AddrSwitch   : STD_LOGIC;
    SIGNAL MEM_WR           : STD_LOGIC;
    SIGNAL MEM_RD           : STD_LOGIC;
    SIGNAL MEM_FlagRestore  : STD_LOGIC;
    SIGNAL MEM_Din          : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL MEM_Dout         : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL MEM_PC           : STD_LOGIC_VECTOR( 9 DOWNTO 0);
    SIGNAL MEM_Flags        : STD_LOGIC_VECTOR( 3 DOWNTO 0);

    -------------------------------------------------------
    --
    -- Write Back Stage
    --

    -- From memory stage
    SIGNAL WB_NxtSrc        : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL WB_NxtDst        : STD_LOGIC_VECTOR(19 DOWNTO 0);
    
    -- To write back stage
    SIGNAL WB_CurSrc        : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL WB_CurDst        : STD_LOGIC_VECTOR(19 DOWNTO 0);

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

        Reg_A_WR        => WB_CurDst(19),
        Reg_A_WR_Addr   => WB_CurDst(18 DOWNTO 16),
        Reg_A_Din       => WB_CurDst(15 DOWNTO 0),

        Reg_B_WR        => WB_CurSrc(19),
        Reg_B_WR_Addr   => WB_CurSrc(18 DOWNTO 16),
        Reg_B_Din       => WB_CurSrc(15 DOWNTO 0),

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

    EXE_SRC:
    ENTITY work.register_edge_falling
    GENERIC MAP(n => 20)
    PORT MAP(EXT_CLK, HARD_RST, '1', '0', EXE_NxtSrc, EXE_CurSrc);

    EXE_DST:
    ENTITY work.register_edge_falling
    GENERIC MAP(n => 20)
    PORT MAP(EXT_CLK, HARD_RST, '1', '0', EXE_NxtDst, EXE_CurDst);

    EXE_CTRL:
    ENTITY work.register_edge_falling
    GENERIC MAP(n => 20)
    PORT MAP(EXT_CLK, HARD_RST, '1', '0', EXE_NxtCtrl, EXE_CurCtrl);

    -------------------------------------------------------

    EXE_Opr     <= EXE_CurCtrl(19 DOWNTO 15);
    EXE_FlagEN  <= EXE_CurCtrl(14);

    EXE_ALU:
    ENTITY work.ALU
    GENERIC MAP(n => 16)
    PORT(
        Opr     => EXE_Opr,
        A       => EXE_CurSrc(15 DOWNTO 0),
        B       => EXE_CurDst(15 DOWNTO 0),
        Res1    => EXE_Res1,
        Res2    => EXE_Res2,
        Flags   => EXE_Flags
    );

    Flags_EN    <= EXE_FlagEN OR MEM_FlagRestore;
    Flags_Din   <= EXE_Flags WHEN EXE_FlagEN='1' ELSE MEM_Flags;

    FLAG_REG:
    ENTITY work.register_edge_rising
    GENERIC MAP(n => 16)
    PORT MAP(EXT_CLK, HARD_RST, Flags_EN, '0', Flags_Din, Flags_Dout);

    MEM_NxtSrc(15 DOWNTO 0)     <= EXE_Res2;
    MEM_NxtSrc(19 DOWNTO 16)    <= EXE_CurSrc(19 DOWNTO 16);

    MEM_NxtDst(15 DOWNTO 0)     <= EXE_Res1;
    MEM_NxtDst(19 DOWNTO 16)    <= EXE_CurSrc(19 DOWNTO 16);

    MEM_NxtCtrl                 <= EXE_CurCtrl(13 DOWNTO 0);

    --===================================================================================
    --
    -- Memory Stage
    --

    MEM_SRC:
    ENTITY work.register_edge_rising
    GENERIC MAP(n => 20)
    PORT MAP(EXT_CLK, HARD_RST, '1', '0', MEM_NxtSrc, MEM_CurSrc);

    MEM_DST:
    ENTITY work.register_edge_rising
    GENERIC MAP(n => 20)
    PORT MAP(EXT_CLK, HARD_RST, '1', '0', MEM_NxtDst, MEM_CurDst);

    MEM_CTRL:
    ENTITY work.register_edge_rising
    GENERIC MAP(n => 14)
    PORT MAP(EXT_CLK, HARD_RST, '1', '0', MEM_NxtCtrl, MEM_CurCtrl);

    -------------------------------------------------------

    MEM_Addr        <= MEM_CurCtrl(9 DOWNTO 0) WHEN MEM_AddrSwitch='0' ELSE MEM_CurDst(9 DOWNTO 0);
    MEM_AddrSwitch  <= MEM_CurCtrl(10);
    MEM_WR          <= MEM_CurCtrl(11);
    MEM_RD          <= MEM_CurCtrl(12);
    MEM_FlagRestore <= MEM_CurCtrl(13);

    MEM_Din         <= MEM_CurSrc(15 DOWNTO 0);
    MEM_PC          <= MEM_Dout(9 DOWNTO 0);
    MEM_Flags       <= MEM_Dout(31 DOWNTO 10);

    DATA_MEM:
    ENTITY work.RAM
    GENERIC(n => 16, m => 10);
    PORT MAP(
        CLK         => EXT_CLK,
        WR          => MEM_WR,
        Address     => MEM_Addr,
        Din         => MEM_Din,
        Dout        => MEM_Dout
    );

    WB_NxtSrc(15 DOWNTO 0)  <= MEM_CurSrc(15 DOWNTO 0) WHEN MEM_RD='0' ELSE MEM_Dout;
    WB_NxtSrc(19 DOWNTO 16) <= MEM_CurSrc(19 DOWNTO 16);

    WB_NxtDst               <= MEM_CurDst;

    -- TODO:
    -- Add unit to update PC & Restore Flags
    -- Needed for RET, RTI

    --===================================================================================
    --
    -- Write Back Stage
    --

    WB_SRC:
    ENTITY work.register_edge_rising
    GENERIC MAP(n => 20)
    PORT MAP(EXT_CLK, HARD_RST, '1', '0', WB_NxtSrc, WB_CurSrc);

    WB_DST:
    ENTITY work.register_edge_rising
    GENERIC MAP(n => 20)
    PORT MAP(EXT_CLK, HARD_RST, '1', '0', WB_NxtDst, WB_CurDst);

    
END ARCHITECTURE;


--================================================
--Fetch Stage:
--============

--PC

--================================================
--Decode Stage:
--=============

--IR
--PC+1

--================================================
--Execute Stage:
--==============

--Src
--Rsrc
--RsrcWB

--Dst
--Rdst
--RdstWB

--MemAddr
--MemAddrSwitch
--MemWR
--MemRD

--FlagRestore
--FlagEN
--ALU_Opr

--================================================
--Memory Stage:
--=============

--Src
--Rsrc
--RsrcWB

--Dst
--Rdst
--RdstWB

--MemAddr
--MemAddrSwitch
--MemWR
--MemRD

--FlagRestore

--================================================
--Write Back Stage:
--=================

--Src
--Rsrc
--RsrcWB

--Dst
--Rdst
--RdstWB