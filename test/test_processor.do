quit -sim

vsim -gui work.processor

#
# Add waves
#
add wave -position insertpoint  \
sim:/processor/EXT_CLK \
sim:/processor/HARD_RST \
sim:/processor/RESET \
sim:/processor/INTR \
sim:/processor/PORT_IN \
sim:/processor/PORT_OUT \
sim:/processor/Flags_EN \
sim:/processor/Flags_Din \
sim:/processor/Flags_Dout \
sim:/processor/Stall \
sim:/processor/Flush \
sim:/processor/PC_Cur \
sim:/processor/PC_Next \
sim:/processor/PC_Reset_EN \
sim:/processor/PC_Reset_Dout \
sim:/processor/PC_INTR_EN \
sim:/processor/PC_INTR_Dout \
sim:/processor/DEC_IR_Dout \
sim:/processor/DEC_Rsrc \
sim:/processor/DEC_Rsrc_WB \
sim:/processor/DEC_Rsrc_Load \
sim:/processor/DEC_Rsrc_Dout \
sim:/processor/DEC_Rdst \
sim:/processor/DEC_Rdst_WB \
sim:/processor/DEC_Rdst_Load \
sim:/processor/DEC_Rdst_Dout \
sim:/processor/DEC_Imm_Load \
sim:/processor/DEC_Shift_Load \
sim:/processor/DEC_Shift_Val \
sim:/processor/DEC_ALU_Opr \
sim:/processor/DEC_Flags_EN \
sim:/processor/DEC_Flags_Restore \
sim:/processor/DEC_Mem_EA \
sim:/processor/DEC_Mem_EA_Load \
sim:/processor/DEC_Mem_Addr_Switch \
sim:/processor/DEC_Mem_RD \
sim:/processor/DEC_Mem_WR \
sim:/processor/DEC_Port_In_RD \
sim:/processor/DEC_Port_Out_WR \
sim:/processor/DEC_MOV \
sim:/processor/DEC_PC_Flags_Save \
sim:/processor/DEC_Branch_Taken \
sim:/processor/EXE_Src \
sim:/processor/EXE_Dst \
sim:/processor/EXE_Ctrl \
sim:/processor/EXE_Opr \
sim:/processor/EXE_Res1 \
sim:/processor/EXE_Res2 \
sim:/processor/EXE_Flags \
sim:/processor/EXE_Flags_EN \
sim:/processor/MEM_Src \
sim:/processor/MEM_Dst \
sim:/processor/MEM_Ctrl \
sim:/processor/MEM_Addr \
sim:/processor/MEM_Addr_Switch \
sim:/processor/MEM_WR \
sim:/processor/MEM_RD \
sim:/processor/MEM_Flags_Restore \
sim:/processor/MEM_Din \
sim:/processor/MEM_Dout \
sim:/processor/WRB_Src_Data \
sim:/processor/WRB_Rsrc \
sim:/processor/WRB_Rsrc_WB \
sim:/processor/WRB_Dst_Data \
sim:/processor/WRB_Rdst \
sim:/processor/WRB_Rdst_WB \
sim:/processor/WRB_MOV \
sim:/processor/WRB_Port_Out_WR \
sim:/processor/WRB_Mem_RD

#
# Load Instructions
#

#   0.      INC R0
#   1.      INC R0
#   2.      LDM R1, 0008
#   3.      0008
#   4.      CALL R1
#   5.      JMP R0
#   6.
#   7.
#   8.      ADD R1, R0
#   9.      RET
#   A.      MOV R1, R3
#   
# +---------------------------------------------------------------------------------------------------------+
# | T   | PC    | Instr         | Pipeline                                                                  |
# +-----+-------+---------------+---------------------------------------------------------------------------+
# | 1   | 0     | INC R0        | F | D | E | M | W |                                                       |
# | 2   | 1     | INC R0        |   | F | D | E | M | W |                                                   |
# | 3   | 2     | LDM R1, 0008  |       | F | D | E | M | W |                                               |
# | 4   | 3     | #0008         |           | F | D | E | M | W |                                           |
# | 5   | 4     | CALL R1       |               | F | D | E | M | W |                                       |
# | 6   | 5     | JMP R0        |                   | F | . | . | . | . |                                   |
# | 7   | 8     | ADD R1, R0    |                       | F | D | E | M | W |                               |
# | 8   | 9     | RET           |                           | F | D | E | M | W |                           |
# | 9   | A     | MOV R1, R3    |                               | F | . | . | . | . |                       |
# | 10  | B     | NOP           |                                   | F | . | . | . | . |                   |
# | 11  | C     | NOP           |                                       | F | . | . | . | . |               |
# | 12  | 5     | JMP R0        |                                           | F | . | E | M | W |           |
# | 13  | 6     | NOP           |                                               | F | . | . | . | . |       |
# | 14  | A     | MOV R1, R3    |                                                   | F | D | E | M | W     |
# | 15  | B     | NOP           |                                                                           |
# | 16  | C     | NOP           |                                                                           |
# | 17  | D     | NOP           |                                                                           |
# | 18  | E     | NOP           |                                                                           |
# | 19  | F     | NOP           |                                                                           |
# +-----+-------+---------------+---------------------------------------------------------------------------+

# INC R0
mem load -filltype value -filldata {0101100000000000 } -fillradix binary /processor/PROG_MEM/Mem(0)

# INC R0
mem load -filltype value -filldata {0101100000000000 } -fillradix binary /processor/PROG_MEM/Mem(1)

# LDM R1, 0008
mem load -filltype value -filldata {0010100000001000 } -fillradix binary /processor/PROG_MEM/Mem(2)
mem load -filltype value -filldata {0000000000001000 } -fillradix binary /processor/PROG_MEM/Mem(3)

# CALL R1
mem load -filltype value -filldata {1100110010110001 } -fillradix binary /processor/PROG_MEM/Mem(4)

# JMP R0
mem load -filltype value -filldata {1100100000000000 } -fillradix binary /processor/PROG_MEM/Mem(5)

# ADD R1, R0
mem load -filltype value -filldata {0101000000000001 } -fillradix binary /processor/PROG_MEM/Mem(8)

# RET
mem load -filltype value -filldata {1100011000110111 } -fillradix binary /processor/PROG_MEM/Mem(9)

# MOV R1, R3
mem load -filltype value -filldata {0011000000011001 } -fillradix binary /processor/PROG_MEM/Mem(10)

#
# Initial values
#
force -freeze sim:/processor/EXT_CLK 0 0, 1 {50 ps} -r 100
force -freeze sim:/processor/HARD_RST 1 0
force -freeze sim:/processor/RESET 0 0
force -freeze sim:/processor/INTR 0 0
force -freeze sim:/processor/PORT_IN x"0000" 0
run

#
# Start simulation
#

force -freeze sim:/processor/HARD_RST 0 0
run