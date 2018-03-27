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

    SIGNAL PC_Cur       : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL PC_Nxt       : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL PC_EN        : STD_LOGIC;

    SIGNAL Flags_EN     : STD_LOGIC;
    SIGNAL Flags_Din    : STD_LOGIC_VECTOR( 3 DOWNTO 0);
    SIGNAL Flags_Dout   : STD_LOGIC_VECTOR( 3 DOWNTO 0);

    -------------------------------------------------------
    --
    -- Decode Stage
    --

    -- From fetch stage
    SIGNAL DEC_IR_Din           : STD_LOGIC_VECTOR(15 DOWNTO 0);

    -- To decode stage
    SIGNAL DEC_IR_Dout          : STD_LOGIC_VECTOR(15 DOWNTO 0);
    
    SIGNAL DEC_IR_EN            : STD_LOGIC;
    SIGNAL DEC_IR_RST           : STD_LOGIC;
    SIGNAL DEC_Flush            : STD_LOGIC;

    SIGNAL DEC_Rsrc             : STD_LOGIC_VECTOR( 2 DOWNTO 0);
    SIGNAL DEC_Rsrc_Dout        : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL DEC_Rdst             : STD_LOGIC_VECTOR( 2 DOWNTO 0);
    SIGNAL DEC_Rdst_Dout        : STD_LOGIC_VECTOR(15 DOWNTO 0);

    -------------------------------------------------------
    --
    -- Execute Stage
    --

    -- From decode stage
    SIGNAL EXE_Src_Din          : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL EXE_Dst_Din          : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL EXE_Ctrl_Din         : STD_LOGIC_VECTOR(19 DOWNTO 0);
    
    -- To execute stage
    SIGNAL EXE_Src              : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL EXE_Dst              : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL EXE_Ctrl             : STD_LOGIC_VECTOR(19 DOWNTO 0);

    SIGNAL EXE_Opr              : STD_LOGIC_VECTOR( 4 DOWNTO 0);
    SIGNAL EXE_Res1             : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL EXE_Res2             : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL EXE_Flags            : STD_LOGIC_VECTOR( 3 DOWNTO 0);
    SIGNAL EXE_Flags_EN         : STD_LOGIC;

    -------------------------------------------------------
    --
    -- Memory Stage
    --

    -- From execute stage
    SIGNAL MEM_Src_Din          : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL MEM_Dst_Din          : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL MEM_Ctrl_Din         : STD_LOGIC_VECTOR(13 DOWNTO 0);
    
    -- To memory stage
    SIGNAL MEM_Src              : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL MEM_Dst              : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL MEM_Ctrl             : STD_LOGIC_VECTOR(13 DOWNTO 0);

    SIGNAL MEM_Addr             : STD_LOGIC_VECTOR(10 DOWNTO 0);
    SIGNAL MEM_Addr_Switch      : STD_LOGIC;
    SIGNAL MEM_WR               : STD_LOGIC;
    SIGNAL MEM_RD               : STD_LOGIC;
    SIGNAL MEM_Flags_Restore    : STD_LOGIC;
    SIGNAL MEM_Din              : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL MEM_Dout             : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL MEM_PC               : STD_LOGIC_VECTOR( 9 DOWNTO 0);
    SIGNAL MEM_Flags            : STD_LOGIC_VECTOR( 3 DOWNTO 0);

    -------------------------------------------------------
    --
    -- Write Back Stage
    --

    -- From memory stage
    SIGNAL WB_Src_Din           : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL WB_Dst_Din           : STD_LOGIC_VECTOR(19 DOWNTO 0);
    
    -- To write back stage
    SIGNAL WB_Src               : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL WB_Dst               : STD_LOGIC_VECTOR(19 DOWNTO 0);

    SIGNAL WB_Src_Val           : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL WB_Rsrc              : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL WB_Rsrc_WB           : STD_LOGIC;

    SIGNAL WB_Dst_Val           : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL WB_Rdst              : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL WB_Rdst_WB           : STD_LOGIC;

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
        Address         => PC_Cur(9 DOWNTO 0),
        Dout            => DEC_IR_Din
    );

    --===================================================================================
    --
    -- Decode Stage
    --

    DEC_IR_RST  <= HARD_RST OR DEC_Flush;

    DEC_IR:
    ENTITY work.register_edge_falling
    GENERIC MAP(n => 16)
    PORT MAP(EXT_CLK, DEC_IR_RST, DEC_IR_EN, '0', DEC_IR_Din, DEC_IR_Dout);

    -------------------------------------------------------

    REG_FILE:
    ENTITY work.register_file
    PORT MAP(
        CLK             => EXT_CLK,
        RST             => HARD_RST,

        PC_WR           => '1',
        PC_Din          => PC_Nxt,

        Reg_A_WR        => WB_Rdst_WB,
        Reg_A_WR_Addr   => WB_Rdst,
        Reg_A_Din       => WB_Dst_Val,

        Reg_B_WR        => WB_Rsrc_WB,
        Reg_B_WR_Addr   => WB_Rsrc,
        Reg_B_Din       => WB_Src_Val,

        PC_Dout         => PC_Cur,

        Reg_A_RD_Addr   => DEC_Rdst,
        Reg_A_Dout      => DEC_Rdst_Dout,

        Reg_B_RD_Addr   => DEC_Rsrc,
        Reg_B_Dout      => DEC_Rsrc_Dout
    );

    CTRL_UNIT:
    ENTITY work.control_unit
    PORT MAP(
        RESET           => RESET,
        INTR            => INTR,

        Instr           => DEC_IR_Dout,

        PC              => PC_Cur,
        Rsrc_Val        => DEC_Rsrc_Dout,
        Rdst_Val        => DEC_Rdst_Dout,
        Immediate_Val   => DEC_IR_Din,
        Flags           => Flags_Dout,

        EXE_MEM_Src     => MEM_Src,
        EXE_MEM_Dst     => MEM_Dst,
        EXE_MEM_Ctrl    => MEM_Ctrl,

        MEM_WB_Src      => WB_Src,
        MEM_WB_Dst      => WB_Dst,
        MEM_WB_Ctrl     => WB_Ctrl,

        IR_EN           => DEC_IR_EN,
        PC_EN           => PC_EN,
        
        Flush_IR        => DEC_Flush,

        PC_Nxt          => PC_Nxt,

        Src_Dout        => EXE_Src_Din,
        Dst_Dout        => EXE_Dst_Din,
        Ctrl_Dout       => EXE_Ctrl_Din
    );

    --===================================================================================
    --
    -- Execute Stage
    --

    EXE_SRC:
    ENTITY work.register_edge_falling
    GENERIC MAP(n => 20)
    PORT MAP(EXT_CLK, HARD_RST, '1', '0', EXE_Src_Din, EXE_Src);

    EXE_DST:
    ENTITY work.register_edge_falling
    GENERIC MAP(n => 20)
    PORT MAP(EXT_CLK, HARD_RST, '1', '0', EXE_Dst_Din, EXE_Dst);

    EXE_CTRL:
    ENTITY work.register_edge_falling
    GENERIC MAP(n => 20)
    PORT MAP(EXT_CLK, HARD_RST, '1', '0', EXE_Ctrl_Din, EXE_Ctrl);

    -------------------------------------------------------

    EXE_Opr         <= EXE_Ctrl(19 DOWNTO 15);
    EXE_Flags_EN    <= EXE_Ctrl(14);

    EXE_ALU:
    ENTITY work.ALU
    GENERIC MAP(n => 16)
    PORT(
        Opr     => EXE_Opr,
        A       => EXE_Src(15 DOWNTO 0),
        B       => EXE_Dst(15 DOWNTO 0),
        Res1    => EXE_Res1,
        Res2    => EXE_Res2,
        Flags   => EXE_Flags
    );


    Flags_EN    <= EXE_Flags_EN OR MEM_Flags_Restore;
    Flags_Din   <= EXE_Flags WHEN EXE_Flags_EN='1' ELSE MEM_Flags;

    FLAG_REG:
    ENTITY work.register_edge_rising
    GENERIC MAP(n => 16)
    PORT MAP(EXT_CLK, HARD_RST, Flags_EN, '0', Flags_Din, Flags_Dout);


    MEM_Src_Din(15 DOWNTO 0)    <= EXE_Res2;
    MEM_Src_Din(19 DOWNTO 16)   <= EXE_Src(19 DOWNTO 16);

    MEM_Dst_Din(15 DOWNTO 0)    <= EXE_Res1;
    MEM_Dst_Din(19 DOWNTO 16)   <= EXE_Src(19 DOWNTO 16);

    MEM_Ctrl_Din                <= EXE_Ctrl(13 DOWNTO 0);

    --===================================================================================
    --
    -- Memory Stage
    --

    MEM_SRC:
    ENTITY work.register_edge_rising
    GENERIC MAP(n => 20)
    PORT MAP(EXT_CLK, HARD_RST, '1', '0', MEM_Src_Din, MEM_Src);

    MEM_DST:
    ENTITY work.register_edge_rising
    GENERIC MAP(n => 20)
    PORT MAP(EXT_CLK, HARD_RST, '1', '0', MEM_Dst_Din, MEM_Dst);

    MEM_CTRL:
    ENTITY work.register_edge_rising
    GENERIC MAP(n => 14)
    PORT MAP(EXT_CLK, HARD_RST, '1', '0', MEM_Ctrl_Din, MEM_Ctrl);

    -------------------------------------------------------

    MEM_Addr            <= MEM_Ctrl(9 DOWNTO 0) WHEN MEM_Addr_Switch='0' ELSE MEM_Dst(9 DOWNTO 0);
    MEM_Addr_Switch     <= MEM_Ctrl(10);
    MEM_WR              <= MEM_Ctrl(11);
    MEM_RD              <= MEM_Ctrl(12);
    MEM_Flags_Restore   <= MEM_Ctrl(13);

    MEM_Din             <= MEM_Src(15 DOWNTO 0);
    MEM_PC              <= MEM_Dout(9 DOWNTO 0);
    MEM_Flags           <= MEM_Dout(31 DOWNTO 10);

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


    WB_Src_Din(15 DOWNTO 0)     <= MEM_Src(15 DOWNTO 0) WHEN MEM_RD='0' ELSE MEM_Dout;
    WB_Src_Din(19 DOWNTO 16)    <= MEM_Src(19 DOWNTO 16);

    WB_Dst_Din                  <= MEM_Dst;

    --===================================================================================
    --
    -- Write Back Stage
    --

    WB_SRC:
    ENTITY work.register_edge_rising
    GENERIC MAP(n => 20)
    PORT MAP(EXT_CLK, HARD_RST, '1', '0', WB_Src_Din, WB_Src);

    WB_DST:
    ENTITY work.register_edge_rising
    GENERIC MAP(n => 20)
    PORT MAP(EXT_CLK, HARD_RST, '1', '0', WB_Dst_Din, WB_Dst);

    -------------------------------------------------------

    WB_Src_Val  <= WB_Src(15 DOWNTO 0);
    WB_Rsrc     <= WB_Src(18 DOWNTO 16);
    WB_Rsrc_WB  <= WB_Src(19);

    WB_Dst_Val  <= WB_Dst(15 DOWNTO 0);
    WB_Rdst     <= WB_Dst(18 DOWNTO 16);
    WB_Rdst_WB  <= WB_Dst(19);

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