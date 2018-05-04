LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ALU IS
    GENERIC(n: INTEGER := 16);
    PORT(
        Opr     : IN  STD_LOGIC_VECTOR(  3 DOWNTO 0);

        A       : IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);   -- Src Data
        B       : IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);   -- Dst Data

        Cin     : IN  STD_LOGIC;

        Res1    : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);   -- Dst
        Res2    : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);   -- Src

        Flags   : OUT STD_LOGIC_VECTOR(  3 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE arch_ALU OF ALU IS
    
    SIGNAL FlagZ            : STD_LOGIC;
    SIGNAL FlagN            : STD_LOGIC;
    SIGNAL FlagC            : STD_LOGIC;
    SIGNAL FlagV            : STD_LOGIC;

    SIGNAL Mul_Res          : STD_LOGIC_VECTOR(n+n-1 DOWNTO 0);
    SIGNAL Mul_FlagZ        : STD_LOGIC;
    SIGNAL Mul_FlagN        : STD_LOGIC;

    SIGNAL Tmp_Res          : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
    SIGNAL Tmp_FlagZ        : STD_LOGIC;
    SIGNAL Tmp_FlagN        : STD_LOGIC;

    ------------------------------------

    SIGNAL Set_Clr_Res      : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
    SIGNAL Set_Clr_Cout     : STD_LOGIC;

    SIGNAL Add_Opr_1        : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
    SIGNAL Add_Opr_2        : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
    SIGNAL Add_Cin          : STD_LOGIC;
    SIGNAL Add_Subtract     : STD_LOGIC;
    SIGNAL Add_Res          : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
    SIGNAL Add_Cout         : STD_LOGIC;

    SIGNAL Mul_Log_Res      : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
    SIGNAL Mul_Log_Cout     : STD_LOGIC;

    SIGNAL SHL_Res          : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
    SIGNAL SHR_Res          : STD_LOGIC_VECTOR(n-1 DOWNTO 0);

    SIGNAL Shf_Rot_Res      : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
    SIGNAL Shf_Rot_Cout     : STD_LOGIC;

BEGIN

    WITH Opr(3 DOWNTO 2) SELECT
    Tmp_Res         <=  Set_Clr_Res             WHEN "00",
                        Add_Res(n-1 DOWNTO 0)   WHEN "01",
                        Mul_Log_Res             WHEN "10",
                        Shf_Rot_Res             WHEN OTHERS;

    Tmp_FlagZ       <=  '1' WHEN Tmp_Res=(  n-1 DOWNTO 0 => '0') ELSE '0';
    Tmp_FlagN       <=  Tmp_Res(n-1);

    ------------------------------------

    Mul_Res         <=  A * B;
    Mul_FlagZ       <=  '1' WHEN Mul_Res=(n+n-1 DOWNTO 0 => '0') ELSE '0';
    Mul_FlagN       <=  Mul_Res(n+n-1);

    ------------------------------------

    Res1            <=  Tmp_Res;
    Res2            <=  Mul_Res(n+n-1 DOWNTO n) WHEN Opr="1000" ELSE A;

    Flags           <=  FlagV & FlagC & FlagN & FlagZ;

    FlagZ           <=  Mul_FlagZ WHEN Opr="1000" ELSE Tmp_FlagZ;
    FlagN           <=  Mul_FlagN WHEN Opr="1000" ELSE Tmp_FlagN;

    WITH Opr(3 DOWNTO 2) SELECT
    FlagC           <=  Set_Clr_Cout    WHEN "00",
                        Add_Cout        WHEN "01",
                        Mul_Log_Cout    WHEN "10",
                        Shf_Rot_Cout    WHEN OTHERS;

    FlagV           <=  '0';

    --===================================================================================
    --
    -- 0-operand ALU operations
    --

    -- NOP         00 00
    -- CLRC        00 10
    -- SETC        00 11

    Set_Clr_Res     <=  A WHEN Opr(1 DOWNTO 0)="01" ELSE B;
    Set_Clr_Cout    <=  Opr(0);

    --===================================================================================
    --
    -- Add/Sub ALU operations
    --

    -- ADD         01 00
    -- SUB         01 01
    -- INC         01 10
    -- DEC         01 11

    Add_Opr_1       <=  B;
    Add_Opr_2       <=  A WHEN Opr(1)='0' ELSE (n-1 DOWNTO 0 => '0');
    Add_Cin         <=  Opr(1);
    Add_Subtract    <=  Opr(0);

    ADD_SUB:
    ENTITY work.adder_subtractor
    GENERIC MAP(n => n)
    PORT MAP(
        A           => Add_Opr_1,
        B           => Add_Opr_2,
        Cin         => Add_Cin,
        Subtract    => Add_Subtract,
        Sum         => Add_Res,
        Cout        => Add_Cout
    );

    --===================================================================================
    --
    -- Mul/Logic ALU operations
    --

    -- MUL         10 00
    -- AND         10 01
    -- OR          10 10
    -- NOT         10 11

    WITH Opr(1 DOWNTO 0) SELECT
    Mul_Log_Res     <=  Mul_Res(n-1 DOWNTO 0)   WHEN "00",
                        (A AND B)               WHEN "01",
                        (A OR  B)               WHEN "10",
                        (  NOT B)               WHEN OTHERS;
    
    Mul_Log_Cout    <=  '0';

    --===================================================================================
    --
    -- Shift/Rotate ALU operations
    --

    -- RLC         11 00
    -- RRC         11 01
    -- SHL         11 10
    -- SHR         11 11
    
    SHL_Res         <=  STD_LOGIC_VECTOR(UNSIGNED(A) SLL (TO_INTEGER(UNSIGNED(B(3 DOWNTO 0)))+1));
    SHR_Res         <=  STD_LOGIC_VECTOR(UNSIGNED(A) SRL (TO_INTEGER(UNSIGNED(B(3 DOWNTO 0)))+1));

    WITH Opr(1 DOWNTO 0) SELECT
    Shf_Rot_Res     <=  (B(14 DOWNTO 0) & Cin)  WHEN "00",
                        (Cin & B(15 DOWNTO 1))  WHEN "01",
                        SHL_Res                 WHEN "10",
                        SHR_Res                 WHEN OTHERS;

    WITH Opr(1 DOWNTO 0) SELECT
    Shf_Rot_Cout    <=  B(15)   WHEN "00",
                        B( 0)   WHEN "01",
                        '0'     WHEN OTHERS;

END ARCHITECTURE;