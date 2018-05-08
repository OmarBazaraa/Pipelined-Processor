quit -sim

vsim -gui work.processor

#
# Add waves
#
add wave -position insertpoint  \
sim:/processor/EXT_CLK \
sim:/processor/HARD_RST \
sim:/processor/RESET \
sim:/processor/PORT_IN \
sim:/processor/PORT_OUT \
sim:/processor/EXT_INTR \
sim:/processor/INTR \
sim:/processor/PC_Cur \
sim:/processor/Flags_Dout \

#
# Load Memories
#
mem load -i {test/CODE_RAM.mem} /processor/PROG_MEM/Mem
mem load -i {test/DATA_RAM.mem} /processor/DATA_MEM/Mem

#
# Initial values
#
force -freeze sim:/processor/EXT_CLK 0 0, 1 {50 ps} -r 100
force -freeze sim:/processor/HARD_RST 1 0
force -freeze sim:/processor/RESET 0 0
force -freeze sim:/processor/EXT_INTR 0 0
force -freeze sim:/processor/PORT_IN x"0000" 0
run

force -freeze sim:/processor/HARD_RST 0 0
force -freeze sim:/processor/PC_Reset_EN 1 0
force -freeze sim:/processor/PC_Reset_Din 0000000101 0
force -freeze sim:/processor/PC_INTR_EN 1 0
force -freeze sim:/processor/PC_INTR_Din 0001100100 0
run

noforce sim:/processor/PC_Reset_EN
noforce sim:/processor/PC_Reset_Din
noforce sim:/processor/PC_INTR_EN
noforce sim:/processor/PC_INTR_Din

#
# Start simulation
#
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run