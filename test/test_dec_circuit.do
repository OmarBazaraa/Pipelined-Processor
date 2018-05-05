quit -sim

vsim -gui work.decode_circuit

#
# Add waves
#
add wave -position insertpoint  \
sim:/decode_circuit/Instr \
sim:/decode_circuit/Flags \
sim:/decode_circuit/Rsrc \
sim:/decode_circuit/Rsrc_WB \
sim:/decode_circuit/Rsrc_Load \
sim:/decode_circuit/Rdst \
sim:/decode_circuit/Rdst_WB \
sim:/decode_circuit/Rdst_Load \
sim:/decode_circuit/Immediate_Load \
sim:/decode_circuit/Shift_Load \
sim:/decode_circuit/Shift_Val \
sim:/decode_circuit/ALU_Opr \
sim:/decode_circuit/Flags_EN \
sim:/decode_circuit/Flags_Restore \
sim:/decode_circuit/Mem_EA \
sim:/decode_circuit/Mem_EA_Load \
sim:/decode_circuit/Mem_Addr_Switch \
sim:/decode_circuit/Mem_RD \
sim:/decode_circuit/Mem_WR \
sim:/decode_circuit/Port_In_RD \
sim:/decode_circuit/Port_Out_WR \
sim:/decode_circuit/MOV \
sim:/decode_circuit/PC_Flags_Save \
sim:/decode_circuit/Branch_Taken

#
# Start simulation
#

# STD R6, 1111100000
force -freeze sim:/decode_circuit/Instr 1001111100000110 0
force -freeze sim:/decode_circuit/Flags 0000 0
run


# LDD R3, 1111100001
force -freeze sim:/decode_circuit/Instr 1011111100001011 0
run

# NOP
force -freeze sim:/decode_circuit/Instr 0000000000000000 0
run

# MOV R1, R2
force -freeze sim:/decode_circuit/Instr 0011000000010001 0
run

# LDM R6, #
force -freeze sim:/decode_circuit/Instr 0010100000110000 0
run

# IN R6
force -freeze sim:/decode_circuit/Instr 0010010000110000 0
run

# OUT R6
force -freeze sim:/decode_circuit/Instr 0000001000000110 0
run

# SETC
force -freeze sim:/decode_circuit/Instr 0100100000000000 0
run

# ADD R5, R6
force -freeze sim:/decode_circuit/Instr 0101000000110101 0
run

# MUL R5, R6
force -freeze sim:/decode_circuit/Instr 0110000000110101 0
run

# SHL R5, #, R6
force -freeze sim:/decode_circuit/Instr 0111101010110101 0
run

# JMP R1
force -freeze sim:/decode_circuit/Instr 1100100000110001 0
run

# JZ R1
force -freeze sim:/decode_circuit/Instr 1101100000110001 0
force -freeze sim:/decode_circuit/Flags 0001 0
run

# CALL R1
force -freeze sim:/decode_circuit/Instr 1100110010110001 0
run

# POP R1
force -freeze sim:/decode_circuit/Instr 1100011000110001 0
run

# RTI
force -freeze sim:/decode_circuit/Instr 1100011100110111 0
run