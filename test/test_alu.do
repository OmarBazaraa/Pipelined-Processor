quit -sim

vsim -gui work.alu

#
# Add waves
#
add wave -position insertpoint  \
sim:/alu/Opr \
sim:/alu/A \
sim:/alu/B \
sim:/alu/Cin \
sim:/alu/Res1 \
sim:/alu/Res2 \
sim:/alu/Flags

#
# Start simulation
#

force -freeze sim:/alu/Opr 0101 0
force -freeze sim:/alu/A x\"7FFF\" 0
force -freeze sim:/alu/B x\"8F00\" 0
force -freeze sim:/alu/Cin 0 0
run

# # NOP         00 00
# force -freeze sim:/alu/Opr 0000 0
# force -freeze sim:/alu/A x\"55FF\" 0
# force -freeze sim:/alu/B x\"11AA\" 0
# force -freeze sim:/alu/Cin 0 0
# run
# 
# # CLRC        00 10
# force -freeze sim:/alu/Opr 0010 0
# run
# 
# # SETC        00 11
# force -freeze sim:/alu/Opr 0011 0
# run
# 
# # ADD         01 00
# force -freeze sim:/alu/Opr 0100 0
# run
# 
# # SUB         01 01
# force -freeze sim:/alu/Opr 0101 0
# run
# 
# # INC         01 10
# force -freeze sim:/alu/Opr 0110 0
# run
# 
# # DEC         01 11
# force -freeze sim:/alu/Opr 0111 0
# run
# 
# # MUL         10 00
# force -freeze sim:/alu/Opr 1000 0
# run
# 
# # AND         10 01
# force -freeze sim:/alu/Opr 1001 0
# run
# 
# # OR          10 10
# force -freeze sim:/alu/Opr 1010 0
# run
# 
# # NOT         10 11
# force -freeze sim:/alu/Opr 1011 0
# run
# 
# # RLC         11 00
# force -freeze sim:/alu/Opr 1100 0
# run
# 
# # RRC         11 01
# force -freeze sim:/alu/Opr 1101 0
# run
# 
# # SHL         11 10
# force -freeze sim:/alu/Opr 1110 0
# run
# 
# # SHR         11 11
# force -freeze sim:/alu/Opr 1111 0
# run