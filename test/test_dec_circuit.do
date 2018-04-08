quit -sim

vsim -gui work.decode_ciruit

#
# Add waves
#
add wave -position insertpoint  \
sim:/decode_ciruit/Instr \
sim:/decode_ciruit/Flags \
sim:/decode_ciruit/Rsrc \
sim:/decode_ciruit/Rsrc_WB \
sim:/decode_ciruit/Rsrc_Load \
sim:/decode_ciruit/Rdst \
sim:/decode_ciruit/Rdst_WB \
sim:/decode_ciruit/Rdst_Load \
sim:/decode_ciruit/Immediate_Load \
sim:/decode_ciruit/Shift_Load \
sim:/decode_ciruit/Shift_Val \
sim:/decode_ciruit/ALU_Opr \
sim:/decode_ciruit/Flags_EN \
sim:/decode_ciruit/Flags_Restore \
sim:/decode_ciruit/Mem_EA \
sim:/decode_ciruit/Mem_EA_Load \
sim:/decode_ciruit/Mem_Addr_Switch \
sim:/decode_ciruit/Mem_RD \
sim:/decode_ciruit/Mem_WR \
sim:/decode_ciruit/Port_In_RD \
sim:/decode_ciruit/Port_Out_WR \
sim:/decode_ciruit/MOV \
sim:/decode_ciruit/PC_Flags_Save \
sim:/decode_ciruit/Branch_Taken

#
# Start simulation
#

# STD R6, 1111100000
force -freeze sim:/decode_ciruit/Instr 1001111100000110 0
force -freeze sim:/decode_ciruit/Flags 0000 0
run


# LDD R3, 1111100001
force -freeze sim:/decode_ciruit/Instr 1011111100001011 0
run

# NOP
force -freeze sim:/decode_ciruit/Instr 0000000000000000 0
run

# MOV R1, R2
force -freeze sim:/decode_ciruit/Instr 0011000000010001 0
run

# LDM R6, #
force -freeze sim:/decode_ciruit/Instr 0010100000110000 0
run

# IN R6
force -freeze sim:/decode_ciruit/Instr 0010010000110000 0
run

# OUT R6
force -freeze sim:/decode_ciruit/Instr 0000001000000110 0
run

# SETC
force -freeze sim:/decode_ciruit/Instr 0100100000000000 0
run

# ADD R5, R6
force -freeze sim:/decode_ciruit/Instr 0101000000110101 0
run

# MUL R5, R6
force -freeze sim:/decode_ciruit/Instr 0110000000110101 0
run

# SHL R5, #, R6
force -freeze sim:/decode_ciruit/Instr 0111101010110101 0
run

# JMP R1
force -freeze sim:/decode_ciruit/Instr 1100100000110001 0
run

# JZ R1
force -freeze sim:/decode_ciruit/Instr 1101100000110001 0
force -freeze sim:/decode_ciruit/Flags 0001 0
run

# CALL R1
force -freeze sim:/decode_ciruit/Instr 1100110010110001 0
run

# POP R1
force -freeze sim:/decode_ciruit/Instr 1100011000110001 0
run

# RTI
force -freeze sim:/decode_ciruit/Instr 1100011100110111 0
run