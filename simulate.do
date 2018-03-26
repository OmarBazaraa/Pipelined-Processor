quit -sim

vsim -gui work.register_file

#
# Add waves
#
add wave -position insertpoint  \
sim:/register_file/CLK \
sim:/register_file/RST \
sim:/register_file/PC_WR \
sim:/register_file/PC_Din \
sim:/register_file/Reg_A_WR \
sim:/register_file/Reg_A_WR_Addr \
sim:/register_file/Reg_A_Din \
sim:/register_file/Reg_B_WR \
sim:/register_file/Reg_B_WR_Addr \
sim:/register_file/Reg_B_Din \
sim:/register_file/PC_Dout \
sim:/register_file/Reg_A_RD_Addr \
sim:/register_file/Reg_A_Dout \
sim:/register_file/Reg_B_RD_Addr \
sim:/register_file/Reg_B_Dout \
sim:/register_file/Reg_Din \
sim:/register_file/Reg_Dout \
sim:/register_file/Reg_EN \
sim:/register_file/Reg_A_in \
sim:/register_file/Reg_B_in \
sim:/register_file/Reg_A_out \
sim:/register_file/Reg_B_out

#
# Initial values
#
force -freeze sim:/register_file/CLK 0 0, 1 {50 ps} -r 100
force -freeze sim:/register_file/RST 1 0
force -freeze sim:/register_file/PC_WR 0 0
force -freeze sim:/register_file/PC_Din x\"0000\" 0
force -freeze sim:/register_file/Reg_A_WR 0 0
force -freeze sim:/register_file/Reg_A_WR_Addr 000 0
force -freeze sim:/register_file/Reg_A_Din x\"0000\" 0
force -freeze sim:/register_file/Reg_B_WR 0 0
force -freeze sim:/register_file/Reg_B_WR_Addr 000 0
force -freeze sim:/register_file/Reg_B_Din x\"0000\" 0
force -freeze sim:/register_file/Reg_A_RD_Addr 000 0
force -freeze sim:/register_file/Reg_B_RD_Addr 001 0
run

#
# Start simulation
#

force -freeze sim:/register_file/RST 0 0

force -freeze sim:/register_file/PC_WR 1 0
force -freeze sim:/register_file/PC_Din x\"0057\" 0

force -freeze sim:/register_file/Reg_A_WR 1 0
force -freeze sim:/register_file/Reg_A_WR_Addr 000 0
force -freeze sim:/register_file/Reg_A_Din x\"0777\" 0
run

force -freeze sim:/register_file/PC_WR 0 0
force -freeze sim:/register_file/Reg_A_WR 0 0

force -freeze sim:/register_file/Reg_B_WR 1 0
force -freeze sim:/register_file/Reg_B_WR_Addr 001 0
force -freeze sim:/register_file/Reg_B_Din x\"8888\" 0
run