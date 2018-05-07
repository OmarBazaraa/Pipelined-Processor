quit -sim

vsim -gui work.processor

#
# Add waves
#
add wave -position insertpoint  \
sim:/processor/EXT_CLK \
sim:/processor/HARD_RST \
sim:/processor/RESET \
sim:/processor/EXT_INTR \
sim:/processor/PORT_IN \
sim:/processor/PORT_OUT \
sim:/processor/INTR_CLK \
sim:/processor/INTR \
sim:/processor/INTR_ACK \
sim:/processor/INTR_Stall \
sim:/processor/RESET_Stall \
sim:/processor/Stall \
sim:/processor/Flush \
sim:/processor/PC_Cur \
sim:/processor/PC_Next \
sim:/processor/Flags_EN \
sim:/processor/Flags_Din \
sim:/processor/Flags_Dout \
sim:/processor/DEC_PC_To_Store_Dout \
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
sim:/processor/WRB_Port_Out_WR \
sim:/processor/WRB_Mem_RD

#
# Hazard Unit Signals
#
# add wave -position insertpoint  \
# sim:/processor/HAZARD_UNIT/RESET \
# sim:/processor/HAZARD_UNIT/INTR \
# sim:/processor/HAZARD_UNIT/Rsrc \
# sim:/processor/HAZARD_UNIT/Rsrc_WB \
# sim:/processor/HAZARD_UNIT/Rsrc_Load \
# sim:/processor/HAZARD_UNIT/Rsrc_Data \
# sim:/processor/HAZARD_UNIT/Rdst \
# sim:/processor/HAZARD_UNIT/Rdst_WB \
# sim:/processor/HAZARD_UNIT/Rdst_Load \
# sim:/processor/HAZARD_UNIT/Rdst_Data \
# sim:/processor/HAZARD_UNIT/Immediate_Load \
# sim:/processor/HAZARD_UNIT/Immediate_Val \
# sim:/processor/HAZARD_UNIT/Shift_Load \
# sim:/processor/HAZARD_UNIT/Shift_Val \
# sim:/processor/HAZARD_UNIT/PC_Flags_Save \
# sim:/processor/HAZARD_UNIT/PC_Fetching \
# sim:/processor/HAZARD_UNIT/PC_To_Store \
# sim:/processor/HAZARD_UNIT/PC_Reset \
# sim:/processor/HAZARD_UNIT/PC_INTR \
# sim:/processor/HAZARD_UNIT/Flags \
# sim:/processor/HAZARD_UNIT/Mem_Addr_Switch \
# sim:/processor/HAZARD_UNIT/Mem_EA_Load \
# sim:/processor/HAZARD_UNIT/Mem_EA \
# sim:/processor/HAZARD_UNIT/Port_In_RD \
# sim:/processor/HAZARD_UNIT/Port_In_Data \
# sim:/processor/HAZARD_UNIT/Branch_Taken \
# sim:/processor/HAZARD_UNIT/DEC_Ctrl \
# sim:/processor/HAZARD_UNIT/EXE_Src \
# sim:/processor/HAZARD_UNIT/EXE_Dst \
# sim:/processor/HAZARD_UNIT/EXE_Ctrl \
# sim:/processor/HAZARD_UNIT/MEM_Src \
# sim:/processor/HAZARD_UNIT/MEM_Dst \
# sim:/processor/HAZARD_UNIT/MEM_Ctrl \
# sim:/processor/HAZARD_UNIT/WRB_Src \
# sim:/processor/HAZARD_UNIT/WRB_Dst \
# sim:/processor/HAZARD_UNIT/WRB_Ctrl \
# sim:/processor/HAZARD_UNIT/Src_Dout \
# sim:/processor/HAZARD_UNIT/Dst_Dout \
# sim:/processor/HAZARD_UNIT/PC_Next \
# sim:/processor/HAZARD_UNIT/Stall \
# sim:/processor/HAZARD_UNIT/Flush \
# sim:/processor/HAZARD_UNIT/INTR_Stall \
# sim:/processor/HAZARD_UNIT/RESET_Stall \
# sim:/processor/HAZARD_UNIT/PC_Flags \
# sim:/processor/HAZARD_UNIT/PC_Plus_1 \
# sim:/processor/HAZARD_UNIT/Eff_Addr \
# sim:/processor/HAZARD_UNIT/Shift_Data \
# sim:/processor/HAZARD_UNIT/Src_Data \
# sim:/processor/HAZARD_UNIT/Src_Data_FW \
# sim:/processor/HAZARD_UNIT/Dst_Data \
# sim:/processor/HAZARD_UNIT/Dst_Data_FW \
# sim:/processor/HAZARD_UNIT/Load_Depend \
# sim:/processor/HAZARD_UNIT/Load_PC \
# sim:/processor/HAZARD_UNIT/Load_Use_Stall \
# sim:/processor/HAZARD_UNIT/DEC_PC_WB \
# sim:/processor/HAZARD_UNIT/EXE_PC_WB \
# sim:/processor/HAZARD_UNIT/MEM_PC_WB \
# sim:/processor/HAZARD_UNIT/WRB_PC_WB \
# sim:/processor/HAZARD_UNIT/DEC_ALU_Dec \
# sim:/processor/HAZARD_UNIT/EXE_ALU_Dec \
# sim:/processor/HAZARD_UNIT/DEC_Addr_Pre_Zero \
# sim:/processor/HAZARD_UNIT/EXE_Addr_Pre_Zero \
# sim:/processor/HAZARD_UNIT/DEC_Addr_Intr \
# sim:/processor/HAZARD_UNIT/EXE_Addr_Intr \
# sim:/processor/HAZARD_UNIT/DEC_Addr_Reset \
# sim:/processor/HAZARD_UNIT/EXE_Addr_Reset

#
# Decoding Unit Signals
#
# add wave -position insertpoint  \
# sim:/processor/DEC_CIRCUIT/Instr \
# sim:/processor/DEC_CIRCUIT/Flags \
# sim:/processor/DEC_CIRCUIT/Rsrc \
# sim:/processor/DEC_CIRCUIT/Rsrc_WB \
# sim:/processor/DEC_CIRCUIT/Rsrc_Load \
# sim:/processor/DEC_CIRCUIT/Rdst \
# sim:/processor/DEC_CIRCUIT/Rdst_WB \
# sim:/processor/DEC_CIRCUIT/Rdst_Load \
# sim:/processor/DEC_CIRCUIT/Immediate_Load \
# sim:/processor/DEC_CIRCUIT/Shift_Load \
# sim:/processor/DEC_CIRCUIT/Shift_Val \
# sim:/processor/DEC_CIRCUIT/ALU_Opr \
# sim:/processor/DEC_CIRCUIT/Flags_EN \
# sim:/processor/DEC_CIRCUIT/Flags_Restore \
# sim:/processor/DEC_CIRCUIT/Mem_EA \
# sim:/processor/DEC_CIRCUIT/Mem_EA_Load \
# sim:/processor/DEC_CIRCUIT/Mem_Addr_Switch \
# sim:/processor/DEC_CIRCUIT/Mem_RD \
# sim:/processor/DEC_CIRCUIT/Mem_WR \
# sim:/processor/DEC_CIRCUIT/Port_In_RD \
# sim:/processor/DEC_CIRCUIT/Port_Out_WR \
# sim:/processor/DEC_CIRCUIT/PC_Flags_Save \
# sim:/processor/DEC_CIRCUIT/Branch_Taken \
# sim:/processor/DEC_CIRCUIT/Intr_Ack \
# sim:/processor/DEC_CIRCUIT/Instr_Type \
# sim:/processor/DEC_CIRCUIT/MOV_Type \
# sim:/processor/DEC_CIRCUIT/ALU_Type \
# sim:/processor/DEC_CIRCUIT/MEM_Type \
# sim:/processor/DEC_CIRCUIT/JMP_Type \
# sim:/processor/DEC_CIRCUIT/MOV_Write \
# sim:/processor/DEC_CIRCUIT/MOV_Instr \
# sim:/processor/DEC_CIRCUIT/LDM_Instr \
# sim:/processor/DEC_CIRCUIT/ALU_Stack \
# sim:/processor/DEC_CIRCUIT/ALU_Write \
# sim:/processor/DEC_CIRCUIT/ALU_MUL \
# sim:/processor/DEC_CIRCUIT/ALU_SHF \
# sim:/processor/DEC_CIRCUIT/Mem_Load \
# sim:/processor/DEC_CIRCUIT/Mem_Store \
# sim:/processor/DEC_CIRCUIT/Mem_Read \
# sim:/processor/DEC_CIRCUIT/Branch \
# sim:/processor/DEC_CIRCUIT/BranchCond \
# sim:/processor/DEC_CIRCUIT/BranchSwitch \
# sim:/processor/DEC_CIRCUIT/Stack \
# sim:/processor/DEC_CIRCUIT/Stack_Push \
# sim:/processor/DEC_CIRCUIT/Stack_Pop

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

#
# Start simulation
#
force -freeze sim:/processor/HARD_RST 0 0
run
