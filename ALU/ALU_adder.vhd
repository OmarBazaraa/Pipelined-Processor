LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.Utilities.ALL;

ENTITY ALU_adder IS
    GENERIC(n: INTEGER := 16);
    PORT(
        A, B    : IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
        Cin     : IN  STD_LOGIC;
        Opr     : IN  STD_LOGIC_VECTOR(  2 DOWNTO 0);
        F       : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
        Cout    : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE arch_ALU_adder OF ALU_adder IS

    SIGNAL InputB_Add   : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
    SIGNAL InputB       : STD_LOGIC_VECTOR(n-1 DOWNTO 0);

    SIGNAL InputCin_Add : STD_LOGIC;
    SIGNAL InputCin     : STD_LOGIC;

Begin

    --Adder
    A1:     ENTITY work.adder
            GENERIC MAP(n => n)
            PORT MAP(
                A       => A,
                B       => InputB,
                Cin     => InputCin,
                Sum     => F,
                Cout    => Cout
            );


    InputB_Add      <=  B               WHEN Opr(1)='0' ELSE (n-1 DOWNTO 1 => '0') & '1';
    InputCin_Add    <=  '0'             WHEN Opr(0)='0' ELSE
                        Cin             WHEN Opr(1)='0' ELSE
                        '1';
    
    --Just invert Input B and Cin in case of subtraction mode
    InputB          <=  InputB_Add      WHEN Opr(2)='0' ELSE NOT InputB_Add;
    InputCin        <=  InputCin_Add    WHEN Opr(2)='0' ELSE NOT InputCin_Add;
END ARCHITECTURE;



--ADD                       000
--B         '0'

--ADC                       001
--B         Cin

--F=A+1                     010
--ONE       '0'

--F=A+2                     011
--ONE       '1'

----------------------------------------

--SUB                       100
--NOT B     '1'

--SBC                       101
--NOT B     NOT Cin

--F=A-1                     110
--NOT ONE   '1'

--F=A-2                     111
--NOT ONE   '0'