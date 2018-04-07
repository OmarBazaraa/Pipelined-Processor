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

    SIGNAL PC_Cur               : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL PC_Nxt               : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL PC_EN                : STD_LOGIC;

    SIGNAL Instr                : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL Instr_INTR           : STD_LOGIC_VECTOR(15 DOWNTO 0) := "1100010010110000";
        
    SIGNAL Flags_EN             : STD_LOGIC;
    SIGNAL Flags_Din            : STD_LOGIC_VECTOR( 3 DOWNTO 0);
    SIGNAL Flags_Dout           : STD_LOGIC_VECTOR( 3 DOWNTO 0);

    SIGNAL PC_Reset_Dout        : STD_LOGIC_VECTOR( 9 DOWNTO 0);
    SIGNAL PC_INTR_Dout         : STD_LOGIC_VECTOR( 9 DOWNTO 0);

    SIGNAL Stall                : STD_LOGIC;
    SIGNAL Flush                : STD_LOGIC;

    -------------------------------------------------------
    --
    -- Decode Stage
    --

    -- From fetch stage
    SIGNAL DEC_IR_Din           : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL DEC_PC_Din           : STD_LOGIC_VECTOR( 9 DOWNTO 0);

    -- To decode stage
    SIGNAL DEC_IR_Dout          : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL DEC_PC_Dout          : STD_LOGIC_VECTOR( 9 DOWNTO 0);
    
    SIGNAL DEC_IR_EN            : STD_LOGIC;
    SIGNAL DEC_IR_RST           : STD_LOGIC;
    SIGNAL DEC_Flush            : STD_LOGIC;

    SIGNAL DEC_Rsrc             : STD_LOGIC_VECTOR( 2 DOWNTO 0);
    SIGNAL DEC_Rsrc_WB          : STD_LOGIC;
    SIGNAL DEC_Rsrc_Load        : STD_LOGIC;
    SIGNAL DEC_Rsrc_Dout        : STD_LOGIC_VECTOR(15 DOWNTO 0);

    SIGNAL DEC_Rdst             : STD_LOGIC_VECTOR( 2 DOWNTO 0);
    SIGNAL DEC_Rdst_WB          : STD_LOGIC;
    SIGNAL DEC_Rdst_Load        : STD_LOGIC;
    SIGNAL DEC_Rdst_Dout        : STD_LOGIC_VECTOR(15 DOWNTO 0);

    SIGNAL DEC_Imm_Load         : STD_LOGIC;
    SIGNAL DEC_Shift_Load       : STD_LOGIC;
    SIGNAL DEC_Shift_Val        : STD_LOGIC_VECTOR( 3 DOWNTO 0);
    SIGNAL DEC_ALU_Opr          : STD_LOGIC_VECTOR( 5 DOWNTO 0);
    SIGNAL DEC_Flags_EN         : STD_LOGIC;
    SIGNAL DEC_Flags_Restore    : STD_LOGIC;
    SIGNAL DEC_Mem_EA           : STD_LOGIC_VECTOR( 9 DOWNTO 0);
    SIGNAL DEC_Mem_EA_Load      : STD_LOGIC;
    SIGNAL DEC_Mem_Addr_Switch  : STD_LOGIC;
    SIGNAL DEC_Mem_RD           : STD_LOGIC;
    SIGNAL DEC_Mem_WR           : STD_LOGIC;
    SIGNAL DEC_Port_In_RD       : STD_LOGIC;
    SIGNAL DEC_Port_Out_WR      : STD_LOGIC;
    SIGNAL DEC_MOV              : STD_LOGIC;
    SIGNAL DEC_PC_Flags_Save    : STD_LOGIC;
    SIGNAL DEC_Branch_Taken     : STD_LOGIC;

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

    SIGNAL MEM_Addr             : STD_LOGIC_VECTOR( 9 DOWNTO 0);
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
    SIGNAL WRB_Src_Din          : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL WRB_Dst_Din          : STD_LOGIC_VECTOR(19 DOWNTO 0);
    
    -- To write back stage
    SIGNAL WRB_Src              : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL WRB_Dst              : STD_LOGIC_VECTOR(19 DOWNTO 0);

    SIGNAL WRB_Src_Data         : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL WRB_Rsrc             : STD_LOGIC_VECTOR( 2 DOWNTO 0);
    SIGNAL WRB_Rsrc_WB          : STD_LOGIC;

    SIGNAL WRB_Dst_Data         : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL WRB_Rdst             : STD_LOGIC_VECTOR( 2 DOWNTO 0);
    SIGNAL WRB_Rdst_WB          : STD_LOGIC;

BEGIN

    --===================================================================================
    --
    -- Fetch Stage
    --

    -- Program Memory
    PROG_MEM:
    ENTITY work.RAM
    GENERIC MAP(n => 16, m => 10)
    PORT MAP(
        CLK             => EXT_CLK,
        WR              => '0',
        Address         => PC_Cur(9 DOWNTO 0),
        Din             => (OTHERS => '0'),
        Dout            => Instr
    );

    --===================================================================================
    --
    -- Decode Stage
    --

    DEC_IR_RST  <= HARD_RST OR DEC_Flush;
    DEC_IR_Din  <= Instr WHEN INTR='0' ELSE Instr_INTR;

    DEC_IR:
    ENTITY work.register_edge_falling
    GENERIC MAP(n => 16)
    PORT MAP(EXT_CLK, DEC_IR_RST, DEC_IR_EN, '0', DEC_IR_Din, DEC_IR_Dout);

    -------------------------------------------------------

    DEC_CIRCUIT:
    ENTITY work.decode_circuit
    PORT MAP(
        Instr           => DEC_IR_Dout,
        Flags           => Flags_Dout,

        Rsrc            => DEC_Rsrc,
        Rsrc_WB         => DEC_Rsrc_WB,
        Rsrc_Load       => DEC_Rsrc_Load,
        
        Rdst            => DEC_Rdst,
        Rdst_WB         => DEC_Rdst_WB,
        Rdst_Load       => DEC_Rdst_Load,
        
        Immediate_Load  => DEC_Imm_Load,

        Shift_Load      => DEC_Shift_Load,
        Shift_Val       => DEC_Shift_Val,
        
        ALU_Opr         => DEC_ALU_Opr,
        Flags_EN        => DEC_Flags_EN,
        Flags_Restore   => DEC_Flags_Restore,
        
        Mem_EA          => DEC_Mem_EA,
        Mem_EA_Load     => DEC_Mem_EA_Load,
        Mem_Addr_Switch => DEC_Mem_Addr_Switch,
        Mem_RD          => DEC_Mem_RD,
        Mem_WR          => DEC_Mem_WR,
        
        Port_In_RD      => DEC_Port_In_RD,
        Port_Out_WR     => DEC_Port_Out_WR,

        MOV             => DEC_MOV,
        
        PC_Flags_Save   => DEC_PC_Flags_Save,
        
        Branch_Taken    => DEC_Branch_Taken,
    );

    REG_FILE:
    ENTITY work.register_file
    PORT MAP(
        CLK             => EXT_CLK,
        RST             => HARD_RST,

        PC_WR           => '1',
        PC_Din          => PC_Nxt,

        Reg_A_WR        => WRB_Rdst_WB,
        Reg_A_WR_Addr   => WRB_Rdst,
        Reg_A_Din       => WRB_Dst_Data,

        Reg_B_WR        => WRB_Rsrc_WB,
        Reg_B_WR_Addr   => WRB_Rsrc,
        Reg_B_Din       => WRB_Src_Data,

        PC_Dout         => PC_Cur,

        Reg_A_RD_Addr   => DEC_Rdst,
        Reg_A_Dout      => DEC_Rdst_Dout,

        Reg_B_RD_Addr   => DEC_Rsrc,
        Reg_B_Dout      => DEC_Rsrc_Dout
    );

    HAZARD_UNIT:
    ENTITY work.hazard_unit
    PORT MAP(
        RESET           => RESET,
        INTR            => INTR,

        --
        -- Control signals of decode stage
        --

        Rsrc            => DEC_Rsrc,
        Rsrc_WB         => DEC_Rsrc_WB,
        Rsrc_Load       => DEC_Rsrc_Load,
        Rsrc_Data       => DEC_Rsrc_Dout,

        Rdst            => DEC_Rdst,
        Rdst_WB         => DEC_Rdst_WB,
        Rdst_Load       => DEC_Rdst_Load,
        Rdst_Data       => DEC_Rdst_Dout,
        
        Immediate_Load  => DEC_Imm_Load,
        Immediate_Val   => Instr,

        Shift_Load      => DEC_Shift_Load,
        Shift_Val       => DEC_Shift_Val,

        PC_Flags_Save   => DEC_PC_Flags_Save,
        PC_Fetching     => ,
        PC_Reset        => ,
        PC_INTR         => ,
        Flags           => Flags_Dout,

        Mem_Addr_Switch => DEC_Mem_Addr_Switch,
        Mem_EA_Load     => DEC_Mem_EA_Load,
        Mem_EA          => DEC_Mem_EA,

        Port_In_RD      => DEC_Port_In_RD,
        Port_In_Data    => DEC_Port_Out_WR,

        Branch_Taken    => DEC_Branch_Taken,

        --
        -- Inputs of forward stages
        --

        EXE_Src         => EXE_Src,
        EXE_Dst         => EXE_Dst,
        EXE_Ctrl        => EXE_Ctrl,

        MEM_Src         => MEM_Src,
        MEM_Dst         => MEM_Dst,
        MEM_Ctrl        => MEM_Ctrl,

        WRB_Src         => WRB_Src,
        WRB_Dst         => WRB_Dst,
        WRB_Ctrl        => ,

        --
        -- Outputs
        --

        Src_Dout        => EXE_Src_Din,
        Dst_Dout        => EXE_Dst_Din,

        PC_Next         => ,

        Stall           => Stall,
        Flush           => Flush,
    );

    EXE_Ctrl_Din    <=  DEC_ALU_Opr & DEC_Flags_EN & DEC_Flags_Restore &
                        DEC_Mem_Addr_Switch & DEC_Mem_WR & DEC_Mem_RD &
                        DEC_Port_Out_WR & DEC_MOV;

    --===================================================================================
    --
    -- Execute Stage
    --

    EXE_SRC_REG:
    ENTITY work.register_edge_falling
    GENERIC MAP(n => 20)
    PORT MAP(EXT_CLK, HARD_RST, '1', '0', EXE_Src_Din, EXE_Src);

    EXE_DST_REG:
    ENTITY work.register_edge_falling
    GENERIC MAP(n => 20)
    PORT MAP(EXT_CLK, HARD_RST, '1', '0', EXE_Dst_Din, EXE_Dst);

    EXE_CTRL_REG:
    ENTITY work.register_edge_falling
    GENERIC MAP(n => 20)
    PORT MAP(EXT_CLK, HARD_RST, '1', '0', EXE_Ctrl_Din, EXE_Ctrl);

    -------------------------------------------------------

    EXE_Opr         <= EXE_Ctrl(19 DOWNTO 15);
    EXE_Flags_EN    <= EXE_Ctrl(14);

    EXE_ALU:
    ENTITY work.ALU
    GENERIC MAP(n => 16)
    PORT MAP(
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

    MEM_SRC_REG:
    ENTITY work.register_edge_rising
    GENERIC MAP(n => 20)
    PORT MAP(EXT_CLK, HARD_RST, '1', '0', MEM_Src_Din, MEM_Src);

    MEM_DST_REG:
    ENTITY work.register_edge_rising
    GENERIC MAP(n => 20)
    PORT MAP(EXT_CLK, HARD_RST, '1', '0', MEM_Dst_Din, MEM_Dst);

    MEM_CTRL_REG:
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
    MEM_Flags           <= MEM_Dout(13 DOWNTO 10);

    DATA_MEM:
    ENTITY work.RAM
    GENERIC MAP(n => 16, m => 10)
    PORT MAP(
        CLK         => EXT_CLK,
        WR          => MEM_WR,
        Address     => MEM_Addr,
        Din         => MEM_Din,
        Dout        => MEM_Dout
    );


    WRB_Src_Din(15 DOWNTO 0)     <= MEM_Src(15 DOWNTO 0) WHEN MEM_RD='0' ELSE MEM_Dout;
    WRB_Src_Din(19 DOWNTO 16)    <= MEM_Src(19 DOWNTO 16);

    WRB_Dst_Din                  <= MEM_Dst;

    --===================================================================================
    --
    -- Write Back Stage
    --

    WRB_SRC_REG:
    ENTITY work.register_edge_rising
    GENERIC MAP(n => 20)
    PORT MAP(EXT_CLK, HARD_RST, '1', '0', WRB_Src_Din, WRB_Src);

    WRB_DST_REG:
    ENTITY work.register_edge_rising
    GENERIC MAP(n => 20)
    PORT MAP(EXT_CLK, HARD_RST, '1', '0', WRB_Dst_Din, WRB_Dst);

    -------------------------------------------------------

    WRB_Src_Data  <= WRB_Src(15 DOWNTO 0);
    WRB_Rsrc     <= WRB_Src(18 DOWNTO 16);
    WRB_Rsrc_WB  <= WRB_Src(19);

    WRB_Dst_Data  <= WRB_Dst(15 DOWNTO 0);
    WRB_Rdst     <= WRB_Dst(18 DOWNTO 16);
    WRB_Rdst_WB  <= WRB_Dst(19);

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