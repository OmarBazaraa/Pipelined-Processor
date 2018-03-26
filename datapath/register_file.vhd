LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY register_file IS
    PORT(
        CLK, RST        : IN  STD_LOGIC;

        --
        -- Write ports
        --
        PC_WR           : IN  STD_LOGIC;
        PC_Din          : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);

        Reg_A_WR        : IN  STD_LOGIC;
        Reg_A_WR_Addr   : IN  STD_LOGIC_VECTOR( 2 DOWNTO 0);
        Reg_A_Din       : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);

        Reg_B_WR        : IN  STD_LOGIC;
        Reg_B_WR_Addr   : IN  STD_LOGIC_VECTOR( 2 DOWNTO 0);
        Reg_B_Din       : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
        
        --
        -- Read ports
        --
        PC_Dout         : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);

        Reg_A_RD_Addr   : IN  STD_LOGIC_VECTOR( 2 DOWNTO 0);
        Reg_A_Dout      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);

        Reg_B_RD_Addr   : IN  STD_LOGIC_VECTOR( 2 DOWNTO 0);
        Reg_B_Dout      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE arch_register_file OF register_file IS

    TYPE memory IS ARRAY(0 TO 7) OF STD_LOGIC_VECTOR(15 DOWNTO 0);

    --
    -- Registers
    --
    SIGNAL Reg_Din                  : memory;
    SIGNAL Reg_Dout                 : memory;

    SIGNAL Reg_EN                   : STD_LOGIC_VECTOR(7 DOWNTO 0);

    SIGNAL Reg_A_in                 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Reg_B_in                 : STD_LOGIC_VECTOR(7 DOWNTO 0);

    SIGNAL Reg_A_out                : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Reg_B_out                : STD_LOGIC_VECTOR(7 DOWNTO 0);
Begin

    --===================================================================================
    --
    -- Registers control signals
    --
    Reg_EN      <= Reg_A_in OR Reg_B_in;

    DEC_A_IN:
    ENTITY work.decoder_3x8
    PORT MAP(Reg_A_WR, Reg_A_WR_Addr, Reg_A_in);

    DEC_B_IN:
    ENTITY work.decoder_3x8
    PORT MAP(Reg_B_WR, Reg_B_WR_Addr, Reg_B_in);

    DEC_A_OUT:
    ENTITY work.decoder_3x8
    PORT MAP('1', Reg_A_WR_Addr, Reg_A_out);

    DEC_B_OUT:
    ENTITY work.decoder_3x8
    PORT MAP('1', Reg_B_WR_Addr, Reg_B_out);

    --===================================================================================
    --
    -- Registers
    --

    -- Registers R0 to R5
    L1:
    FOR i IN 0 TO 5 GENERATE
        Reg_Din(i)  <= Reg_A_Din WHEN Reg_A_in(i)='1' ELSE Reg_B_Din;
        Ri:
        ENTITY work.register_edge_rising
        GENERIC MAP(n => 16)
        PORT MAP(CLK, RST, Reg_EN(i), '0', Reg_Din(i), Reg_Dout(i));
    END GENERATE;

    -- Register SP
    Reg_Din(6)  <= Reg_A_Din WHEN Reg_A_in(6)='1' ELSE Reg_B_Din;
    SP:
    ENTITY work.register_edge_rising
    GENERIC MAP(n => 16)
    PORT MAP(CLK, RST, Reg_EN(6), '1', Reg_Din(6), Reg_Dout(6));

    -- Register PC
    Reg_Din(7)  <= PC_Din;
    PC:
    ENTITY work.register_edge_falling
    GENERIC MAP(n => 16)
    PORT MAP(CLK, RST, PC_WR, '0', Reg_Din(7), Reg_Dout(7));
    PC_Dout     <= Reg_Dout(7);

    --===================================================================================
    --
    -- Registers output
    --
    L2:
    FOR i IN 0 TO 7 GENERATE
        TRI_A:
        ENTITY work.tri_state_buffer
        GENERIC MAP(n => 16)
        PORT MAP(Reg_Dout(i), Reg_A_out(i), Reg_A_Dout);

        TRI_B:
        ENTITY work.tri_state_buffer
        GENERIC MAP(n => 16)
        PORT MAP(Reg_Dout(i), Reg_B_out(i), Reg_B_Dout);
    END GENERATE;
    --===================================================================================
    
END ARCHITECTURE;