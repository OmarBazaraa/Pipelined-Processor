LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.Utilities.ALL;

ENTITY ALU_shifter IS
    GENERIC(n: INTEGER := 32);
    PORT(
        A:      IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
        Cin:    IN  STD_LOGIC;
        Opr:    IN  STD_LOGIC_VECTOR(  2 DOWNTO 0);
        F:      OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
        Cout:   OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE arch_ALU_shifter OF ALU_shifter IS

    SIGNAL OutLeft      : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
    SIGNAL OutRight     : STD_LOGIC_VECTOR(n-1 DOWNTO 0);

    SIGNAL CoutLeft     : STD_LOGIC;
    SIGNAL CoutRight    : STD_LOGIC;
Begin

    --
    --Right Shifter
    --
    CoutRight       <= A(0);

    WITH Opr SELECT
        OutRight    <=
            '0'    & A(n-1 DOWNTO 1)    WHEN ALU_OP_LSR,    --LSR (Logic Shift Right)
            A(0)   & A(n-1 DOWNTO 1)    WHEN ALU_OP_ROR,    --ROR (Rotate Right)
            Cin    & A(n-1 DOWNTO 1)    WHEN ALU_OP_RRC,    --RRC (Rotate Right with Carry)
            A(n-1) & A(n-1 DOWNTO 1)    WHEN OTHERS;        --ASR (Arithmetic Shift Right)
    ----------------------------------------------------------
    --
    --Left Shifter
    --
    CoutLeft        <= A(n-1);

    WITH Opr SELECT
        OutLeft <=
            A(n-2 DOWNTO 0) & '0'       WHEN ALU_OP_LSL,    --LSL (Logic Shift Left)
            A(n-2 DOWNTO 0) & A(n-1)    WHEN ALU_OP_ROL,    --ROL (Rotate Left)
            A(n-2 DOWNTO 0) & Cin       WHEN OTHERS;        --RLC (Rotate Left with Carry)
    ----------------------------------------------------------
    --
    --Multiplexing the results
    --
    F       <=  OutRight    WHEN Opr(2)='0' ELSE OutLeft;
    Cout    <=  CoutRight   WHEN Opr(2)='0' ELSE CoutLeft;
END ARCHITECTURE;