LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY flip_flop IS
    PORT(
        CLK, RST        : IN  STD_LOGIC;
        Din             : IN  STD_LOGIC;
        Dout            : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE arch_flip_flop OF flip_flop IS
BEGIN

    PROCESS(CLK, RST)
    BEGIN
        IF RST='1' THEN
            Dout <= '0';
        ELSIF RISING_EDGE(CLK) THEN
            Dout <= Din;
        END IF;
    END PROCESS;
END ARCHITECTURE;