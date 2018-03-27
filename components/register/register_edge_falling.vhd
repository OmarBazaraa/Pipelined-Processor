LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY register_edge_falling IS
    GENERIC(n: INTEGER := 16);
    PORT(
        CLK, RST, EN    : IN  STD_LOGIC;
        RST_VAL         : IN  STD_LOGIC;
        Din             : IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
        Dout            : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE arch_register_edge_falling OF register_edge_falling IS
BEGIN

    PROCESS(CLK, RST)
    BEGIN
        IF RST='1' THEN
            Dout <= (OTHERS => RST_VAL);
        ELSIF EN='1' AND FALLING_EDGE(CLK) THEN
            Dout <= Din;
        END IF;
    END PROCESS;
END ARCHITECTURE;