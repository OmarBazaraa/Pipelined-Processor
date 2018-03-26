LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.Utilities.ALL;

ENTITY ALU IS
    GENERIC(n: INTEGER := 16);
    PORT(
        A, B:   IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
        Cin:    IN  STD_LOGIC;
        Opr:    IN  STD_LOGIC_VECTOR(ALU_ADDR_WIDTH-1 DOWNTO 0);
        F:      OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
        Cout:   OUT STD_LOGIC;
        Zero:   Out STD_LOGIC
    );
END ENTITY;

ARCHITECTURE arch_ALU OF ALU IS

    SIGNAL OprType          : STD_LOGIC_VECTOR(  1 DOWNTO 0);
    
    SIGNAL Result           : STD_LOGIC_VECTOR(n-1 DOWNTO 0);

    SIGNAL AdderOut         : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
    SIGNAL LogicerOut       : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
    SIGNAL ShifterOut       : STD_LOGIC_VECTOR(n-1 DOWNTO 0);

    SIGNAL AdderCout        : STD_LOGIC;
    SIGNAL LogicerCout      : STD_LOGIC;
    SIGNAL ShifterCout      : STD_LOGIC;
Begin

    --ALU Adder
    L1:     ENTITY work.ALU_adder
            GENERIC MAP(n => n)
            PORT MAP(
                A       => A,
                B       => B,
                Cin     => Cin,
                Opr     => Opr(2 DOWNTO 0),
                F       => AdderOut,
                Cout    => AdderCout
            );

    --ALU Logicer
    L2:     ENTITY work.ALU_logicer
            GENERIC MAP(n => n)
            PORT MAP(
                A       => A,
                B       => B,
                Opr     => Opr(2 DOWNTO 0),
                F       => LogicerOut,
                Cout    => LogicerCout
            );

    --ALU Shifter
    L3:     ENTITY work.ALU_shifter
            GENERIC MAP(n => n)
            PORT MAP(
                A       => A,
                Cin     => Cin,
                Opr     => Opr(2 DOWNTO 0),
                F       => ShifterOut,
                Cout    => ShifterCout
            );

    --Determine ALU operation type based on the last 2 bits
    OprType <= Opr(4 DOWNTO 3);

    --Multiplexing Result
    WITH OprType SELECT
        Result  <=
            AdderOut        WHEN ALU_BASE_ADDER,
            LogicerOut      WHEN ALU_BASE_LOGICER,
            ShifterOut      WHEN OTHERS;

    --Multiplexing Cout
    WITH OprType SELECT
        Cout    <=
            AdderCout       WHEN ALU_BASE_ADDER,
            LogicerCout     WHEN ALU_BASE_LOGICER,
            ShifterCout     WHEN OTHERS;

    --Raise zero flag when the result is equal to zero
    Zero    <= '1' WHEN Result=(n-1 DOWNTO 0 => '0') ELSE '0';
    --Return result
    F       <= Result;
END ARCHITECTURE;

--ADD     00 000
--ADC     00 001
--F=A+1   00 010
--F=A+2   00 011

--SUB     00 100
--SBC     00 101
--F=A-1   00 110
--F=A-2   00 111

--F=A     01 000
--F=B     01 001
--AND     01 010
--OR      01 011
--XOR     01 100
--BIC     01 101
--CLR     01 110
--NOT     01 111

--LSR     10 000
--ROR     10 001
--RRC     10 010
--ASR     10 011
--LSL     10 100
--ROL     10 101
--RLC     10 110