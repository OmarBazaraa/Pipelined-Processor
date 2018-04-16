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
sim:/processor/Stall \
sim:/processor/Flush\
sim:/processor/DEC_IR_Dout \
sim:/processor/DEC_PC_To_Store_Dout\
sim:/processor/EXE_Src \
sim:/processor/EXE_Dst \
sim:/processor/EXE_Ctrl \
sim:/processor/MEM_Src \
sim:/processor/MEM_Dst \
sim:/processor/MEM_Ctrl \
sim:/processor/WRB_Src \
sim:/processor/WRB_Dst \
sim:/processor/WRB_Ctrl\
sim:/processor/REG_FILE/Reg_Dout

#
# Load Program Memory
#
# mem load -i {test/program.mem} /processor/PROG_MEM/Mem

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

force -freeze sim:/processor/EXT_CLK 0 0
run