LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.Utilities.ALL;

ENTITY ALU_logicer IS
    GENERIC(n: INTEGER := 32);
    PORT(
        A, B:   IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
        Opr:    IN  STD_LOGIC_VECTOR(  2 DOWNTO 0);
        F:      OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
        Cout:   OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE arch_ALU_logicer OF ALU_logicer IS
Begin

    Cout    <= '0';

    WITH Opr SELECT
        F   <=
            A                   WHEN ALU_OP_OUT_A,  --F=A
            B                   WHEN ALU_OP_OUT_B,  --F=B
            A AND B             WHEN ALU_OP_AND,    --AND
            A OR  B             WHEN ALU_OP_OR,     --OR
            A XOR B             WHEN ALU_OP_XOR,    --XOR
            A AND (NOT B)       WHEN ALU_OP_BIC,    --BIC (Bit clear)
            (OTHERS => '0')     WHEN ALU_OP_CLR,    --CLR
            NOT A               WHEN OTHERS;        --INV (Inverter)
END ARCHITECTURE;