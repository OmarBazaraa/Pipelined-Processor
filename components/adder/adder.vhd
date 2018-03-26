LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY adder IS
    GENERIC(n : INTEGER := 16);
    PORT(
        A, B    : IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
        Cin     : IN  STD_LOGIC;
        Sum     : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
        Cout    : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE arch_adder OF adder IS

    SIGNAL Carry    : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
BEGIN

    FA0:
    ENTITY work.full_adder
    PORT MAP(A => A(0), B => B(0), Cin => Cin, Sum => Sum(0), Cout => Carry(0));

    L0:
    FOR i IN 1 TO n-1 GENERATE
        FAi:
        ENTITY work.full_adder
        PORT MAP(A => A(i), B => B(i), Cin => Carry(i-1), Sum => Sum(i), Cout => Carry(i));
    END GENERATE;

    Cout <= Carry(n-1);
END ARCHITECTURE;