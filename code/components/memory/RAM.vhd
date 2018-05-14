LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY RAM IS
    GENERIC(n: INTEGER := 16; m: INTEGER := 10);
    PORT(
        CLK             : IN  STD_LOGIC;
        WR              : IN  STD_LOGIC;
        Address         : IN  STD_LOGIC_VECTOR(m-1 DOWNTO 0);
        Din             : IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
        Dout            : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE arch_RAM OF RAM IS

    TYPE memory IS ARRAY(0 TO (2**m)-1) OF STD_LOGIC_VECTOR(n-1 DOWNTO 0);
    
    SIGNAL Mem : memory := (
	   OTHERS => "0000000000000000"
    );
BEGIN

    Dout <= Mem(TO_INTEGER(UNSIGNED(Address)));
    
    PROCESS(CLK)
    BEGIN
        IF RISING_EDGE(CLK) THEN
            IF WR='1' THEN
                Mem(TO_INTEGER(UNSIGNED(Address))) <= Din;
            END IF;
        END IF;
    END PROCESS;
END ARCHITECTURE;