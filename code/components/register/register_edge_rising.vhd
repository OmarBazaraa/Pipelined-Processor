LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY register_edge_rising IS
    GENERIC(n: INTEGER := 16);
    PORT(
        CLK, RST, EN    : IN  STD_LOGIC;
        Din             : IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
        Dout            : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE arch_register_edge_rising OF register_edge_rising IS
BEGIN

    PROCESS(CLK, RST)
    BEGIN
        IF RISING_EDGE(CLK) THEN
            IF RST='1' THEN
                Dout <= (OTHERS => '0');
            ELSIF EN='1' THEN
                Dout <= Din;
            END IF;
        END IF;
    END PROCESS;
END ARCHITECTURE;