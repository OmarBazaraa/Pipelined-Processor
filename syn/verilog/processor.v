//
// Verilog description for cell processor, 
// Sat May  5 04:16:20 2018
//
// LeonardoSpectrum Level 3, 2017a.2 
//


module processor ( EXT_CLK, HARD_RST, RESET, EXT_INTR, PORT_IN, PORT_OUT ) ;

    input EXT_CLK ;
    input HARD_RST ;
    input RESET ;
    input EXT_INTR ;
    input [15:0]PORT_IN ;
    output [15:0]PORT_OUT ;

    wire INTR, INTR_EN, INTR_RST, INTR_CLK, INTR_ACK, INTR_Stall, Stall, Flush, 
         Flags_EN, Flags_Din_3, Flags_Din_2, Flags_Din_1, Flags_Din_0, 
         Flags_Dout_3, Flags_Dout_2, Flags_Dout_1, Flags_Dout_0, PC_Cur_9, 
         PC_Cur_8, PC_Cur_7, PC_Cur_6, PC_Cur_5, PC_Cur_4, PC_Cur_3, PC_Cur_2, 
         PC_Cur_1, PC_Cur_0, PC_Next_9, PC_Next_8, PC_Next_7, PC_Next_6, 
         PC_Next_5, PC_Next_4, PC_Next_3, PC_Next_2, PC_Next_1, PC_Next_0, 
         PC_Reset_Dout_9, PC_Reset_Dout_8, PC_Reset_Dout_7, PC_Reset_Dout_6, 
         PC_Reset_Dout_5, PC_Reset_Dout_4, PC_Reset_Dout_3, PC_Reset_Dout_2, 
         PC_Reset_Dout_1, PC_Reset_Dout_0, PC_INTR_Dout_9, PC_INTR_Dout_8, 
         PC_INTR_Dout_7, PC_INTR_Dout_6, PC_INTR_Dout_5, PC_INTR_Dout_4, 
         PC_INTR_Dout_3, PC_INTR_Dout_2, PC_INTR_Dout_1, PC_INTR_Dout_0, 
         Instr_15, Instr_14, Instr_13, Instr_12, Instr_11, Instr_10, Instr_9, 
         Instr_8, Instr_7, Instr_6, Instr_5, Instr_4, Instr_3, Instr_2, Instr_1, 
         Instr_0, DEC_IR_RST, DEC_IR_Din_15, DEC_IR_Din_14, DEC_IR_Din_13, 
         DEC_IR_Din_12, DEC_IR_Din_11, DEC_IR_Din_10, DEC_IR_Din_9, DEC_IR_Din_8, 
         DEC_IR_Din_7, DEC_IR_Din_6, DEC_IR_Din_5, DEC_IR_Din_4, DEC_IR_Din_3, 
         DEC_IR_Din_2, DEC_IR_Din_1, DEC_IR_Din_0, DEC_IR_Dout_15, 
         DEC_IR_Dout_14, DEC_IR_Dout_13, DEC_IR_Dout_12, DEC_IR_Dout_11, 
         DEC_IR_Dout_10, DEC_IR_Dout_9, DEC_IR_Dout_8, DEC_IR_Dout_7, 
         DEC_IR_Dout_6, DEC_IR_Dout_5, DEC_IR_Dout_4, DEC_IR_Dout_3, 
         DEC_IR_Dout_2, DEC_IR_Dout_1, DEC_IR_Dout_0, DEC_PC_To_Store_EN, 
         DEC_PC_To_Store_Dout_9, DEC_PC_To_Store_Dout_8, DEC_PC_To_Store_Dout_7, 
         DEC_PC_To_Store_Dout_6, DEC_PC_To_Store_Dout_5, DEC_PC_To_Store_Dout_4, 
         DEC_PC_To_Store_Dout_3, DEC_PC_To_Store_Dout_2, DEC_PC_To_Store_Dout_1, 
         DEC_PC_To_Store_Dout_0, DEC_Rsrc_WB, DEC_Rsrc_Load, DEC_Rsrc_Dout_15, 
         DEC_Rsrc_Dout_14, DEC_Rsrc_Dout_13, DEC_Rsrc_Dout_12, DEC_Rsrc_Dout_11, 
         DEC_Rsrc_Dout_10, DEC_Rsrc_Dout_9, DEC_Rsrc_Dout_8, DEC_Rsrc_Dout_7, 
         DEC_Rsrc_Dout_6, DEC_Rsrc_Dout_5, DEC_Rsrc_Dout_4, DEC_Rsrc_Dout_3, 
         DEC_Rsrc_Dout_2, DEC_Rsrc_Dout_1, DEC_Rsrc_Dout_0, DEC_Rdst_WB, 
         DEC_Rdst_Load, DEC_Rdst_Dout_15, DEC_Rdst_Dout_14, DEC_Rdst_Dout_13, 
         DEC_Rdst_Dout_12, DEC_Rdst_Dout_11, DEC_Rdst_Dout_10, DEC_Rdst_Dout_9, 
         DEC_Rdst_Dout_8, DEC_Rdst_Dout_7, DEC_Rdst_Dout_6, DEC_Rdst_Dout_5, 
         DEC_Rdst_Dout_4, DEC_Rdst_Dout_3, DEC_Rdst_Dout_2, DEC_Rdst_Dout_1, 
         DEC_Rdst_Dout_0, DEC_Imm_Load, DEC_Shift_Load, DEC_ALU_Opr_3, 
         DEC_ALU_Opr_2, DEC_ALU_Opr_1, DEC_ALU_Opr_0, DEC_Flags_EN, 
         DEC_Flags_Restore, DEC_Mem_EA_Load, DEC_Mem_Addr_Switch, DEC_Mem_RD, 
         DEC_Mem_WR, DEC_Port_In_RD, DEC_Port_Out_WR, DEC_PC_Flags_Save, 
         DEC_Branch_Taken, EXE_RST, EXE_Src_Din_15, EXE_Src_Din_14, 
         EXE_Src_Din_13, EXE_Src_Din_12, EXE_Src_Din_11, EXE_Src_Din_10, 
         EXE_Src_Din_9, EXE_Src_Din_8, EXE_Src_Din_7, EXE_Src_Din_6, 
         EXE_Src_Din_5, EXE_Src_Din_4, EXE_Src_Din_3, EXE_Src_Din_2, 
         EXE_Src_Din_1, EXE_Src_Din_0, EXE_Dst_Din_15, EXE_Dst_Din_14, 
         EXE_Dst_Din_13, EXE_Dst_Din_12, EXE_Dst_Din_11, EXE_Dst_Din_10, 
         EXE_Dst_Din_9, EXE_Dst_Din_8, EXE_Dst_Din_7, EXE_Dst_Din_6, 
         EXE_Dst_Din_5, EXE_Dst_Din_4, EXE_Dst_Din_3, EXE_Dst_Din_2, 
         EXE_Dst_Din_1, EXE_Dst_Din_0, EXE_Src_19, EXE_Src_18, EXE_Src_17, 
         EXE_Src_16, EXE_Src_15, EXE_Src_14, EXE_Src_13, EXE_Src_12, EXE_Src_11, 
         EXE_Src_10, EXE_Src_9, EXE_Src_8, EXE_Src_7, EXE_Src_6, EXE_Src_5, 
         EXE_Src_4, EXE_Src_3, EXE_Src_2, EXE_Src_1, EXE_Src_0, EXE_Dst_19, 
         EXE_Dst_18, EXE_Dst_17, EXE_Dst_16, EXE_Dst_15, EXE_Dst_14, EXE_Dst_13, 
         EXE_Dst_12, EXE_Dst_11, EXE_Dst_10, EXE_Dst_9, EXE_Dst_8, EXE_Dst_7, 
         EXE_Dst_6, EXE_Dst_5, EXE_Dst_4, EXE_Dst_3, EXE_Dst_2, EXE_Dst_1, 
         EXE_Dst_0, EXE_Ctrl_9, EXE_Ctrl_8, EXE_Ctrl_7, EXE_Ctrl_6, EXE_Ctrl_5, 
         EXE_Ctrl_4, EXE_Ctrl_3, EXE_Ctrl_2, EXE_Ctrl_1, EXE_Ctrl_0, EXE_Res1_15, 
         EXE_Res1_14, EXE_Res1_13, EXE_Res1_12, EXE_Res1_11, EXE_Res1_10, 
         EXE_Res1_9, EXE_Res1_8, EXE_Res1_7, EXE_Res1_6, EXE_Res1_5, EXE_Res1_4, 
         EXE_Res1_3, EXE_Res1_2, EXE_Res1_1, EXE_Res1_0, EXE_Res2_15, 
         EXE_Res2_14, EXE_Res2_13, EXE_Res2_12, EXE_Res2_11, EXE_Res2_10, 
         EXE_Res2_9, EXE_Res2_8, EXE_Res2_7, EXE_Res2_6, EXE_Res2_5, EXE_Res2_4, 
         EXE_Res2_3, EXE_Res2_2, EXE_Res2_1, EXE_Res2_0, EXE_Flags_3, 
         EXE_Flags_2, EXE_Flags_1, EXE_Flags_0, MEM_Src_19, MEM_Src_18, 
         MEM_Src_17, MEM_Src_16, MEM_Src_15, MEM_Src_14, MEM_Src_13, MEM_Src_12, 
         MEM_Src_11, MEM_Src_10, MEM_Src_9, MEM_Src_8, MEM_Src_7, MEM_Src_6, 
         MEM_Src_5, MEM_Src_4, MEM_Src_3, MEM_Src_2, MEM_Src_1, MEM_Src_0, 
         MEM_Dst_19, MEM_Dst_18, MEM_Dst_17, MEM_Dst_16, MEM_Dst_15, MEM_Dst_14, 
         MEM_Dst_13, MEM_Dst_12, MEM_Dst_11, MEM_Dst_10, MEM_Dst_9, MEM_Dst_8, 
         MEM_Dst_7, MEM_Dst_6, MEM_Dst_5, MEM_Dst_4, MEM_Dst_3, MEM_Dst_2, 
         MEM_Dst_1, MEM_Dst_0, MEM_Ctrl_4, MEM_Ctrl_3, MEM_Ctrl_2, MEM_Ctrl_1, 
         MEM_Ctrl_0, MEM_Addr_9, MEM_Addr_8, MEM_Addr_7, MEM_Addr_6, MEM_Addr_5, 
         MEM_Addr_4, MEM_Addr_3, MEM_Addr_2, MEM_Addr_1, MEM_Addr_0, MEM_Din_15, 
         MEM_Din_14, MEM_Din_13, MEM_Din_12, MEM_Din_11, MEM_Din_10, MEM_Din_9, 
         MEM_Din_8, MEM_Din_7, MEM_Din_6, MEM_Din_5, MEM_Din_4, MEM_Din_3, 
         MEM_Din_2, MEM_Din_1, MEM_Din_0, MEM_Dout_15, MEM_Dout_14, MEM_Dout_13, 
         MEM_Dout_12, MEM_Dout_11, MEM_Dout_10, MEM_Dout_9, MEM_Dout_8, 
         MEM_Dout_7, MEM_Dout_6, MEM_Dout_5, MEM_Dout_4, MEM_Dout_3, MEM_Dout_2, 
         MEM_Dout_1, MEM_Dout_0, WRB_Src_Din_15, WRB_Src_Din_14, WRB_Src_Din_13, 
         WRB_Src_Din_12, WRB_Src_Din_11, WRB_Src_Din_10, WRB_Src_Din_9, 
         WRB_Src_Din_8, WRB_Src_Din_7, WRB_Src_Din_6, WRB_Src_Din_5, 
         WRB_Src_Din_4, WRB_Src_Din_3, WRB_Src_Din_2, WRB_Src_Din_1, 
         WRB_Src_Din_0, WRB_Src_19, WRB_Src_18, WRB_Src_17, WRB_Src_16, 
         WRB_Src_15, WRB_Src_14, WRB_Src_13, WRB_Src_12, WRB_Src_11, WRB_Src_10, 
         WRB_Src_9, WRB_Src_8, WRB_Src_7, WRB_Src_6, WRB_Src_5, WRB_Src_4, 
         WRB_Src_3, WRB_Src_2, WRB_Src_1, WRB_Src_0, WRB_Dst_19, WRB_Dst_18, 
         WRB_Dst_17, WRB_Dst_16, WRB_Dst_15, WRB_Dst_14, WRB_Dst_13, WRB_Dst_12, 
         WRB_Dst_11, WRB_Dst_10, WRB_Dst_9, WRB_Dst_8, WRB_Dst_7, WRB_Dst_6, 
         WRB_Dst_5, WRB_Dst_4, WRB_Dst_3, WRB_Dst_2, WRB_Dst_1, WRB_Dst_0, 
         WRB_Ctrl_1, WRB_Ctrl_0, PC_Reset_EN, PC_INTR_EN, DEC_CIRCUIT_nx26, 
         DEC_CIRCUIT_nx86, DEC_CIRCUIT_nx166, DEC_CIRCUIT_nx176, 
         DEC_CIRCUIT_nx182, DEC_CIRCUIT_nx186, DEC_CIRCUIT_nx188, 
         DEC_CIRCUIT_nx192, DEC_CIRCUIT_nx196, DEC_CIRCUIT_nx202, 
         DEC_CIRCUIT_nx204, DEC_CIRCUIT_nx206, DEC_CIRCUIT_nx212, 
         DEC_CIRCUIT_nx215, DEC_CIRCUIT_nx218, DEC_CIRCUIT_nx227, 
         REG_FILE_PC_Dout_15, REG_FILE_PC_Dout_14, REG_FILE_PC_Dout_13, 
         REG_FILE_PC_Dout_12, REG_FILE_PC_Dout_11, REG_FILE_PC_Dout_10, 
         REG_FILE_Reg_Din_0__15, REG_FILE_Reg_Din_0__14, REG_FILE_Reg_Din_0__13, 
         REG_FILE_Reg_Din_0__12, REG_FILE_Reg_Din_0__11, REG_FILE_Reg_Din_0__10, 
         REG_FILE_Reg_Din_0__9, REG_FILE_Reg_Din_0__8, REG_FILE_Reg_Din_0__7, 
         REG_FILE_Reg_Din_0__6, REG_FILE_Reg_Din_0__5, REG_FILE_Reg_Din_0__4, 
         REG_FILE_Reg_Din_0__3, REG_FILE_Reg_Din_0__2, REG_FILE_Reg_Din_0__1, 
         REG_FILE_Reg_Din_0__0, REG_FILE_Reg_Din_1__15, REG_FILE_Reg_Din_1__14, 
         REG_FILE_Reg_Din_1__13, REG_FILE_Reg_Din_1__12, REG_FILE_Reg_Din_1__11, 
         REG_FILE_Reg_Din_1__10, REG_FILE_Reg_Din_1__9, REG_FILE_Reg_Din_1__8, 
         REG_FILE_Reg_Din_1__7, REG_FILE_Reg_Din_1__6, REG_FILE_Reg_Din_1__5, 
         REG_FILE_Reg_Din_1__4, REG_FILE_Reg_Din_1__3, REG_FILE_Reg_Din_1__2, 
         REG_FILE_Reg_Din_1__1, REG_FILE_Reg_Din_1__0, REG_FILE_Reg_Din_2__15, 
         REG_FILE_Reg_Din_2__14, REG_FILE_Reg_Din_2__13, REG_FILE_Reg_Din_2__12, 
         REG_FILE_Reg_Din_2__11, REG_FILE_Reg_Din_2__10, REG_FILE_Reg_Din_2__9, 
         REG_FILE_Reg_Din_2__8, REG_FILE_Reg_Din_2__7, REG_FILE_Reg_Din_2__6, 
         REG_FILE_Reg_Din_2__5, REG_FILE_Reg_Din_2__4, REG_FILE_Reg_Din_2__3, 
         REG_FILE_Reg_Din_2__2, REG_FILE_Reg_Din_2__1, REG_FILE_Reg_Din_2__0, 
         REG_FILE_Reg_Din_3__15, REG_FILE_Reg_Din_3__14, REG_FILE_Reg_Din_3__13, 
         REG_FILE_Reg_Din_3__12, REG_FILE_Reg_Din_3__11, REG_FILE_Reg_Din_3__10, 
         REG_FILE_Reg_Din_3__9, REG_FILE_Reg_Din_3__8, REG_FILE_Reg_Din_3__7, 
         REG_FILE_Reg_Din_3__6, REG_FILE_Reg_Din_3__5, REG_FILE_Reg_Din_3__4, 
         REG_FILE_Reg_Din_3__3, REG_FILE_Reg_Din_3__2, REG_FILE_Reg_Din_3__1, 
         REG_FILE_Reg_Din_3__0, REG_FILE_Reg_Din_4__15, REG_FILE_Reg_Din_4__14, 
         REG_FILE_Reg_Din_4__13, REG_FILE_Reg_Din_4__12, REG_FILE_Reg_Din_4__11, 
         REG_FILE_Reg_Din_4__10, REG_FILE_Reg_Din_4__9, REG_FILE_Reg_Din_4__8, 
         REG_FILE_Reg_Din_4__7, REG_FILE_Reg_Din_4__6, REG_FILE_Reg_Din_4__5, 
         REG_FILE_Reg_Din_4__4, REG_FILE_Reg_Din_4__3, REG_FILE_Reg_Din_4__2, 
         REG_FILE_Reg_Din_4__1, REG_FILE_Reg_Din_4__0, REG_FILE_Reg_Din_5__15, 
         REG_FILE_Reg_Din_5__14, REG_FILE_Reg_Din_5__13, REG_FILE_Reg_Din_5__12, 
         REG_FILE_Reg_Din_5__11, REG_FILE_Reg_Din_5__10, REG_FILE_Reg_Din_5__9, 
         REG_FILE_Reg_Din_5__8, REG_FILE_Reg_Din_5__7, REG_FILE_Reg_Din_5__6, 
         REG_FILE_Reg_Din_5__5, REG_FILE_Reg_Din_5__4, REG_FILE_Reg_Din_5__3, 
         REG_FILE_Reg_Din_5__2, REG_FILE_Reg_Din_5__1, REG_FILE_Reg_Din_5__0, 
         REG_FILE_Reg_Din_6__15, REG_FILE_Reg_Din_6__14, REG_FILE_Reg_Din_6__13, 
         REG_FILE_Reg_Din_6__12, REG_FILE_Reg_Din_6__11, REG_FILE_Reg_Din_6__10, 
         REG_FILE_Reg_Din_6__9, REG_FILE_Reg_Din_6__8, REG_FILE_Reg_Din_6__7, 
         REG_FILE_Reg_Din_6__6, REG_FILE_Reg_Din_6__5, REG_FILE_Reg_Din_6__4, 
         REG_FILE_Reg_Din_6__3, REG_FILE_Reg_Din_6__2, REG_FILE_Reg_Din_6__1, 
         REG_FILE_Reg_Din_6__0, REG_FILE_Reg_Dout_0__15, REG_FILE_Reg_Dout_0__14, 
         REG_FILE_Reg_Dout_0__13, REG_FILE_Reg_Dout_0__12, 
         REG_FILE_Reg_Dout_0__11, REG_FILE_Reg_Dout_0__10, 
         REG_FILE_Reg_Dout_0__9, REG_FILE_Reg_Dout_0__8, REG_FILE_Reg_Dout_0__7, 
         REG_FILE_Reg_Dout_0__6, REG_FILE_Reg_Dout_0__5, REG_FILE_Reg_Dout_0__4, 
         REG_FILE_Reg_Dout_0__3, REG_FILE_Reg_Dout_0__2, REG_FILE_Reg_Dout_0__1, 
         REG_FILE_Reg_Dout_0__0, REG_FILE_Reg_Dout_1__15, 
         REG_FILE_Reg_Dout_1__14, REG_FILE_Reg_Dout_1__13, 
         REG_FILE_Reg_Dout_1__12, REG_FILE_Reg_Dout_1__11, 
         REG_FILE_Reg_Dout_1__10, REG_FILE_Reg_Dout_1__9, REG_FILE_Reg_Dout_1__8, 
         REG_FILE_Reg_Dout_1__7, REG_FILE_Reg_Dout_1__6, REG_FILE_Reg_Dout_1__5, 
         REG_FILE_Reg_Dout_1__4, REG_FILE_Reg_Dout_1__3, REG_FILE_Reg_Dout_1__2, 
         REG_FILE_Reg_Dout_1__1, REG_FILE_Reg_Dout_1__0, REG_FILE_Reg_Dout_2__15, 
         REG_FILE_Reg_Dout_2__14, REG_FILE_Reg_Dout_2__13, 
         REG_FILE_Reg_Dout_2__12, REG_FILE_Reg_Dout_2__11, 
         REG_FILE_Reg_Dout_2__10, REG_FILE_Reg_Dout_2__9, REG_FILE_Reg_Dout_2__8, 
         REG_FILE_Reg_Dout_2__7, REG_FILE_Reg_Dout_2__6, REG_FILE_Reg_Dout_2__5, 
         REG_FILE_Reg_Dout_2__4, REG_FILE_Reg_Dout_2__3, REG_FILE_Reg_Dout_2__2, 
         REG_FILE_Reg_Dout_2__1, REG_FILE_Reg_Dout_2__0, REG_FILE_Reg_Dout_3__15, 
         REG_FILE_Reg_Dout_3__14, REG_FILE_Reg_Dout_3__13, 
         REG_FILE_Reg_Dout_3__12, REG_FILE_Reg_Dout_3__11, 
         REG_FILE_Reg_Dout_3__10, REG_FILE_Reg_Dout_3__9, REG_FILE_Reg_Dout_3__8, 
         REG_FILE_Reg_Dout_3__7, REG_FILE_Reg_Dout_3__6, REG_FILE_Reg_Dout_3__5, 
         REG_FILE_Reg_Dout_3__4, REG_FILE_Reg_Dout_3__3, REG_FILE_Reg_Dout_3__2, 
         REG_FILE_Reg_Dout_3__1, REG_FILE_Reg_Dout_3__0, REG_FILE_Reg_Dout_4__15, 
         REG_FILE_Reg_Dout_4__14, REG_FILE_Reg_Dout_4__13, 
         REG_FILE_Reg_Dout_4__12, REG_FILE_Reg_Dout_4__11, 
         REG_FILE_Reg_Dout_4__10, REG_FILE_Reg_Dout_4__9, REG_FILE_Reg_Dout_4__8, 
         REG_FILE_Reg_Dout_4__7, REG_FILE_Reg_Dout_4__6, REG_FILE_Reg_Dout_4__5, 
         REG_FILE_Reg_Dout_4__4, REG_FILE_Reg_Dout_4__3, REG_FILE_Reg_Dout_4__2, 
         REG_FILE_Reg_Dout_4__1, REG_FILE_Reg_Dout_4__0, REG_FILE_Reg_Dout_5__15, 
         REG_FILE_Reg_Dout_5__14, REG_FILE_Reg_Dout_5__13, 
         REG_FILE_Reg_Dout_5__12, REG_FILE_Reg_Dout_5__11, 
         REG_FILE_Reg_Dout_5__10, REG_FILE_Reg_Dout_5__9, REG_FILE_Reg_Dout_5__8, 
         REG_FILE_Reg_Dout_5__7, REG_FILE_Reg_Dout_5__6, REG_FILE_Reg_Dout_5__5, 
         REG_FILE_Reg_Dout_5__4, REG_FILE_Reg_Dout_5__3, REG_FILE_Reg_Dout_5__2, 
         REG_FILE_Reg_Dout_5__1, REG_FILE_Reg_Dout_5__0, REG_FILE_Reg_Dout_6__15, 
         REG_FILE_Reg_Dout_6__14, REG_FILE_Reg_Dout_6__13, 
         REG_FILE_Reg_Dout_6__12, REG_FILE_Reg_Dout_6__11, 
         REG_FILE_Reg_Dout_6__10, REG_FILE_Reg_Dout_6__9, REG_FILE_Reg_Dout_6__8, 
         REG_FILE_Reg_Dout_6__7, REG_FILE_Reg_Dout_6__6, REG_FILE_Reg_Dout_6__5, 
         REG_FILE_Reg_Dout_6__4, REG_FILE_Reg_Dout_6__3, REG_FILE_Reg_Dout_6__2, 
         REG_FILE_Reg_Dout_6__1, REG_FILE_Reg_Dout_6__0, REG_FILE_Reg_EN_6, 
         REG_FILE_Reg_EN_5, REG_FILE_Reg_EN_4, REG_FILE_Reg_EN_3, 
         REG_FILE_Reg_EN_2, REG_FILE_Reg_EN_1, REG_FILE_Reg_EN_0, 
         REG_FILE_Reg_A_in_4, REG_FILE_Reg_A_in_3, REG_FILE_Reg_B_in_6, 
         REG_FILE_Reg_B_in_5, REG_FILE_Reg_B_in_4, REG_FILE_Reg_B_in_3, 
         REG_FILE_Reg_B_in_2, REG_FILE_Reg_B_in_1, REG_FILE_Reg_B_in_0, 
         REG_FILE_Reg_A_out_7, REG_FILE_Reg_A_out_6, REG_FILE_Reg_A_out_5, 
         REG_FILE_Reg_A_out_4, REG_FILE_Reg_A_out_3, REG_FILE_Reg_A_out_2, 
         REG_FILE_Reg_A_out_1, REG_FILE_Reg_A_out_0, REG_FILE_Reg_B_out_7, 
         REG_FILE_Reg_B_out_6, REG_FILE_Reg_B_out_5, REG_FILE_Reg_B_out_4, 
         REG_FILE_Reg_B_out_3, REG_FILE_Reg_B_out_2, REG_FILE_Reg_B_out_1, 
         REG_FILE_Reg_B_out_0, REG_FILE_DEC_A_IN_nx2, REG_FILE_DEC_A_IN_nx179, 
         REG_FILE_DEC_A_IN_nx184, REG_FILE_DEC_A_IN_nx187, 
         REG_FILE_DEC_A_IN_nx192, REG_FILE_DEC_B_IN_nx2, REG_FILE_DEC_B_IN_nx179, 
         REG_FILE_DEC_B_IN_nx184, REG_FILE_DEC_B_IN_nx187, 
         REG_FILE_DEC_B_IN_nx192, REG_FILE_DEC_A_OUT_nx2, 
         REG_FILE_DEC_A_OUT_nx179, REG_FILE_DEC_A_OUT_nx184, 
         REG_FILE_DEC_A_OUT_nx187, REG_FILE_DEC_A_OUT_nx192, 
         REG_FILE_DEC_B_OUT_nx2, REG_FILE_DEC_B_OUT_nx179, 
         REG_FILE_DEC_B_OUT_nx184, REG_FILE_DEC_B_OUT_nx187, 
         REG_FILE_DEC_B_OUT_nx192, REG_FILE_PWR, REG_FILE_nx1316, 
         REG_FILE_nx1324, REG_FILE_nx1348, REG_FILE_nx1356, REG_FILE_nx1364, 
         REG_FILE_nx1386, REG_FILE_nx1392, HAZARD_UNIT_nx40, HAZARD_UNIT_nx76, 
         HAZARD_UNIT_nx106, HAZARD_UNIT_nx114, HAZARD_UNIT_nx130, 
         HAZARD_UNIT_nx152, HAZARD_UNIT_nx176, HAZARD_UNIT_nx200, 
         HAZARD_UNIT_nx224, HAZARD_UNIT_nx248, HAZARD_UNIT_nx262, 
         HAZARD_UNIT_nx282, HAZARD_UNIT_nx314, HAZARD_UNIT_nx346, 
         HAZARD_UNIT_nx374, HAZARD_UNIT_nx402, HAZARD_UNIT_nx430, 
         HAZARD_UNIT_nx458, HAZARD_UNIT_nx486, HAZARD_UNIT_nx498, 
         HAZARD_UNIT_nx518, HAZARD_UNIT_nx548, HAZARD_UNIT_nx584, 
         HAZARD_UNIT_nx590, HAZARD_UNIT_nx592, HAZARD_UNIT_nx646, 
         HAZARD_UNIT_nx656, HAZARD_UNIT_nx684, HAZARD_UNIT_nx706, 
         HAZARD_UNIT_nx738, HAZARD_UNIT_nx770, HAZARD_UNIT_nx802, 
         HAZARD_UNIT_nx834, HAZARD_UNIT_nx866, HAZARD_UNIT_nx898, 
         HAZARD_UNIT_nx930, HAZARD_UNIT_nx962, HAZARD_UNIT_nx972, 
         HAZARD_UNIT_nx976, HAZARD_UNIT_nx982, HAZARD_UNIT_nx986, 
         HAZARD_UNIT_nx994, HAZARD_UNIT_nx1160, HAZARD_UNIT_nx1168, 
         HAZARD_UNIT_nx1174, HAZARD_UNIT_nx1180, HAZARD_UNIT_nx1210, 
         HAZARD_UNIT_nx1236, HAZARD_UNIT_nx1262, HAZARD_UNIT_nx1288, 
         HAZARD_UNIT_nx1290, HAZARD_UNIT_nx1314, HAZARD_UNIT_nx1340, 
         HAZARD_UNIT_nx1342, HAZARD_UNIT_nx1366, HAZARD_UNIT_nx1392, 
         HAZARD_UNIT_nx1394, HAZARD_UNIT_nx1476, HAZARD_UNIT_nx1478, 
         HAZARD_UNIT_nx1502, HAZARD_UNIT_nx1518, HAZARD_UNIT_nx1532, 
         HAZARD_UNIT_nx1546, HAZARD_UNIT_nx1548, HAZARD_UNIT_nx1562, 
         HAZARD_UNIT_nx1568, HAZARD_UNIT_nx1646, HAZARD_UNIT_nx1637, 
         HAZARD_UNIT_nx1641, HAZARD_UNIT_nx1645, HAZARD_UNIT_nx1651, 
         HAZARD_UNIT_nx1654, HAZARD_UNIT_nx1656, HAZARD_UNIT_nx1658, 
         HAZARD_UNIT_nx1661, HAZARD_UNIT_nx1663, HAZARD_UNIT_nx1665, 
         HAZARD_UNIT_nx1667, HAZARD_UNIT_nx1669, HAZARD_UNIT_nx1671, 
         HAZARD_UNIT_nx1673, HAZARD_UNIT_nx1675, HAZARD_UNIT_nx1677, 
         HAZARD_UNIT_nx1679, HAZARD_UNIT_nx1681, HAZARD_UNIT_nx1685, 
         HAZARD_UNIT_nx1687, HAZARD_UNIT_nx1689, HAZARD_UNIT_nx1691, 
         HAZARD_UNIT_nx1698, HAZARD_UNIT_nx1701, HAZARD_UNIT_nx1703, 
         HAZARD_UNIT_nx1706, HAZARD_UNIT_nx1709, HAZARD_UNIT_nx1711, 
         HAZARD_UNIT_nx1714, HAZARD_UNIT_nx1717, HAZARD_UNIT_nx1719, 
         HAZARD_UNIT_nx1721, HAZARD_UNIT_nx1724, HAZARD_UNIT_nx1727, 
         HAZARD_UNIT_nx1729, HAZARD_UNIT_nx1732, HAZARD_UNIT_nx1735, 
         HAZARD_UNIT_nx1737, HAZARD_UNIT_nx1740, HAZARD_UNIT_nx1742, 
         HAZARD_UNIT_nx1748, HAZARD_UNIT_nx1750, HAZARD_UNIT_nx1753, 
         HAZARD_UNIT_nx1755, HAZARD_UNIT_nx1758, HAZARD_UNIT_nx1760, 
         HAZARD_UNIT_nx1765, HAZARD_UNIT_nx1767, HAZARD_UNIT_nx1770, 
         HAZARD_UNIT_nx1772, HAZARD_UNIT_nx1775, HAZARD_UNIT_nx1777, 
         HAZARD_UNIT_nx1781, HAZARD_UNIT_nx1784, HAZARD_UNIT_nx1794, 
         HAZARD_UNIT_nx1796, HAZARD_UNIT_nx1798, HAZARD_UNIT_nx1800, 
         HAZARD_UNIT_nx1802, HAZARD_UNIT_nx1804, HAZARD_UNIT_nx1806, 
         HAZARD_UNIT_nx1809, HAZARD_UNIT_nx1811, HAZARD_UNIT_nx1813, 
         HAZARD_UNIT_nx1815, HAZARD_UNIT_nx1817, HAZARD_UNIT_nx1820, 
         HAZARD_UNIT_nx1822, HAZARD_UNIT_nx1825, HAZARD_UNIT_nx1827, 
         HAZARD_UNIT_nx1829, HAZARD_UNIT_nx1832, HAZARD_UNIT_nx1834, 
         HAZARD_UNIT_nx1836, HAZARD_UNIT_nx1838, HAZARD_UNIT_nx1841, 
         HAZARD_UNIT_nx1844, HAZARD_UNIT_nx1846, HAZARD_UNIT_nx1848, 
         HAZARD_UNIT_nx1850, HAZARD_UNIT_nx1852, HAZARD_UNIT_nx1854, 
         HAZARD_UNIT_nx1857, HAZARD_UNIT_nx1859, HAZARD_UNIT_nx1861, 
         HAZARD_UNIT_nx1863, HAZARD_UNIT_nx1868, HAZARD_UNIT_nx1871, 
         HAZARD_UNIT_nx1877, HAZARD_UNIT_nx1880, HAZARD_UNIT_nx1882, 
         HAZARD_UNIT_nx1884, HAZARD_UNIT_nx1887, HAZARD_UNIT_nx1891, 
         HAZARD_UNIT_nx1894, HAZARD_UNIT_nx1896, HAZARD_UNIT_nx1898, 
         HAZARD_UNIT_nx1901, HAZARD_UNIT_nx1903, HAZARD_UNIT_nx1906, 
         HAZARD_UNIT_nx1909, HAZARD_UNIT_nx1911, HAZARD_UNIT_nx1913, 
         HAZARD_UNIT_nx1916, HAZARD_UNIT_nx1918, HAZARD_UNIT_nx1921, 
         HAZARD_UNIT_nx1924, HAZARD_UNIT_nx1926, HAZARD_UNIT_nx1928, 
         HAZARD_UNIT_nx1931, HAZARD_UNIT_nx1933, HAZARD_UNIT_nx1937, 
         HAZARD_UNIT_nx1940, HAZARD_UNIT_nx1942, HAZARD_UNIT_nx1944, 
         HAZARD_UNIT_nx1948, HAZARD_UNIT_nx1951, HAZARD_UNIT_nx1954, 
         HAZARD_UNIT_nx1956, HAZARD_UNIT_nx1958, HAZARD_UNIT_nx1961, 
         HAZARD_UNIT_nx1963, HAZARD_UNIT_nx1967, HAZARD_UNIT_nx1970, 
         HAZARD_UNIT_nx1972, HAZARD_UNIT_nx1974, HAZARD_UNIT_nx1978, 
         HAZARD_UNIT_nx1981, HAZARD_UNIT_nx1984, HAZARD_UNIT_nx1986, 
         HAZARD_UNIT_nx1988, HAZARD_UNIT_nx1991, HAZARD_UNIT_nx1993, 
         HAZARD_UNIT_nx1997, HAZARD_UNIT_nx2000, HAZARD_UNIT_nx2002, 
         HAZARD_UNIT_nx2005, HAZARD_UNIT_nx2021, HAZARD_UNIT_nx2023, 
         HAZARD_UNIT_nx2027, HAZARD_UNIT_nx2029, HAZARD_UNIT_nx2033, 
         HAZARD_UNIT_nx2035, HAZARD_UNIT_nx2039, HAZARD_UNIT_nx2041, 
         HAZARD_UNIT_nx2045, HAZARD_UNIT_nx2047, HAZARD_UNIT_nx2051, 
         HAZARD_UNIT_nx2053, HAZARD_UNIT_nx2056, HAZARD_UNIT_nx2059, 
         HAZARD_UNIT_nx2062, HAZARD_UNIT_nx2069, HAZARD_UNIT_nx2071, 
         HAZARD_UNIT_nx2074, HAZARD_UNIT_nx2076, HAZARD_UNIT_nx2079, 
         HAZARD_UNIT_nx2081, HAZARD_UNIT_nx2084, HAZARD_UNIT_nx2086, 
         HAZARD_UNIT_nx2089, HAZARD_UNIT_nx2091, HAZARD_UNIT_nx2094, 
         HAZARD_UNIT_nx2096, HAZARD_UNIT_nx2099, HAZARD_UNIT_nx2101, 
         HAZARD_UNIT_nx2104, HAZARD_UNIT_nx2106, HAZARD_UNIT_nx2109, 
         HAZARD_UNIT_nx2112, HAZARD_UNIT_nx2114, HAZARD_UNIT_nx2117, 
         HAZARD_UNIT_nx2119, HAZARD_UNIT_nx2122, HAZARD_UNIT_nx2124, 
         HAZARD_UNIT_nx2126, HAZARD_UNIT_nx2129, HAZARD_UNIT_nx2132, 
         HAZARD_UNIT_nx2134, HAZARD_UNIT_nx2138, HAZARD_UNIT_nx2141, 
         HAZARD_UNIT_nx2143, HAZARD_UNIT_nx2145, HAZARD_UNIT_nx2147, 
         HAZARD_UNIT_nx2150, HAZARD_UNIT_nx2152, HAZARD_UNIT_nx2154, 
         HAZARD_UNIT_nx2156, HAZARD_UNIT_nx2159, HAZARD_UNIT_nx2161, 
         HAZARD_UNIT_nx2163, HAZARD_UNIT_nx2165, HAZARD_UNIT_nx2168, 
         HAZARD_UNIT_nx2170, HAZARD_UNIT_nx2172, HAZARD_UNIT_nx2175, 
         HAZARD_UNIT_nx2177, HAZARD_UNIT_nx2179, HAZARD_UNIT_nx2186, 
         HAZARD_UNIT_nx2188, HAZARD_UNIT_nx2190, HAZARD_UNIT_nx2192, 
         HAZARD_UNIT_nx2194, HAZARD_UNIT_nx2196, HAZARD_UNIT_nx2198, 
         HAZARD_UNIT_nx2200, HAZARD_UNIT_nx2202, HAZARD_UNIT_nx2204, 
         HAZARD_UNIT_nx2206, HAZARD_UNIT_nx2208, HAZARD_UNIT_nx2210, 
         HAZARD_UNIT_nx2212, HAZARD_UNIT_nx2214, HAZARD_UNIT_nx2216, 
         HAZARD_UNIT_nx2218, HAZARD_UNIT_nx2220, HAZARD_UNIT_nx2222, 
         HAZARD_UNIT_nx2224, HAZARD_UNIT_nx2226, HAZARD_UNIT_nx2228, 
         HAZARD_UNIT_nx2230, HAZARD_UNIT_nx2232, HAZARD_UNIT_nx2234, 
         HAZARD_UNIT_nx2236, HAZARD_UNIT_nx2238, HAZARD_UNIT_nx2240, 
         HAZARD_UNIT_nx2242, HAZARD_UNIT_nx2244, HAZARD_UNIT_nx2246, 
         HAZARD_UNIT_nx2248, HAZARD_UNIT_nx2250, HAZARD_UNIT_nx2252, 
         HAZARD_UNIT_nx2254, HAZARD_UNIT_nx2256, HAZARD_UNIT_nx2258, 
         HAZARD_UNIT_nx2260, HAZARD_UNIT_nx2262, HAZARD_UNIT_nx2264, 
         HAZARD_UNIT_nx2266, HAZARD_UNIT_nx2268, HAZARD_UNIT_nx2270, 
         HAZARD_UNIT_nx2272, HAZARD_UNIT_nx2274, HAZARD_UNIT_nx2276, 
         HAZARD_UNIT_nx2284, HAZARD_UNIT_nx2286, PC_Next_15, PWR, NOT_Stall, 
         nx460, nx474, nx482, nx494, nx510, nx1153, nx1159, nx1161, nx1163, 
         nx1165, nx1223, nx1230, nx1232, nx1234, nx1236, nx1238, nx1240, nx1242, 
         nx1244, nx1246, nx1248, nx1250, nx1252, nx1254, nx1256, nx1270, nx1272, 
         nx1274, nx1276, nx1278, nx1280, nx1282, nx1284, nx1286, nx1288, nx1290, 
         nx1292, nx1294, nx1296, nx1298, nx1300, nx1302, nx1304, nx1306, nx1308, 
         nx1310, nx1312, nx1314, nx1316, nx1318, nx1320, nx1322, nx1324, nx1326, 
         nx1328, nx1330, nx1332, nx1334, nx1336, nx1338, nx1340, nx1342, nx1344;
    wire [1:0] \$dummy ;




    RAM_16_10 PROG_MEM (.CLK (EXT_CLK), .WR (PC_Next_15), .Address ({PC_Cur_9,
              PC_Cur_8,PC_Cur_7,PC_Cur_6,PC_Cur_5,PC_Cur_4,PC_Cur_3,PC_Cur_2,
              PC_Cur_1,PC_Cur_0}), .Din ({PC_Next_15,PC_Next_15,PC_Next_15,
              PC_Next_15,PC_Next_15,PC_Next_15,PC_Next_15,PC_Next_15,PC_Next_15,
              PC_Next_15,PC_Next_15,PC_Next_15,PC_Next_15,PC_Next_15,PC_Next_15,
              PC_Next_15}), .Dout ({Instr_15,Instr_14,Instr_13,Instr_12,Instr_11
              ,Instr_10,Instr_9,Instr_8,Instr_7,Instr_6,Instr_5,Instr_4,Instr_3,
              Instr_2,Instr_1,Instr_0})) ;
    register_edge_rising_10 PC_RESET (.CLK (EXT_CLK), .RST (HARD_RST), .EN (
                            PC_Reset_EN), .Din ({MEM_Din_9,MEM_Din_8,MEM_Din_7,
                            MEM_Din_6,MEM_Din_5,MEM_Din_4,MEM_Din_3,MEM_Din_2,
                            MEM_Din_1,MEM_Din_0}), .Dout ({PC_Reset_Dout_9,
                            PC_Reset_Dout_8,PC_Reset_Dout_7,PC_Reset_Dout_6,
                            PC_Reset_Dout_5,PC_Reset_Dout_4,PC_Reset_Dout_3,
                            PC_Reset_Dout_2,PC_Reset_Dout_1,PC_Reset_Dout_0})) ;
    register_edge_rising_10 PC_INTR (.CLK (EXT_CLK), .RST (HARD_RST), .EN (
                            PC_INTR_EN), .Din ({MEM_Din_9,MEM_Din_8,MEM_Din_7,
                            MEM_Din_6,MEM_Din_5,MEM_Din_4,MEM_Din_3,MEM_Din_2,
                            MEM_Din_1,MEM_Din_0}), .Dout ({PC_INTR_Dout_9,
                            PC_INTR_Dout_8,PC_INTR_Dout_7,PC_INTR_Dout_6,
                            PC_INTR_Dout_5,PC_INTR_Dout_4,PC_INTR_Dout_3,
                            PC_INTR_Dout_2,PC_INTR_Dout_1,PC_INTR_Dout_0})) ;
    register_edge_falling_16 DEC_IR (.CLK (EXT_CLK), .RST (DEC_IR_RST), .EN (
                             NOT_Stall), .Din ({DEC_IR_Din_15,DEC_IR_Din_14,
                             DEC_IR_Din_13,DEC_IR_Din_12,DEC_IR_Din_11,
                             DEC_IR_Din_10,DEC_IR_Din_9,DEC_IR_Din_8,
                             DEC_IR_Din_7,DEC_IR_Din_6,DEC_IR_Din_5,DEC_IR_Din_4
                             ,DEC_IR_Din_3,DEC_IR_Din_2,DEC_IR_Din_1,
                             DEC_IR_Din_0}), .Dout ({DEC_IR_Dout_15,
                             DEC_IR_Dout_14,DEC_IR_Dout_13,DEC_IR_Dout_12,
                             DEC_IR_Dout_11,DEC_IR_Dout_10,DEC_IR_Dout_9,
                             DEC_IR_Dout_8,DEC_IR_Dout_7,DEC_IR_Dout_6,
                             DEC_IR_Dout_5,DEC_IR_Dout_4,DEC_IR_Dout_3,
                             DEC_IR_Dout_2,DEC_IR_Dout_1,DEC_IR_Dout_0})) ;
    register_edge_falling_10 DEC_PC_TO_STORE_REG (.CLK (EXT_CLK), .RST (HARD_RST
                             ), .EN (DEC_PC_To_Store_EN), .Din ({PC_Next_9,
                             PC_Next_8,PC_Next_7,PC_Next_6,PC_Next_5,PC_Next_4,
                             PC_Next_3,PC_Next_2,PC_Next_1,PC_Next_0}), .Dout ({
                             DEC_PC_To_Store_Dout_9,DEC_PC_To_Store_Dout_8,
                             DEC_PC_To_Store_Dout_7,DEC_PC_To_Store_Dout_6,
                             DEC_PC_To_Store_Dout_5,DEC_PC_To_Store_Dout_4,
                             DEC_PC_To_Store_Dout_3,DEC_PC_To_Store_Dout_2,
                             DEC_PC_To_Store_Dout_1,DEC_PC_To_Store_Dout_0})) ;
    register_edge_falling_20 EXE_SRC_REG (.CLK (EXT_CLK), .RST (EXE_RST), .EN (
                             PWR), .Din ({DEC_Rsrc_WB,DEC_IR_Dout_2,
                             DEC_IR_Dout_1,DEC_IR_Dout_0,EXE_Src_Din_15,
                             EXE_Src_Din_14,EXE_Src_Din_13,EXE_Src_Din_12,
                             EXE_Src_Din_11,EXE_Src_Din_10,EXE_Src_Din_9,
                             EXE_Src_Din_8,EXE_Src_Din_7,EXE_Src_Din_6,
                             EXE_Src_Din_5,EXE_Src_Din_4,EXE_Src_Din_3,
                             EXE_Src_Din_2,EXE_Src_Din_1,EXE_Src_Din_0}), .Dout (
                             {EXE_Src_19,EXE_Src_18,EXE_Src_17,EXE_Src_16,
                             EXE_Src_15,EXE_Src_14,EXE_Src_13,EXE_Src_12,
                             EXE_Src_11,EXE_Src_10,EXE_Src_9,EXE_Src_8,EXE_Src_7
                             ,EXE_Src_6,EXE_Src_5,EXE_Src_4,EXE_Src_3,EXE_Src_2,
                             EXE_Src_1,EXE_Src_0})) ;
    register_edge_falling_20 EXE_DST_REG (.CLK (EXT_CLK), .RST (EXE_RST), .EN (
                             PWR), .Din ({DEC_Rdst_WB,DEC_IR_Dout_5,
                             DEC_IR_Dout_4,DEC_IR_Dout_3,EXE_Dst_Din_15,
                             EXE_Dst_Din_14,EXE_Dst_Din_13,EXE_Dst_Din_12,
                             EXE_Dst_Din_11,EXE_Dst_Din_10,EXE_Dst_Din_9,
                             EXE_Dst_Din_8,EXE_Dst_Din_7,EXE_Dst_Din_6,
                             EXE_Dst_Din_5,EXE_Dst_Din_4,EXE_Dst_Din_3,
                             EXE_Dst_Din_2,EXE_Dst_Din_1,EXE_Dst_Din_0}), .Dout (
                             {EXE_Dst_19,EXE_Dst_18,EXE_Dst_17,EXE_Dst_16,
                             EXE_Dst_15,EXE_Dst_14,EXE_Dst_13,EXE_Dst_12,
                             EXE_Dst_11,EXE_Dst_10,EXE_Dst_9,EXE_Dst_8,EXE_Dst_7
                             ,EXE_Dst_6,EXE_Dst_5,EXE_Dst_4,EXE_Dst_3,EXE_Dst_2,
                             EXE_Dst_1,EXE_Dst_0})) ;
    register_edge_falling_10 EXE_CTRL_REG (.CLK (EXT_CLK), .RST (EXE_RST), .EN (
                             PWR), .Din ({DEC_ALU_Opr_3,DEC_ALU_Opr_2,
                             DEC_ALU_Opr_1,DEC_ALU_Opr_0,DEC_Flags_EN,
                             DEC_Flags_Restore,DEC_Mem_Addr_Switch,DEC_Mem_WR,
                             DEC_Mem_RD,DEC_Port_Out_WR}), .Dout ({EXE_Ctrl_9,
                             EXE_Ctrl_8,EXE_Ctrl_7,EXE_Ctrl_6,EXE_Ctrl_5,
                             EXE_Ctrl_4,EXE_Ctrl_3,EXE_Ctrl_2,EXE_Ctrl_1,
                             EXE_Ctrl_0})) ;
    ALU_16 EXE_ALU (.Opr ({EXE_Ctrl_9,EXE_Ctrl_8,EXE_Ctrl_7,EXE_Ctrl_6}), .A ({
           EXE_Src_15,EXE_Src_14,EXE_Src_13,EXE_Src_12,EXE_Src_11,EXE_Src_10,
           EXE_Src_9,EXE_Src_8,EXE_Src_7,EXE_Src_6,EXE_Src_5,EXE_Src_4,EXE_Src_3
           ,EXE_Src_2,EXE_Src_1,EXE_Src_0}), .B ({EXE_Dst_15,EXE_Dst_14,
           EXE_Dst_13,EXE_Dst_12,EXE_Dst_11,EXE_Dst_10,EXE_Dst_9,EXE_Dst_8,
           EXE_Dst_7,EXE_Dst_6,EXE_Dst_5,EXE_Dst_4,EXE_Dst_3,EXE_Dst_2,EXE_Dst_1
           ,EXE_Dst_0}), .Cin (Flags_Dout_2), .Res1 ({EXE_Res1_15,EXE_Res1_14,
           EXE_Res1_13,EXE_Res1_12,EXE_Res1_11,EXE_Res1_10,EXE_Res1_9,EXE_Res1_8
           ,EXE_Res1_7,EXE_Res1_6,EXE_Res1_5,EXE_Res1_4,EXE_Res1_3,EXE_Res1_2,
           EXE_Res1_1,EXE_Res1_0}), .Res2 ({EXE_Res2_15,EXE_Res2_14,EXE_Res2_13,
           EXE_Res2_12,EXE_Res2_11,EXE_Res2_10,EXE_Res2_9,EXE_Res2_8,EXE_Res2_7,
           EXE_Res2_6,EXE_Res2_5,EXE_Res2_4,EXE_Res2_3,EXE_Res2_2,EXE_Res2_1,
           EXE_Res2_0}), .Flags ({EXE_Flags_3,EXE_Flags_2,EXE_Flags_1,
           EXE_Flags_0})) ;
    register_edge_rising_4 FLAG_REG (.CLK (EXT_CLK), .RST (HARD_RST), .EN (
                           Flags_EN), .Din ({Flags_Din_3,Flags_Din_2,Flags_Din_1
                           ,Flags_Din_0}), .Dout ({Flags_Dout_3,Flags_Dout_2,
                           Flags_Dout_1,Flags_Dout_0})) ;
    register_edge_rising_20 MEM_SRC_REG (.CLK (EXT_CLK), .RST (HARD_RST), .EN (
                            PWR), .Din ({EXE_Src_19,EXE_Src_18,EXE_Src_17,
                            EXE_Src_16,EXE_Res2_15,EXE_Res2_14,EXE_Res2_13,
                            EXE_Res2_12,EXE_Res2_11,EXE_Res2_10,EXE_Res2_9,
                            EXE_Res2_8,EXE_Res2_7,EXE_Res2_6,EXE_Res2_5,
                            EXE_Res2_4,EXE_Res2_3,EXE_Res2_2,EXE_Res2_1,
                            EXE_Res2_0}), .Dout ({MEM_Src_19,MEM_Src_18,
                            MEM_Src_17,MEM_Src_16,MEM_Src_15,MEM_Src_14,
                            MEM_Src_13,MEM_Src_12,MEM_Src_11,MEM_Src_10,
                            MEM_Src_9,MEM_Src_8,MEM_Src_7,MEM_Src_6,MEM_Src_5,
                            MEM_Src_4,MEM_Src_3,MEM_Src_2,MEM_Src_1,MEM_Src_0})
                            ) ;
    register_edge_rising_20 MEM_DST_REG (.CLK (EXT_CLK), .RST (HARD_RST), .EN (
                            PWR), .Din ({EXE_Dst_19,EXE_Dst_18,EXE_Dst_17,
                            EXE_Dst_16,EXE_Res1_15,EXE_Res1_14,EXE_Res1_13,
                            EXE_Res1_12,EXE_Res1_11,EXE_Res1_10,EXE_Res1_9,
                            EXE_Res1_8,EXE_Res1_7,EXE_Res1_6,EXE_Res1_5,
                            EXE_Res1_4,EXE_Res1_3,EXE_Res1_2,EXE_Res1_1,
                            EXE_Res1_0}), .Dout ({MEM_Dst_19,MEM_Dst_18,
                            MEM_Dst_17,MEM_Dst_16,MEM_Dst_15,MEM_Dst_14,
                            MEM_Dst_13,MEM_Dst_12,MEM_Dst_11,MEM_Dst_10,
                            MEM_Dst_9,MEM_Dst_8,MEM_Dst_7,MEM_Dst_6,MEM_Dst_5,
                            MEM_Dst_4,MEM_Dst_3,MEM_Dst_2,MEM_Dst_1,MEM_Dst_0})
                            ) ;
    register_edge_rising_5 MEM_CTRL_REG (.CLK (EXT_CLK), .RST (HARD_RST), .EN (
                           PWR), .Din ({EXE_Ctrl_4,EXE_Ctrl_3,EXE_Ctrl_2,
                           EXE_Ctrl_1,EXE_Ctrl_0}), .Dout ({MEM_Ctrl_4,
                           MEM_Ctrl_3,MEM_Ctrl_2,MEM_Ctrl_1,MEM_Ctrl_0})) ;
    RAM_16_10 DATA_MEM (.CLK (EXT_CLK), .WR (MEM_Ctrl_2), .Address ({MEM_Addr_9,
              MEM_Addr_8,MEM_Addr_7,MEM_Addr_6,MEM_Addr_5,MEM_Addr_4,MEM_Addr_3,
              MEM_Addr_2,MEM_Addr_1,MEM_Addr_0}), .Din ({MEM_Din_15,MEM_Din_14,
              MEM_Din_13,MEM_Din_12,MEM_Din_11,MEM_Din_10,MEM_Din_9,MEM_Din_8,
              MEM_Din_7,MEM_Din_6,MEM_Din_5,MEM_Din_4,MEM_Din_3,MEM_Din_2,
              MEM_Din_1,MEM_Din_0}), .Dout ({MEM_Dout_15,MEM_Dout_14,MEM_Dout_13
              ,MEM_Dout_12,MEM_Dout_11,MEM_Dout_10,MEM_Dout_9,MEM_Dout_8,
              MEM_Dout_7,MEM_Dout_6,MEM_Dout_5,MEM_Dout_4,MEM_Dout_3,MEM_Dout_2,
              MEM_Dout_1,MEM_Dout_0})) ;
    register_edge_rising_20 WRB_SRC_REG (.CLK (EXT_CLK), .RST (HARD_RST), .EN (
                            PWR), .Din ({MEM_Src_19,MEM_Src_18,MEM_Src_17,
                            MEM_Src_16,WRB_Src_Din_15,WRB_Src_Din_14,
                            WRB_Src_Din_13,WRB_Src_Din_12,WRB_Src_Din_11,
                            WRB_Src_Din_10,WRB_Src_Din_9,WRB_Src_Din_8,
                            WRB_Src_Din_7,WRB_Src_Din_6,WRB_Src_Din_5,
                            WRB_Src_Din_4,WRB_Src_Din_3,WRB_Src_Din_2,
                            WRB_Src_Din_1,WRB_Src_Din_0}), .Dout ({WRB_Src_19,
                            WRB_Src_18,WRB_Src_17,WRB_Src_16,WRB_Src_15,
                            WRB_Src_14,WRB_Src_13,WRB_Src_12,WRB_Src_11,
                            WRB_Src_10,WRB_Src_9,WRB_Src_8,WRB_Src_7,WRB_Src_6,
                            WRB_Src_5,WRB_Src_4,WRB_Src_3,WRB_Src_2,WRB_Src_1,
                            WRB_Src_0})) ;
    register_edge_rising_20 WRB_DST_REG (.CLK (EXT_CLK), .RST (HARD_RST), .EN (
                            PWR), .Din ({MEM_Dst_19,MEM_Dst_18,MEM_Dst_17,
                            MEM_Dst_16,MEM_Dst_15,MEM_Dst_14,MEM_Dst_13,
                            MEM_Dst_12,MEM_Dst_11,MEM_Dst_10,MEM_Dst_9,MEM_Dst_8
                            ,MEM_Dst_7,MEM_Dst_6,MEM_Dst_5,MEM_Dst_4,MEM_Dst_3,
                            MEM_Dst_2,MEM_Dst_1,MEM_Dst_0}), .Dout ({WRB_Dst_19,
                            WRB_Dst_18,WRB_Dst_17,WRB_Dst_16,WRB_Dst_15,
                            WRB_Dst_14,WRB_Dst_13,WRB_Dst_12,WRB_Dst_11,
                            WRB_Dst_10,WRB_Dst_9,WRB_Dst_8,WRB_Dst_7,WRB_Dst_6,
                            WRB_Dst_5,WRB_Dst_4,WRB_Dst_3,WRB_Dst_2,WRB_Dst_1,
                            WRB_Dst_0})) ;
    register_edge_rising_2 WRB_CTRL_REG (.CLK (EXT_CLK), .RST (HARD_RST), .EN (
                           PWR), .Din ({MEM_Ctrl_1,MEM_Ctrl_0}), .Dout ({
                           WRB_Ctrl_1,WRB_Ctrl_0})) ;
    register_edge_rising_16 PORT_OUT_REG (.CLK (EXT_CLK), .RST (HARD_RST), .EN (
                            WRB_Ctrl_0), .Din ({WRB_Src_15,WRB_Src_14,WRB_Src_13
                            ,WRB_Src_12,WRB_Src_11,WRB_Src_10,WRB_Src_9,
                            WRB_Src_8,WRB_Src_7,WRB_Src_6,WRB_Src_5,WRB_Src_4,
                            WRB_Src_3,WRB_Src_2,WRB_Src_1,WRB_Src_0}), .Dout ({
                            PORT_OUT[15],PORT_OUT[14],PORT_OUT[13],PORT_OUT[12],
                            PORT_OUT[11],PORT_OUT[10],PORT_OUT[9],PORT_OUT[8],
                            PORT_OUT[7],PORT_OUT[6],PORT_OUT[5],PORT_OUT[4],
                            PORT_OUT[3],PORT_OUT[2],PORT_OUT[1],PORT_OUT[0]})) ;
    dffr INTR_FLIP_FLOP_1_reg_Dout (.Q (INTR_CLK), .QB (\$dummy [0]), .D (
         INTR_EN), .CLK (EXT_CLK), .R (HARD_RST)) ;
    dffr INTR_FLIP_FLOP_2_reg_Dout (.Q (INTR), .QB (\$dummy [1]), .D (PWR), .CLK (
         INTR_CLK), .R (INTR_RST)) ;
    and03 DEC_CIRCUIT_ix125 (.Y (DEC_Shift_Load), .A0 (DEC_ALU_Opr_3), .A1 (
          DEC_IR_Dout_11), .A2 (DEC_IR_Dout_12)) ;
    and02 DEC_CIRCUIT_ix53 (.Y (DEC_ALU_Opr_3), .A0 (DEC_IR_Dout_13), .A1 (
          DEC_CIRCUIT_nx227)) ;
    inv01 DEC_CIRCUIT_ix177 (.Y (DEC_CIRCUIT_nx176), .A (DEC_IR_Dout_15)) ;
    nor02ii DEC_CIRCUIT_ix65 (.Y (INTR_ACK), .A0 (DEC_CIRCUIT_nx26), .A1 (
            DEC_IR_Dout_6)) ;
    nand02 DEC_CIRCUIT_ix27 (.Y (DEC_CIRCUIT_nx26), .A0 (DEC_IR_Dout_14), .A1 (
           DEC_IR_Dout_15)) ;
    and04 DEC_CIRCUIT_ix93 (.Y (DEC_Branch_Taken), .A0 (DEC_CIRCUIT_nx86), .A1 (
          DEC_IR_Dout_11), .A2 (DEC_IR_Dout_14), .A3 (DEC_IR_Dout_15)) ;
    oai221 DEC_CIRCUIT_ix87 (.Y (DEC_CIRCUIT_nx86), .A0 (DEC_IR_Dout_12), .A1 (
           DEC_CIRCUIT_nx182), .B0 (DEC_CIRCUIT_nx186), .B1 (DEC_IR_Dout_13), .C0 (
           DEC_CIRCUIT_nx188)) ;
    inv01 DEC_CIRCUIT_ix187 (.Y (DEC_CIRCUIT_nx186), .A (Flags_Dout_0)) ;
    nand03 DEC_CIRCUIT_ix189 (.Y (DEC_CIRCUIT_nx188), .A0 (DEC_IR_Dout_13), .A1 (
           Flags_Dout_2), .A2 (DEC_IR_Dout_12)) ;
    nor02ii DEC_CIRCUIT_ix57 (.Y (DEC_PC_Flags_Save), .A0 (DEC_CIRCUIT_nx26), .A1 (
            DEC_IR_Dout_7)) ;
    and02 DEC_CIRCUIT_ix113 (.Y (DEC_Port_Out_WR), .A0 (DEC_IR_Dout_9), .A1 (
          DEC_CIRCUIT_nx192)) ;
    nor02_2x DEC_CIRCUIT_ix193 (.Y (DEC_CIRCUIT_nx192), .A0 (DEC_IR_Dout_14), .A1 (
             DEC_IR_Dout_15)) ;
    and02 DEC_CIRCUIT_ix117 (.Y (DEC_Port_In_RD), .A0 (DEC_IR_Dout_10), .A1 (
          DEC_CIRCUIT_nx192)) ;
    oai32 DEC_CIRCUIT_ix107 (.Y (DEC_Mem_WR), .A0 (DEC_IR_Dout_13), .A1 (
          DEC_CIRCUIT_nx176), .A2 (DEC_IR_Dout_14), .B0 (DEC_IR_Dout_9), .B1 (
          DEC_CIRCUIT_nx196)) ;
    nand03 DEC_CIRCUIT_ix197 (.Y (DEC_CIRCUIT_nx196), .A0 (DEC_IR_Dout_10), .A1 (
           DEC_IR_Dout_14), .A2 (DEC_IR_Dout_15)) ;
    ao21 DEC_CIRCUIT_ix155 (.Y (DEC_Mem_RD), .A0 (DEC_IR_Dout_13), .A1 (nx1242)
         , .B0 (DEC_Mem_Addr_Switch)) ;
    nor02ii DEC_CIRCUIT_ix109 (.Y (DEC_Mem_Addr_Switch), .A0 (DEC_CIRCUIT_nx196)
            , .A1 (DEC_IR_Dout_9)) ;
    nor02ii DEC_CIRCUIT_ix61 (.Y (DEC_Flags_Restore), .A0 (DEC_CIRCUIT_nx26), .A1 (
            DEC_IR_Dout_8)) ;
    oai221 DEC_CIRCUIT_ix43 (.Y (DEC_ALU_Opr_0), .A0 (DEC_IR_Dout_9), .A1 (
           DEC_CIRCUIT_nx202), .B0 (DEC_CIRCUIT_nx227), .B1 (DEC_CIRCUIT_nx204)
           , .C0 (DEC_CIRCUIT_nx206)) ;
    nand03 DEC_CIRCUIT_ix203 (.Y (DEC_CIRCUIT_nx202), .A0 (DEC_IR_Dout_10), .A1 (
           DEC_IR_Dout_14), .A2 (DEC_IR_Dout_15)) ;
    oai21 DEC_CIRCUIT_ix205 (.Y (DEC_CIRCUIT_nx204), .A0 (DEC_IR_Dout_12), .A1 (
          DEC_IR_Dout_11), .B0 (DEC_CIRCUIT_nx192)) ;
    nand02 DEC_CIRCUIT_ix207 (.Y (DEC_CIRCUIT_nx206), .A0 (DEC_IR_Dout_10), .A1 (
           DEC_CIRCUIT_nx227)) ;
    ao32 DEC_CIRCUIT_ix47 (.Y (DEC_ALU_Opr_1), .A0 (DEC_IR_Dout_10), .A1 (
         DEC_IR_Dout_14), .A2 (DEC_IR_Dout_15), .B0 (DEC_IR_Dout_11), .B1 (
         DEC_CIRCUIT_nx227)) ;
    ao32 DEC_CIRCUIT_ix51 (.Y (DEC_ALU_Opr_2), .A0 (DEC_IR_Dout_10), .A1 (
         DEC_IR_Dout_14), .A2 (DEC_IR_Dout_15), .B0 (DEC_IR_Dout_12), .B1 (
         DEC_CIRCUIT_nx227)) ;
    and02 DEC_CIRCUIT_ix11 (.Y (DEC_Imm_Load), .A0 (DEC_IR_Dout_11), .A1 (
          DEC_CIRCUIT_nx192)) ;
    oai21 DEC_CIRCUIT_ix131 (.Y (DEC_Rdst_Load), .A0 (DEC_CIRCUIT_nx212), .A1 (
          DEC_Shift_Load), .B0 (DEC_CIRCUIT_nx196)) ;
    oai21 DEC_CIRCUIT_ix213 (.Y (DEC_CIRCUIT_nx212), .A0 (DEC_IR_Dout_12), .A1 (
          DEC_IR_Dout_13), .B0 (DEC_CIRCUIT_nx227)) ;
    nand02 DEC_CIRCUIT_ix142 (.Y (DEC_Rdst_WB), .A0 (DEC_CIRCUIT_nx215), .A1 (
           DEC_CIRCUIT_nx196)) ;
    aoi22 DEC_CIRCUIT_ix216 (.Y (DEC_CIRCUIT_nx215), .A0 (DEC_IR_Dout_13), .A1 (
          DEC_CIRCUIT_nx176), .B0 (DEC_IR_Dout_12), .B1 (DEC_CIRCUIT_nx227)) ;
    ao221 DEC_CIRCUIT_ix151 (.Y (DEC_Rsrc_Load), .A0 (DEC_IR_Dout_12), .A1 (
          DEC_CIRCUIT_nx176), .B0 (DEC_IR_Dout_11), .B1 (DEC_CIRCUIT_nx218), .C0 (
          DEC_ALU_Opr_3)) ;
    or02 DEC_CIRCUIT_ix169 (.Y (DEC_Rsrc_WB), .A0 (DEC_CIRCUIT_nx166), .A1 (
         DEC_Mem_RD)) ;
    nor04 DEC_CIRCUIT_ix167 (.Y (DEC_CIRCUIT_nx166), .A0 (DEC_IR_Dout_10), .A1 (
          DEC_IR_Dout_11), .A2 (DEC_IR_Dout_12), .A3 (DEC_CIRCUIT_nx212)) ;
    inv01 DEC_CIRCUIT_ix219 (.Y (DEC_CIRCUIT_nx218), .A (DEC_CIRCUIT_nx26)) ;
    nor02ii DEC_CIRCUIT_ix3 (.Y (DEC_Flags_EN), .A0 (DEC_IR_Dout_15), .A1 (
            DEC_IR_Dout_14)) ;
    nor02ii DEC_CIRCUIT_ix97 (.Y (DEC_Mem_EA_Load), .A0 (DEC_IR_Dout_14), .A1 (
            DEC_IR_Dout_15)) ;
    nor02ii DEC_CIRCUIT_ix183 (.Y (DEC_CIRCUIT_nx182), .A0 (Flags_Dout_1), .A1 (
            DEC_IR_Dout_13)) ;
    buf02 DEC_CIRCUIT_ix226 (.Y (DEC_CIRCUIT_nx227), .A (DEC_Flags_EN)) ;
    register_edge_rising_16 REG_FILE_L1_0_Ri (.CLK (EXT_CLK), .RST (HARD_RST), .EN (
                            REG_FILE_Reg_EN_0), .Din ({REG_FILE_Reg_Din_0__15,
                            REG_FILE_Reg_Din_0__14,REG_FILE_Reg_Din_0__13,
                            REG_FILE_Reg_Din_0__12,REG_FILE_Reg_Din_0__11,
                            REG_FILE_Reg_Din_0__10,REG_FILE_Reg_Din_0__9,
                            REG_FILE_Reg_Din_0__8,REG_FILE_Reg_Din_0__7,
                            REG_FILE_Reg_Din_0__6,REG_FILE_Reg_Din_0__5,
                            REG_FILE_Reg_Din_0__4,REG_FILE_Reg_Din_0__3,
                            REG_FILE_Reg_Din_0__2,REG_FILE_Reg_Din_0__1,
                            REG_FILE_Reg_Din_0__0}), .Dout ({
                            REG_FILE_Reg_Dout_0__15,REG_FILE_Reg_Dout_0__14,
                            REG_FILE_Reg_Dout_0__13,REG_FILE_Reg_Dout_0__12,
                            REG_FILE_Reg_Dout_0__11,REG_FILE_Reg_Dout_0__10,
                            REG_FILE_Reg_Dout_0__9,REG_FILE_Reg_Dout_0__8,
                            REG_FILE_Reg_Dout_0__7,REG_FILE_Reg_Dout_0__6,
                            REG_FILE_Reg_Dout_0__5,REG_FILE_Reg_Dout_0__4,
                            REG_FILE_Reg_Dout_0__3,REG_FILE_Reg_Dout_0__2,
                            REG_FILE_Reg_Dout_0__1,REG_FILE_Reg_Dout_0__0})) ;
    register_edge_rising_16 REG_FILE_L1_1_Ri (.CLK (EXT_CLK), .RST (HARD_RST), .EN (
                            REG_FILE_Reg_EN_1), .Din ({REG_FILE_Reg_Din_1__15,
                            REG_FILE_Reg_Din_1__14,REG_FILE_Reg_Din_1__13,
                            REG_FILE_Reg_Din_1__12,REG_FILE_Reg_Din_1__11,
                            REG_FILE_Reg_Din_1__10,REG_FILE_Reg_Din_1__9,
                            REG_FILE_Reg_Din_1__8,REG_FILE_Reg_Din_1__7,
                            REG_FILE_Reg_Din_1__6,REG_FILE_Reg_Din_1__5,
                            REG_FILE_Reg_Din_1__4,REG_FILE_Reg_Din_1__3,
                            REG_FILE_Reg_Din_1__2,REG_FILE_Reg_Din_1__1,
                            REG_FILE_Reg_Din_1__0}), .Dout ({
                            REG_FILE_Reg_Dout_1__15,REG_FILE_Reg_Dout_1__14,
                            REG_FILE_Reg_Dout_1__13,REG_FILE_Reg_Dout_1__12,
                            REG_FILE_Reg_Dout_1__11,REG_FILE_Reg_Dout_1__10,
                            REG_FILE_Reg_Dout_1__9,REG_FILE_Reg_Dout_1__8,
                            REG_FILE_Reg_Dout_1__7,REG_FILE_Reg_Dout_1__6,
                            REG_FILE_Reg_Dout_1__5,REG_FILE_Reg_Dout_1__4,
                            REG_FILE_Reg_Dout_1__3,REG_FILE_Reg_Dout_1__2,
                            REG_FILE_Reg_Dout_1__1,REG_FILE_Reg_Dout_1__0})) ;
    register_edge_rising_16 REG_FILE_L1_2_Ri (.CLK (EXT_CLK), .RST (HARD_RST), .EN (
                            REG_FILE_Reg_EN_2), .Din ({REG_FILE_Reg_Din_2__15,
                            REG_FILE_Reg_Din_2__14,REG_FILE_Reg_Din_2__13,
                            REG_FILE_Reg_Din_2__12,REG_FILE_Reg_Din_2__11,
                            REG_FILE_Reg_Din_2__10,REG_FILE_Reg_Din_2__9,
                            REG_FILE_Reg_Din_2__8,REG_FILE_Reg_Din_2__7,
                            REG_FILE_Reg_Din_2__6,REG_FILE_Reg_Din_2__5,
                            REG_FILE_Reg_Din_2__4,REG_FILE_Reg_Din_2__3,
                            REG_FILE_Reg_Din_2__2,REG_FILE_Reg_Din_2__1,
                            REG_FILE_Reg_Din_2__0}), .Dout ({
                            REG_FILE_Reg_Dout_2__15,REG_FILE_Reg_Dout_2__14,
                            REG_FILE_Reg_Dout_2__13,REG_FILE_Reg_Dout_2__12,
                            REG_FILE_Reg_Dout_2__11,REG_FILE_Reg_Dout_2__10,
                            REG_FILE_Reg_Dout_2__9,REG_FILE_Reg_Dout_2__8,
                            REG_FILE_Reg_Dout_2__7,REG_FILE_Reg_Dout_2__6,
                            REG_FILE_Reg_Dout_2__5,REG_FILE_Reg_Dout_2__4,
                            REG_FILE_Reg_Dout_2__3,REG_FILE_Reg_Dout_2__2,
                            REG_FILE_Reg_Dout_2__1,REG_FILE_Reg_Dout_2__0})) ;
    register_edge_rising_16 REG_FILE_L1_3_Ri (.CLK (EXT_CLK), .RST (HARD_RST), .EN (
                            REG_FILE_Reg_EN_3), .Din ({REG_FILE_Reg_Din_3__15,
                            REG_FILE_Reg_Din_3__14,REG_FILE_Reg_Din_3__13,
                            REG_FILE_Reg_Din_3__12,REG_FILE_Reg_Din_3__11,
                            REG_FILE_Reg_Din_3__10,REG_FILE_Reg_Din_3__9,
                            REG_FILE_Reg_Din_3__8,REG_FILE_Reg_Din_3__7,
                            REG_FILE_Reg_Din_3__6,REG_FILE_Reg_Din_3__5,
                            REG_FILE_Reg_Din_3__4,REG_FILE_Reg_Din_3__3,
                            REG_FILE_Reg_Din_3__2,REG_FILE_Reg_Din_3__1,
                            REG_FILE_Reg_Din_3__0}), .Dout ({
                            REG_FILE_Reg_Dout_3__15,REG_FILE_Reg_Dout_3__14,
                            REG_FILE_Reg_Dout_3__13,REG_FILE_Reg_Dout_3__12,
                            REG_FILE_Reg_Dout_3__11,REG_FILE_Reg_Dout_3__10,
                            REG_FILE_Reg_Dout_3__9,REG_FILE_Reg_Dout_3__8,
                            REG_FILE_Reg_Dout_3__7,REG_FILE_Reg_Dout_3__6,
                            REG_FILE_Reg_Dout_3__5,REG_FILE_Reg_Dout_3__4,
                            REG_FILE_Reg_Dout_3__3,REG_FILE_Reg_Dout_3__2,
                            REG_FILE_Reg_Dout_3__1,REG_FILE_Reg_Dout_3__0})) ;
    register_edge_rising_16 REG_FILE_L1_4_Ri (.CLK (EXT_CLK), .RST (HARD_RST), .EN (
                            REG_FILE_Reg_EN_4), .Din ({REG_FILE_Reg_Din_4__15,
                            REG_FILE_Reg_Din_4__14,REG_FILE_Reg_Din_4__13,
                            REG_FILE_Reg_Din_4__12,REG_FILE_Reg_Din_4__11,
                            REG_FILE_Reg_Din_4__10,REG_FILE_Reg_Din_4__9,
                            REG_FILE_Reg_Din_4__8,REG_FILE_Reg_Din_4__7,
                            REG_FILE_Reg_Din_4__6,REG_FILE_Reg_Din_4__5,
                            REG_FILE_Reg_Din_4__4,REG_FILE_Reg_Din_4__3,
                            REG_FILE_Reg_Din_4__2,REG_FILE_Reg_Din_4__1,
                            REG_FILE_Reg_Din_4__0}), .Dout ({
                            REG_FILE_Reg_Dout_4__15,REG_FILE_Reg_Dout_4__14,
                            REG_FILE_Reg_Dout_4__13,REG_FILE_Reg_Dout_4__12,
                            REG_FILE_Reg_Dout_4__11,REG_FILE_Reg_Dout_4__10,
                            REG_FILE_Reg_Dout_4__9,REG_FILE_Reg_Dout_4__8,
                            REG_FILE_Reg_Dout_4__7,REG_FILE_Reg_Dout_4__6,
                            REG_FILE_Reg_Dout_4__5,REG_FILE_Reg_Dout_4__4,
                            REG_FILE_Reg_Dout_4__3,REG_FILE_Reg_Dout_4__2,
                            REG_FILE_Reg_Dout_4__1,REG_FILE_Reg_Dout_4__0})) ;
    register_edge_rising_16 REG_FILE_L1_5_Ri (.CLK (EXT_CLK), .RST (HARD_RST), .EN (
                            REG_FILE_Reg_EN_5), .Din ({REG_FILE_Reg_Din_5__15,
                            REG_FILE_Reg_Din_5__14,REG_FILE_Reg_Din_5__13,
                            REG_FILE_Reg_Din_5__12,REG_FILE_Reg_Din_5__11,
                            REG_FILE_Reg_Din_5__10,REG_FILE_Reg_Din_5__9,
                            REG_FILE_Reg_Din_5__8,REG_FILE_Reg_Din_5__7,
                            REG_FILE_Reg_Din_5__6,REG_FILE_Reg_Din_5__5,
                            REG_FILE_Reg_Din_5__4,REG_FILE_Reg_Din_5__3,
                            REG_FILE_Reg_Din_5__2,REG_FILE_Reg_Din_5__1,
                            REG_FILE_Reg_Din_5__0}), .Dout ({
                            REG_FILE_Reg_Dout_5__15,REG_FILE_Reg_Dout_5__14,
                            REG_FILE_Reg_Dout_5__13,REG_FILE_Reg_Dout_5__12,
                            REG_FILE_Reg_Dout_5__11,REG_FILE_Reg_Dout_5__10,
                            REG_FILE_Reg_Dout_5__9,REG_FILE_Reg_Dout_5__8,
                            REG_FILE_Reg_Dout_5__7,REG_FILE_Reg_Dout_5__6,
                            REG_FILE_Reg_Dout_5__5,REG_FILE_Reg_Dout_5__4,
                            REG_FILE_Reg_Dout_5__3,REG_FILE_Reg_Dout_5__2,
                            REG_FILE_Reg_Dout_5__1,REG_FILE_Reg_Dout_5__0})) ;
    register_edge_rising_16 REG_FILE_L1_6_Ri (.CLK (EXT_CLK), .RST (HARD_RST), .EN (
                            REG_FILE_Reg_EN_6), .Din ({REG_FILE_Reg_Din_6__15,
                            REG_FILE_Reg_Din_6__14,REG_FILE_Reg_Din_6__13,
                            REG_FILE_Reg_Din_6__12,REG_FILE_Reg_Din_6__11,
                            REG_FILE_Reg_Din_6__10,REG_FILE_Reg_Din_6__9,
                            REG_FILE_Reg_Din_6__8,REG_FILE_Reg_Din_6__7,
                            REG_FILE_Reg_Din_6__6,REG_FILE_Reg_Din_6__5,
                            REG_FILE_Reg_Din_6__4,REG_FILE_Reg_Din_6__3,
                            REG_FILE_Reg_Din_6__2,REG_FILE_Reg_Din_6__1,
                            REG_FILE_Reg_Din_6__0}), .Dout ({
                            REG_FILE_Reg_Dout_6__15,REG_FILE_Reg_Dout_6__14,
                            REG_FILE_Reg_Dout_6__13,REG_FILE_Reg_Dout_6__12,
                            REG_FILE_Reg_Dout_6__11,REG_FILE_Reg_Dout_6__10,
                            REG_FILE_Reg_Dout_6__9,REG_FILE_Reg_Dout_6__8,
                            REG_FILE_Reg_Dout_6__7,REG_FILE_Reg_Dout_6__6,
                            REG_FILE_Reg_Dout_6__5,REG_FILE_Reg_Dout_6__4,
                            REG_FILE_Reg_Dout_6__3,REG_FILE_Reg_Dout_6__2,
                            REG_FILE_Reg_Dout_6__1,REG_FILE_Reg_Dout_6__0})) ;
    register_edge_falling_16 REG_FILE_PC (.CLK (EXT_CLK), .RST (HARD_RST), .EN (
                             NOT_Stall), .Din ({PC_Next_15,PC_Next_15,PC_Next_15
                             ,PC_Next_15,PC_Next_15,PC_Next_15,PC_Next_9,
                             PC_Next_8,PC_Next_7,PC_Next_6,PC_Next_5,PC_Next_4,
                             PC_Next_3,PC_Next_2,PC_Next_1,PC_Next_0}), .Dout ({
                             REG_FILE_PC_Dout_15,REG_FILE_PC_Dout_14,
                             REG_FILE_PC_Dout_13,REG_FILE_PC_Dout_12,
                             REG_FILE_PC_Dout_11,REG_FILE_PC_Dout_10,PC_Cur_9,
                             PC_Cur_8,PC_Cur_7,PC_Cur_6,PC_Cur_5,PC_Cur_4,
                             PC_Cur_3,PC_Cur_2,PC_Cur_1,PC_Cur_0})) ;
    tri_state_buffer_16 REG_FILE_L2_0_TRI_A (.Din ({REG_FILE_Reg_Dout_0__15,
                        REG_FILE_Reg_Dout_0__14,REG_FILE_Reg_Dout_0__13,
                        REG_FILE_Reg_Dout_0__12,REG_FILE_Reg_Dout_0__11,
                        REG_FILE_Reg_Dout_0__10,REG_FILE_Reg_Dout_0__9,
                        REG_FILE_Reg_Dout_0__8,REG_FILE_Reg_Dout_0__7,
                        REG_FILE_Reg_Dout_0__6,REG_FILE_Reg_Dout_0__5,
                        REG_FILE_Reg_Dout_0__4,REG_FILE_Reg_Dout_0__3,
                        REG_FILE_Reg_Dout_0__2,REG_FILE_Reg_Dout_0__1,
                        REG_FILE_Reg_Dout_0__0}), .S (REG_FILE_Reg_A_out_0), .Dout (
                        {DEC_Rdst_Dout_15,DEC_Rdst_Dout_14,DEC_Rdst_Dout_13,
                        DEC_Rdst_Dout_12,DEC_Rdst_Dout_11,DEC_Rdst_Dout_10,
                        DEC_Rdst_Dout_9,DEC_Rdst_Dout_8,DEC_Rdst_Dout_7,
                        DEC_Rdst_Dout_6,DEC_Rdst_Dout_5,DEC_Rdst_Dout_4,
                        DEC_Rdst_Dout_3,DEC_Rdst_Dout_2,DEC_Rdst_Dout_1,
                        DEC_Rdst_Dout_0})) ;
    tri_state_buffer_16 REG_FILE_L2_0_TRI_B (.Din ({REG_FILE_Reg_Dout_0__15,
                        REG_FILE_Reg_Dout_0__14,REG_FILE_Reg_Dout_0__13,
                        REG_FILE_Reg_Dout_0__12,REG_FILE_Reg_Dout_0__11,
                        REG_FILE_Reg_Dout_0__10,REG_FILE_Reg_Dout_0__9,
                        REG_FILE_Reg_Dout_0__8,REG_FILE_Reg_Dout_0__7,
                        REG_FILE_Reg_Dout_0__6,REG_FILE_Reg_Dout_0__5,
                        REG_FILE_Reg_Dout_0__4,REG_FILE_Reg_Dout_0__3,
                        REG_FILE_Reg_Dout_0__2,REG_FILE_Reg_Dout_0__1,
                        REG_FILE_Reg_Dout_0__0}), .S (REG_FILE_Reg_B_out_0), .Dout (
                        {DEC_Rsrc_Dout_15,DEC_Rsrc_Dout_14,DEC_Rsrc_Dout_13,
                        DEC_Rsrc_Dout_12,DEC_Rsrc_Dout_11,DEC_Rsrc_Dout_10,
                        DEC_Rsrc_Dout_9,DEC_Rsrc_Dout_8,DEC_Rsrc_Dout_7,
                        DEC_Rsrc_Dout_6,DEC_Rsrc_Dout_5,DEC_Rsrc_Dout_4,
                        DEC_Rsrc_Dout_3,DEC_Rsrc_Dout_2,DEC_Rsrc_Dout_1,
                        DEC_Rsrc_Dout_0})) ;
    tri_state_buffer_16 REG_FILE_L2_1_TRI_A (.Din ({REG_FILE_Reg_Dout_1__15,
                        REG_FILE_Reg_Dout_1__14,REG_FILE_Reg_Dout_1__13,
                        REG_FILE_Reg_Dout_1__12,REG_FILE_Reg_Dout_1__11,
                        REG_FILE_Reg_Dout_1__10,REG_FILE_Reg_Dout_1__9,
                        REG_FILE_Reg_Dout_1__8,REG_FILE_Reg_Dout_1__7,
                        REG_FILE_Reg_Dout_1__6,REG_FILE_Reg_Dout_1__5,
                        REG_FILE_Reg_Dout_1__4,REG_FILE_Reg_Dout_1__3,
                        REG_FILE_Reg_Dout_1__2,REG_FILE_Reg_Dout_1__1,
                        REG_FILE_Reg_Dout_1__0}), .S (REG_FILE_Reg_A_out_1), .Dout (
                        {DEC_Rdst_Dout_15,DEC_Rdst_Dout_14,DEC_Rdst_Dout_13,
                        DEC_Rdst_Dout_12,DEC_Rdst_Dout_11,DEC_Rdst_Dout_10,
                        DEC_Rdst_Dout_9,DEC_Rdst_Dout_8,DEC_Rdst_Dout_7,
                        DEC_Rdst_Dout_6,DEC_Rdst_Dout_5,DEC_Rdst_Dout_4,
                        DEC_Rdst_Dout_3,DEC_Rdst_Dout_2,DEC_Rdst_Dout_1,
                        DEC_Rdst_Dout_0})) ;
    tri_state_buffer_16 REG_FILE_L2_1_TRI_B (.Din ({REG_FILE_Reg_Dout_1__15,
                        REG_FILE_Reg_Dout_1__14,REG_FILE_Reg_Dout_1__13,
                        REG_FILE_Reg_Dout_1__12,REG_FILE_Reg_Dout_1__11,
                        REG_FILE_Reg_Dout_1__10,REG_FILE_Reg_Dout_1__9,
                        REG_FILE_Reg_Dout_1__8,REG_FILE_Reg_Dout_1__7,
                        REG_FILE_Reg_Dout_1__6,REG_FILE_Reg_Dout_1__5,
                        REG_FILE_Reg_Dout_1__4,REG_FILE_Reg_Dout_1__3,
                        REG_FILE_Reg_Dout_1__2,REG_FILE_Reg_Dout_1__1,
                        REG_FILE_Reg_Dout_1__0}), .S (REG_FILE_Reg_B_out_1), .Dout (
                        {DEC_Rsrc_Dout_15,DEC_Rsrc_Dout_14,DEC_Rsrc_Dout_13,
                        DEC_Rsrc_Dout_12,DEC_Rsrc_Dout_11,DEC_Rsrc_Dout_10,
                        DEC_Rsrc_Dout_9,DEC_Rsrc_Dout_8,DEC_Rsrc_Dout_7,
                        DEC_Rsrc_Dout_6,DEC_Rsrc_Dout_5,DEC_Rsrc_Dout_4,
                        DEC_Rsrc_Dout_3,DEC_Rsrc_Dout_2,DEC_Rsrc_Dout_1,
                        DEC_Rsrc_Dout_0})) ;
    tri_state_buffer_16 REG_FILE_L2_2_TRI_A (.Din ({REG_FILE_Reg_Dout_2__15,
                        REG_FILE_Reg_Dout_2__14,REG_FILE_Reg_Dout_2__13,
                        REG_FILE_Reg_Dout_2__12,REG_FILE_Reg_Dout_2__11,
                        REG_FILE_Reg_Dout_2__10,REG_FILE_Reg_Dout_2__9,
                        REG_FILE_Reg_Dout_2__8,REG_FILE_Reg_Dout_2__7,
                        REG_FILE_Reg_Dout_2__6,REG_FILE_Reg_Dout_2__5,
                        REG_FILE_Reg_Dout_2__4,REG_FILE_Reg_Dout_2__3,
                        REG_FILE_Reg_Dout_2__2,REG_FILE_Reg_Dout_2__1,
                        REG_FILE_Reg_Dout_2__0}), .S (REG_FILE_Reg_A_out_2), .Dout (
                        {DEC_Rdst_Dout_15,DEC_Rdst_Dout_14,DEC_Rdst_Dout_13,
                        DEC_Rdst_Dout_12,DEC_Rdst_Dout_11,DEC_Rdst_Dout_10,
                        DEC_Rdst_Dout_9,DEC_Rdst_Dout_8,DEC_Rdst_Dout_7,
                        DEC_Rdst_Dout_6,DEC_Rdst_Dout_5,DEC_Rdst_Dout_4,
                        DEC_Rdst_Dout_3,DEC_Rdst_Dout_2,DEC_Rdst_Dout_1,
                        DEC_Rdst_Dout_0})) ;
    tri_state_buffer_16 REG_FILE_L2_2_TRI_B (.Din ({REG_FILE_Reg_Dout_2__15,
                        REG_FILE_Reg_Dout_2__14,REG_FILE_Reg_Dout_2__13,
                        REG_FILE_Reg_Dout_2__12,REG_FILE_Reg_Dout_2__11,
                        REG_FILE_Reg_Dout_2__10,REG_FILE_Reg_Dout_2__9,
                        REG_FILE_Reg_Dout_2__8,REG_FILE_Reg_Dout_2__7,
                        REG_FILE_Reg_Dout_2__6,REG_FILE_Reg_Dout_2__5,
                        REG_FILE_Reg_Dout_2__4,REG_FILE_Reg_Dout_2__3,
                        REG_FILE_Reg_Dout_2__2,REG_FILE_Reg_Dout_2__1,
                        REG_FILE_Reg_Dout_2__0}), .S (REG_FILE_Reg_B_out_2), .Dout (
                        {DEC_Rsrc_Dout_15,DEC_Rsrc_Dout_14,DEC_Rsrc_Dout_13,
                        DEC_Rsrc_Dout_12,DEC_Rsrc_Dout_11,DEC_Rsrc_Dout_10,
                        DEC_Rsrc_Dout_9,DEC_Rsrc_Dout_8,DEC_Rsrc_Dout_7,
                        DEC_Rsrc_Dout_6,DEC_Rsrc_Dout_5,DEC_Rsrc_Dout_4,
                        DEC_Rsrc_Dout_3,DEC_Rsrc_Dout_2,DEC_Rsrc_Dout_1,
                        DEC_Rsrc_Dout_0})) ;
    tri_state_buffer_16 REG_FILE_L2_3_TRI_A (.Din ({REG_FILE_Reg_Dout_3__15,
                        REG_FILE_Reg_Dout_3__14,REG_FILE_Reg_Dout_3__13,
                        REG_FILE_Reg_Dout_3__12,REG_FILE_Reg_Dout_3__11,
                        REG_FILE_Reg_Dout_3__10,REG_FILE_Reg_Dout_3__9,
                        REG_FILE_Reg_Dout_3__8,REG_FILE_Reg_Dout_3__7,
                        REG_FILE_Reg_Dout_3__6,REG_FILE_Reg_Dout_3__5,
                        REG_FILE_Reg_Dout_3__4,REG_FILE_Reg_Dout_3__3,
                        REG_FILE_Reg_Dout_3__2,REG_FILE_Reg_Dout_3__1,
                        REG_FILE_Reg_Dout_3__0}), .S (REG_FILE_Reg_A_out_3), .Dout (
                        {DEC_Rdst_Dout_15,DEC_Rdst_Dout_14,DEC_Rdst_Dout_13,
                        DEC_Rdst_Dout_12,DEC_Rdst_Dout_11,DEC_Rdst_Dout_10,
                        DEC_Rdst_Dout_9,DEC_Rdst_Dout_8,DEC_Rdst_Dout_7,
                        DEC_Rdst_Dout_6,DEC_Rdst_Dout_5,DEC_Rdst_Dout_4,
                        DEC_Rdst_Dout_3,DEC_Rdst_Dout_2,DEC_Rdst_Dout_1,
                        DEC_Rdst_Dout_0})) ;
    tri_state_buffer_16 REG_FILE_L2_3_TRI_B (.Din ({REG_FILE_Reg_Dout_3__15,
                        REG_FILE_Reg_Dout_3__14,REG_FILE_Reg_Dout_3__13,
                        REG_FILE_Reg_Dout_3__12,REG_FILE_Reg_Dout_3__11,
                        REG_FILE_Reg_Dout_3__10,REG_FILE_Reg_Dout_3__9,
                        REG_FILE_Reg_Dout_3__8,REG_FILE_Reg_Dout_3__7,
                        REG_FILE_Reg_Dout_3__6,REG_FILE_Reg_Dout_3__5,
                        REG_FILE_Reg_Dout_3__4,REG_FILE_Reg_Dout_3__3,
                        REG_FILE_Reg_Dout_3__2,REG_FILE_Reg_Dout_3__1,
                        REG_FILE_Reg_Dout_3__0}), .S (REG_FILE_Reg_B_out_3), .Dout (
                        {DEC_Rsrc_Dout_15,DEC_Rsrc_Dout_14,DEC_Rsrc_Dout_13,
                        DEC_Rsrc_Dout_12,DEC_Rsrc_Dout_11,DEC_Rsrc_Dout_10,
                        DEC_Rsrc_Dout_9,DEC_Rsrc_Dout_8,DEC_Rsrc_Dout_7,
                        DEC_Rsrc_Dout_6,DEC_Rsrc_Dout_5,DEC_Rsrc_Dout_4,
                        DEC_Rsrc_Dout_3,DEC_Rsrc_Dout_2,DEC_Rsrc_Dout_1,
                        DEC_Rsrc_Dout_0})) ;
    tri_state_buffer_16 REG_FILE_L2_4_TRI_A (.Din ({REG_FILE_Reg_Dout_4__15,
                        REG_FILE_Reg_Dout_4__14,REG_FILE_Reg_Dout_4__13,
                        REG_FILE_Reg_Dout_4__12,REG_FILE_Reg_Dout_4__11,
                        REG_FILE_Reg_Dout_4__10,REG_FILE_Reg_Dout_4__9,
                        REG_FILE_Reg_Dout_4__8,REG_FILE_Reg_Dout_4__7,
                        REG_FILE_Reg_Dout_4__6,REG_FILE_Reg_Dout_4__5,
                        REG_FILE_Reg_Dout_4__4,REG_FILE_Reg_Dout_4__3,
                        REG_FILE_Reg_Dout_4__2,REG_FILE_Reg_Dout_4__1,
                        REG_FILE_Reg_Dout_4__0}), .S (REG_FILE_Reg_A_out_4), .Dout (
                        {DEC_Rdst_Dout_15,DEC_Rdst_Dout_14,DEC_Rdst_Dout_13,
                        DEC_Rdst_Dout_12,DEC_Rdst_Dout_11,DEC_Rdst_Dout_10,
                        DEC_Rdst_Dout_9,DEC_Rdst_Dout_8,DEC_Rdst_Dout_7,
                        DEC_Rdst_Dout_6,DEC_Rdst_Dout_5,DEC_Rdst_Dout_4,
                        DEC_Rdst_Dout_3,DEC_Rdst_Dout_2,DEC_Rdst_Dout_1,
                        DEC_Rdst_Dout_0})) ;
    tri_state_buffer_16 REG_FILE_L2_4_TRI_B (.Din ({REG_FILE_Reg_Dout_4__15,
                        REG_FILE_Reg_Dout_4__14,REG_FILE_Reg_Dout_4__13,
                        REG_FILE_Reg_Dout_4__12,REG_FILE_Reg_Dout_4__11,
                        REG_FILE_Reg_Dout_4__10,REG_FILE_Reg_Dout_4__9,
                        REG_FILE_Reg_Dout_4__8,REG_FILE_Reg_Dout_4__7,
                        REG_FILE_Reg_Dout_4__6,REG_FILE_Reg_Dout_4__5,
                        REG_FILE_Reg_Dout_4__4,REG_FILE_Reg_Dout_4__3,
                        REG_FILE_Reg_Dout_4__2,REG_FILE_Reg_Dout_4__1,
                        REG_FILE_Reg_Dout_4__0}), .S (REG_FILE_Reg_B_out_4), .Dout (
                        {DEC_Rsrc_Dout_15,DEC_Rsrc_Dout_14,DEC_Rsrc_Dout_13,
                        DEC_Rsrc_Dout_12,DEC_Rsrc_Dout_11,DEC_Rsrc_Dout_10,
                        DEC_Rsrc_Dout_9,DEC_Rsrc_Dout_8,DEC_Rsrc_Dout_7,
                        DEC_Rsrc_Dout_6,DEC_Rsrc_Dout_5,DEC_Rsrc_Dout_4,
                        DEC_Rsrc_Dout_3,DEC_Rsrc_Dout_2,DEC_Rsrc_Dout_1,
                        DEC_Rsrc_Dout_0})) ;
    tri_state_buffer_16 REG_FILE_L2_5_TRI_A (.Din ({REG_FILE_Reg_Dout_5__15,
                        REG_FILE_Reg_Dout_5__14,REG_FILE_Reg_Dout_5__13,
                        REG_FILE_Reg_Dout_5__12,REG_FILE_Reg_Dout_5__11,
                        REG_FILE_Reg_Dout_5__10,REG_FILE_Reg_Dout_5__9,
                        REG_FILE_Reg_Dout_5__8,REG_FILE_Reg_Dout_5__7,
                        REG_FILE_Reg_Dout_5__6,REG_FILE_Reg_Dout_5__5,
                        REG_FILE_Reg_Dout_5__4,REG_FILE_Reg_Dout_5__3,
                        REG_FILE_Reg_Dout_5__2,REG_FILE_Reg_Dout_5__1,
                        REG_FILE_Reg_Dout_5__0}), .S (REG_FILE_Reg_A_out_5), .Dout (
                        {DEC_Rdst_Dout_15,DEC_Rdst_Dout_14,DEC_Rdst_Dout_13,
                        DEC_Rdst_Dout_12,DEC_Rdst_Dout_11,DEC_Rdst_Dout_10,
                        DEC_Rdst_Dout_9,DEC_Rdst_Dout_8,DEC_Rdst_Dout_7,
                        DEC_Rdst_Dout_6,DEC_Rdst_Dout_5,DEC_Rdst_Dout_4,
                        DEC_Rdst_Dout_3,DEC_Rdst_Dout_2,DEC_Rdst_Dout_1,
                        DEC_Rdst_Dout_0})) ;
    tri_state_buffer_16 REG_FILE_L2_5_TRI_B (.Din ({REG_FILE_Reg_Dout_5__15,
                        REG_FILE_Reg_Dout_5__14,REG_FILE_Reg_Dout_5__13,
                        REG_FILE_Reg_Dout_5__12,REG_FILE_Reg_Dout_5__11,
                        REG_FILE_Reg_Dout_5__10,REG_FILE_Reg_Dout_5__9,
                        REG_FILE_Reg_Dout_5__8,REG_FILE_Reg_Dout_5__7,
                        REG_FILE_Reg_Dout_5__6,REG_FILE_Reg_Dout_5__5,
                        REG_FILE_Reg_Dout_5__4,REG_FILE_Reg_Dout_5__3,
                        REG_FILE_Reg_Dout_5__2,REG_FILE_Reg_Dout_5__1,
                        REG_FILE_Reg_Dout_5__0}), .S (REG_FILE_Reg_B_out_5), .Dout (
                        {DEC_Rsrc_Dout_15,DEC_Rsrc_Dout_14,DEC_Rsrc_Dout_13,
                        DEC_Rsrc_Dout_12,DEC_Rsrc_Dout_11,DEC_Rsrc_Dout_10,
                        DEC_Rsrc_Dout_9,DEC_Rsrc_Dout_8,DEC_Rsrc_Dout_7,
                        DEC_Rsrc_Dout_6,DEC_Rsrc_Dout_5,DEC_Rsrc_Dout_4,
                        DEC_Rsrc_Dout_3,DEC_Rsrc_Dout_2,DEC_Rsrc_Dout_1,
                        DEC_Rsrc_Dout_0})) ;
    tri_state_buffer_16 REG_FILE_L2_6_TRI_A (.Din ({REG_FILE_Reg_Dout_6__15,
                        REG_FILE_Reg_Dout_6__14,REG_FILE_Reg_Dout_6__13,
                        REG_FILE_Reg_Dout_6__12,REG_FILE_Reg_Dout_6__11,
                        REG_FILE_Reg_Dout_6__10,REG_FILE_Reg_Dout_6__9,
                        REG_FILE_Reg_Dout_6__8,REG_FILE_Reg_Dout_6__7,
                        REG_FILE_Reg_Dout_6__6,REG_FILE_Reg_Dout_6__5,
                        REG_FILE_Reg_Dout_6__4,REG_FILE_Reg_Dout_6__3,
                        REG_FILE_Reg_Dout_6__2,REG_FILE_Reg_Dout_6__1,
                        REG_FILE_Reg_Dout_6__0}), .S (REG_FILE_Reg_A_out_6), .Dout (
                        {DEC_Rdst_Dout_15,DEC_Rdst_Dout_14,DEC_Rdst_Dout_13,
                        DEC_Rdst_Dout_12,DEC_Rdst_Dout_11,DEC_Rdst_Dout_10,
                        DEC_Rdst_Dout_9,DEC_Rdst_Dout_8,DEC_Rdst_Dout_7,
                        DEC_Rdst_Dout_6,DEC_Rdst_Dout_5,DEC_Rdst_Dout_4,
                        DEC_Rdst_Dout_3,DEC_Rdst_Dout_2,DEC_Rdst_Dout_1,
                        DEC_Rdst_Dout_0})) ;
    tri_state_buffer_16 REG_FILE_L2_6_TRI_B (.Din ({REG_FILE_Reg_Dout_6__15,
                        REG_FILE_Reg_Dout_6__14,REG_FILE_Reg_Dout_6__13,
                        REG_FILE_Reg_Dout_6__12,REG_FILE_Reg_Dout_6__11,
                        REG_FILE_Reg_Dout_6__10,REG_FILE_Reg_Dout_6__9,
                        REG_FILE_Reg_Dout_6__8,REG_FILE_Reg_Dout_6__7,
                        REG_FILE_Reg_Dout_6__6,REG_FILE_Reg_Dout_6__5,
                        REG_FILE_Reg_Dout_6__4,REG_FILE_Reg_Dout_6__3,
                        REG_FILE_Reg_Dout_6__2,REG_FILE_Reg_Dout_6__1,
                        REG_FILE_Reg_Dout_6__0}), .S (REG_FILE_Reg_B_out_6), .Dout (
                        {DEC_Rsrc_Dout_15,DEC_Rsrc_Dout_14,DEC_Rsrc_Dout_13,
                        DEC_Rsrc_Dout_12,DEC_Rsrc_Dout_11,DEC_Rsrc_Dout_10,
                        DEC_Rsrc_Dout_9,DEC_Rsrc_Dout_8,DEC_Rsrc_Dout_7,
                        DEC_Rsrc_Dout_6,DEC_Rsrc_Dout_5,DEC_Rsrc_Dout_4,
                        DEC_Rsrc_Dout_3,DEC_Rsrc_Dout_2,DEC_Rsrc_Dout_1,
                        DEC_Rsrc_Dout_0})) ;
    tri_state_buffer_16 REG_FILE_L2_7_TRI_A (.Din ({REG_FILE_PC_Dout_15,
                        REG_FILE_PC_Dout_14,REG_FILE_PC_Dout_13,
                        REG_FILE_PC_Dout_12,REG_FILE_PC_Dout_11,
                        REG_FILE_PC_Dout_10,PC_Cur_9,PC_Cur_8,PC_Cur_7,PC_Cur_6,
                        PC_Cur_5,PC_Cur_4,PC_Cur_3,PC_Cur_2,PC_Cur_1,PC_Cur_0})
                        , .S (REG_FILE_Reg_A_out_7), .Dout ({DEC_Rdst_Dout_15,
                        DEC_Rdst_Dout_14,DEC_Rdst_Dout_13,DEC_Rdst_Dout_12,
                        DEC_Rdst_Dout_11,DEC_Rdst_Dout_10,DEC_Rdst_Dout_9,
                        DEC_Rdst_Dout_8,DEC_Rdst_Dout_7,DEC_Rdst_Dout_6,
                        DEC_Rdst_Dout_5,DEC_Rdst_Dout_4,DEC_Rdst_Dout_3,
                        DEC_Rdst_Dout_2,DEC_Rdst_Dout_1,DEC_Rdst_Dout_0})) ;
    tri_state_buffer_16 REG_FILE_L2_7_TRI_B (.Din ({REG_FILE_PC_Dout_15,
                        REG_FILE_PC_Dout_14,REG_FILE_PC_Dout_13,
                        REG_FILE_PC_Dout_12,REG_FILE_PC_Dout_11,
                        REG_FILE_PC_Dout_10,PC_Cur_9,PC_Cur_8,PC_Cur_7,PC_Cur_6,
                        PC_Cur_5,PC_Cur_4,PC_Cur_3,PC_Cur_2,PC_Cur_1,PC_Cur_0})
                        , .S (REG_FILE_Reg_B_out_7), .Dout ({DEC_Rsrc_Dout_15,
                        DEC_Rsrc_Dout_14,DEC_Rsrc_Dout_13,DEC_Rsrc_Dout_12,
                        DEC_Rsrc_Dout_11,DEC_Rsrc_Dout_10,DEC_Rsrc_Dout_9,
                        DEC_Rsrc_Dout_8,DEC_Rsrc_Dout_7,DEC_Rsrc_Dout_6,
                        DEC_Rsrc_Dout_5,DEC_Rsrc_Dout_4,DEC_Rsrc_Dout_3,
                        DEC_Rsrc_Dout_2,DEC_Rsrc_Dout_1,DEC_Rsrc_Dout_0})) ;
    inv01 REG_FILE_DEC_A_IN_ix185 (.Y (REG_FILE_DEC_A_IN_nx184), .A (WRB_Dst_16)
          ) ;
    inv01 REG_FILE_DEC_A_IN_ix188 (.Y (REG_FILE_DEC_A_IN_nx187), .A (WRB_Dst_17)
          ) ;
    and03 REG_FILE_DEC_A_IN_ix27 (.Y (REG_FILE_Reg_A_in_3), .A0 (
          REG_FILE_DEC_A_IN_nx2), .A1 (WRB_Dst_17), .A2 (WRB_Dst_16)) ;
    nor02ii REG_FILE_DEC_A_IN_ix3 (.Y (REG_FILE_DEC_A_IN_nx2), .A0 (WRB_Dst_18)
            , .A1 (WRB_Dst_19)) ;
    nor03_2x REG_FILE_DEC_A_IN_ix37 (.Y (REG_FILE_Reg_A_in_4), .A0 (
             REG_FILE_DEC_A_IN_nx192), .A1 (WRB_Dst_17), .A2 (WRB_Dst_16)) ;
    nand02 REG_FILE_DEC_A_IN_ix193 (.Y (REG_FILE_DEC_A_IN_nx192), .A0 (
           WRB_Dst_18), .A1 (WRB_Dst_19)) ;
    inv01 REG_FILE_DEC_A_IN_ix180 (.Y (REG_FILE_DEC_A_IN_nx179), .A (
          REG_FILE_DEC_A_IN_nx2)) ;
    nor03_2x REG_FILE_DEC_B_IN_ix11 (.Y (REG_FILE_Reg_B_in_0), .A0 (
             REG_FILE_DEC_B_IN_nx179), .A1 (WRB_Src_17), .A2 (WRB_Src_16)) ;
    nor03_2x REG_FILE_DEC_B_IN_ix17 (.Y (REG_FILE_Reg_B_in_1), .A0 (
             REG_FILE_DEC_B_IN_nx179), .A1 (WRB_Src_17), .A2 (
             REG_FILE_DEC_B_IN_nx184)) ;
    inv01 REG_FILE_DEC_B_IN_ix185 (.Y (REG_FILE_DEC_B_IN_nx184), .A (WRB_Src_16)
          ) ;
    nor03_2x REG_FILE_DEC_B_IN_ix23 (.Y (REG_FILE_Reg_B_in_2), .A0 (
             REG_FILE_DEC_B_IN_nx179), .A1 (REG_FILE_DEC_B_IN_nx187), .A2 (
             WRB_Src_16)) ;
    inv01 REG_FILE_DEC_B_IN_ix188 (.Y (REG_FILE_DEC_B_IN_nx187), .A (WRB_Src_17)
          ) ;
    and03 REG_FILE_DEC_B_IN_ix27 (.Y (REG_FILE_Reg_B_in_3), .A0 (
          REG_FILE_DEC_B_IN_nx2), .A1 (WRB_Src_17), .A2 (WRB_Src_16)) ;
    nor02ii REG_FILE_DEC_B_IN_ix3 (.Y (REG_FILE_DEC_B_IN_nx2), .A0 (WRB_Src_18)
            , .A1 (WRB_Src_19)) ;
    nor03_2x REG_FILE_DEC_B_IN_ix37 (.Y (REG_FILE_Reg_B_in_4), .A0 (
             REG_FILE_DEC_B_IN_nx192), .A1 (WRB_Src_17), .A2 (WRB_Src_16)) ;
    nand02 REG_FILE_DEC_B_IN_ix193 (.Y (REG_FILE_DEC_B_IN_nx192), .A0 (
           WRB_Src_18), .A1 (WRB_Src_19)) ;
    nor03_2x REG_FILE_DEC_B_IN_ix43 (.Y (REG_FILE_Reg_B_in_5), .A0 (
             REG_FILE_DEC_B_IN_nx192), .A1 (WRB_Src_17), .A2 (
             REG_FILE_DEC_B_IN_nx184)) ;
    nor03_2x REG_FILE_DEC_B_IN_ix49 (.Y (REG_FILE_Reg_B_in_6), .A0 (
             REG_FILE_DEC_B_IN_nx192), .A1 (REG_FILE_DEC_B_IN_nx187), .A2 (
             WRB_Src_16)) ;
    inv01 REG_FILE_DEC_B_IN_ix180 (.Y (REG_FILE_DEC_B_IN_nx179), .A (
          REG_FILE_DEC_B_IN_nx2)) ;
    nor03_2x REG_FILE_DEC_A_OUT_ix11 (.Y (REG_FILE_Reg_A_out_0), .A0 (
             REG_FILE_DEC_A_OUT_nx179), .A1 (DEC_IR_Dout_4), .A2 (DEC_IR_Dout_3)
             ) ;
    nor03_2x REG_FILE_DEC_A_OUT_ix17 (.Y (REG_FILE_Reg_A_out_1), .A0 (
             REG_FILE_DEC_A_OUT_nx179), .A1 (DEC_IR_Dout_4), .A2 (
             REG_FILE_DEC_A_OUT_nx184)) ;
    inv01 REG_FILE_DEC_A_OUT_ix185 (.Y (REG_FILE_DEC_A_OUT_nx184), .A (
          DEC_IR_Dout_3)) ;
    nor03_2x REG_FILE_DEC_A_OUT_ix23 (.Y (REG_FILE_Reg_A_out_2), .A0 (
             REG_FILE_DEC_A_OUT_nx179), .A1 (REG_FILE_DEC_A_OUT_nx187), .A2 (
             DEC_IR_Dout_3)) ;
    inv01 REG_FILE_DEC_A_OUT_ix188 (.Y (REG_FILE_DEC_A_OUT_nx187), .A (
          DEC_IR_Dout_4)) ;
    and03 REG_FILE_DEC_A_OUT_ix27 (.Y (REG_FILE_Reg_A_out_3), .A0 (
          REG_FILE_DEC_A_OUT_nx2), .A1 (DEC_IR_Dout_4), .A2 (DEC_IR_Dout_3)) ;
    nor02ii REG_FILE_DEC_A_OUT_ix3 (.Y (REG_FILE_DEC_A_OUT_nx2), .A0 (
            DEC_IR_Dout_5), .A1 (REG_FILE_PWR)) ;
    nor03_2x REG_FILE_DEC_A_OUT_ix37 (.Y (REG_FILE_Reg_A_out_4), .A0 (
             REG_FILE_DEC_A_OUT_nx192), .A1 (DEC_IR_Dout_4), .A2 (DEC_IR_Dout_3)
             ) ;
    nand02 REG_FILE_DEC_A_OUT_ix193 (.Y (REG_FILE_DEC_A_OUT_nx192), .A0 (
           DEC_IR_Dout_5), .A1 (REG_FILE_PWR)) ;
    nor03_2x REG_FILE_DEC_A_OUT_ix43 (.Y (REG_FILE_Reg_A_out_5), .A0 (
             REG_FILE_DEC_A_OUT_nx192), .A1 (DEC_IR_Dout_4), .A2 (
             REG_FILE_DEC_A_OUT_nx184)) ;
    nor03_2x REG_FILE_DEC_A_OUT_ix49 (.Y (REG_FILE_Reg_A_out_6), .A0 (
             REG_FILE_DEC_A_OUT_nx192), .A1 (REG_FILE_DEC_A_OUT_nx187), .A2 (
             DEC_IR_Dout_3)) ;
    nor03_2x REG_FILE_DEC_A_OUT_ix53 (.Y (REG_FILE_Reg_A_out_7), .A0 (
             REG_FILE_DEC_A_OUT_nx192), .A1 (REG_FILE_DEC_A_OUT_nx187), .A2 (
             REG_FILE_DEC_A_OUT_nx184)) ;
    inv01 REG_FILE_DEC_A_OUT_ix180 (.Y (REG_FILE_DEC_A_OUT_nx179), .A (
          REG_FILE_DEC_A_OUT_nx2)) ;
    nor03_2x REG_FILE_DEC_B_OUT_ix11 (.Y (REG_FILE_Reg_B_out_0), .A0 (
             REG_FILE_DEC_B_OUT_nx179), .A1 (DEC_IR_Dout_1), .A2 (DEC_IR_Dout_0)
             ) ;
    nor03_2x REG_FILE_DEC_B_OUT_ix17 (.Y (REG_FILE_Reg_B_out_1), .A0 (
             REG_FILE_DEC_B_OUT_nx179), .A1 (DEC_IR_Dout_1), .A2 (
             REG_FILE_DEC_B_OUT_nx184)) ;
    inv01 REG_FILE_DEC_B_OUT_ix185 (.Y (REG_FILE_DEC_B_OUT_nx184), .A (
          DEC_IR_Dout_0)) ;
    nor03_2x REG_FILE_DEC_B_OUT_ix23 (.Y (REG_FILE_Reg_B_out_2), .A0 (
             REG_FILE_DEC_B_OUT_nx179), .A1 (REG_FILE_DEC_B_OUT_nx187), .A2 (
             DEC_IR_Dout_0)) ;
    inv01 REG_FILE_DEC_B_OUT_ix188 (.Y (REG_FILE_DEC_B_OUT_nx187), .A (
          DEC_IR_Dout_1)) ;
    and03 REG_FILE_DEC_B_OUT_ix27 (.Y (REG_FILE_Reg_B_out_3), .A0 (
          REG_FILE_DEC_B_OUT_nx2), .A1 (DEC_IR_Dout_1), .A2 (DEC_IR_Dout_0)) ;
    nor02ii REG_FILE_DEC_B_OUT_ix3 (.Y (REG_FILE_DEC_B_OUT_nx2), .A0 (
            DEC_IR_Dout_2), .A1 (REG_FILE_PWR)) ;
    nor03_2x REG_FILE_DEC_B_OUT_ix37 (.Y (REG_FILE_Reg_B_out_4), .A0 (
             REG_FILE_DEC_B_OUT_nx192), .A1 (DEC_IR_Dout_1), .A2 (DEC_IR_Dout_0)
             ) ;
    nand02 REG_FILE_DEC_B_OUT_ix193 (.Y (REG_FILE_DEC_B_OUT_nx192), .A0 (
           DEC_IR_Dout_2), .A1 (REG_FILE_PWR)) ;
    nor03_2x REG_FILE_DEC_B_OUT_ix43 (.Y (REG_FILE_Reg_B_out_5), .A0 (
             REG_FILE_DEC_B_OUT_nx192), .A1 (DEC_IR_Dout_1), .A2 (
             REG_FILE_DEC_B_OUT_nx184)) ;
    nor03_2x REG_FILE_DEC_B_OUT_ix49 (.Y (REG_FILE_Reg_B_out_6), .A0 (
             REG_FILE_DEC_B_OUT_nx192), .A1 (REG_FILE_DEC_B_OUT_nx187), .A2 (
             DEC_IR_Dout_0)) ;
    nor03_2x REG_FILE_DEC_B_OUT_ix53 (.Y (REG_FILE_Reg_B_out_7), .A0 (
             REG_FILE_DEC_B_OUT_nx192), .A1 (REG_FILE_DEC_B_OUT_nx187), .A2 (
             REG_FILE_DEC_B_OUT_nx184)) ;
    inv01 REG_FILE_DEC_B_OUT_ix180 (.Y (REG_FILE_DEC_B_OUT_nx179), .A (
          REG_FILE_DEC_B_OUT_nx2)) ;
    fake_vcc REG_FILE_ix1137 (.Y (REG_FILE_PWR)) ;
    or02 REG_FILE_ix897 (.Y (REG_FILE_Reg_EN_0), .A0 (nx1324), .A1 (
         REG_FILE_Reg_B_in_0)) ;
    or02 REG_FILE_ix899 (.Y (REG_FILE_Reg_EN_1), .A0 (nx1316), .A1 (
         REG_FILE_Reg_B_in_1)) ;
    or02 REG_FILE_ix901 (.Y (REG_FILE_Reg_EN_2), .A0 (nx1308), .A1 (
         REG_FILE_Reg_B_in_2)) ;
    or02 REG_FILE_ix907 (.Y (REG_FILE_Reg_EN_5), .A0 (nx1300), .A1 (
         REG_FILE_Reg_B_in_5)) ;
    or02 REG_FILE_ix909 (.Y (REG_FILE_Reg_EN_6), .A0 (nx1292), .A1 (
         REG_FILE_Reg_B_in_6)) ;
    inv02 REG_FILE_ix1385 (.Y (REG_FILE_nx1386), .A (REG_FILE_Reg_A_in_4)) ;
    inv02 REG_FILE_ix1391 (.Y (REG_FILE_nx1392), .A (REG_FILE_Reg_A_in_3)) ;
    xnor2 HAZARD_UNIT_ix1479 (.Y (HAZARD_UNIT_nx1478), .A0 (EXE_Dst_0), .A1 (
          HAZARD_UNIT_nx1476)) ;
    nand04 HAZARD_UNIT_ix1477 (.Y (HAZARD_UNIT_nx1476), .A0 (HAZARD_UNIT_nx1637)
           , .A1 (EXE_Ctrl_8), .A2 (EXE_Ctrl_7), .A3 (EXE_Ctrl_6)) ;
    inv01 HAZARD_UNIT_ix1638 (.Y (HAZARD_UNIT_nx1637), .A (EXE_Ctrl_9)) ;
    inv01 HAZARD_UNIT_ix495 (.Y (EXE_Dst_Din_9), .A (HAZARD_UNIT_nx1645)) ;
    aoi222 HAZARD_UNIT_ix1646 (.Y (HAZARD_UNIT_nx1645), .A0 (PORT_IN[9]), .A1 (
           HAZARD_UNIT_nx2228), .B0 (nx1242), .B1 (DEC_IR_Dout_12), .C0 (
           HAZARD_UNIT_nx486), .C1 (HAZARD_UNIT_nx2222)) ;
    nand02 HAZARD_UNIT_ix487 (.Y (HAZARD_UNIT_nx486), .A0 (HAZARD_UNIT_nx1651), 
           .A1 (HAZARD_UNIT_nx1681)) ;
    aoi22 HAZARD_UNIT_ix1652 (.Y (HAZARD_UNIT_nx1651), .A0 (MEM_Src_9), .A1 (
          HAZARD_UNIT_nx2186), .B0 (WRB_Src_9), .B1 (HAZARD_UNIT_nx2216)) ;
    xnor2 HAZARD_UNIT_ix1655 (.Y (HAZARD_UNIT_nx1654), .A0 (DEC_IR_Dout_5), .A1 (
          MEM_Src_18)) ;
    xnor2 HAZARD_UNIT_ix1657 (.Y (HAZARD_UNIT_nx1656), .A0 (DEC_IR_Dout_3), .A1 (
          MEM_Src_16)) ;
    xnor2 HAZARD_UNIT_ix1659 (.Y (HAZARD_UNIT_nx1658), .A0 (DEC_IR_Dout_4), .A1 (
          MEM_Src_17)) ;
    nor02_2x HAZARD_UNIT_ix107 (.Y (HAZARD_UNIT_nx106), .A0 (HAZARD_UNIT_nx1661)
             , .A1 (HAZARD_UNIT_nx1669)) ;
    nand04 HAZARD_UNIT_ix1662 (.Y (HAZARD_UNIT_nx1661), .A0 (WRB_Src_19), .A1 (
           HAZARD_UNIT_nx1663), .A2 (HAZARD_UNIT_nx1665), .A3 (
           HAZARD_UNIT_nx1667)) ;
    xnor2 HAZARD_UNIT_ix1664 (.Y (HAZARD_UNIT_nx1663), .A0 (DEC_IR_Dout_5), .A1 (
          WRB_Src_18)) ;
    xnor2 HAZARD_UNIT_ix1666 (.Y (HAZARD_UNIT_nx1665), .A0 (DEC_IR_Dout_3), .A1 (
          WRB_Src_16)) ;
    xnor2 HAZARD_UNIT_ix1668 (.Y (HAZARD_UNIT_nx1667), .A0 (DEC_IR_Dout_4), .A1 (
          WRB_Src_17)) ;
    nand02 HAZARD_UNIT_ix1670 (.Y (HAZARD_UNIT_nx1669), .A0 (HAZARD_UNIT_nx1671)
           , .A1 (HAZARD_UNIT_nx1679)) ;
    nand04 HAZARD_UNIT_ix1672 (.Y (HAZARD_UNIT_nx1671), .A0 (MEM_Dst_19), .A1 (
           HAZARD_UNIT_nx1673), .A2 (HAZARD_UNIT_nx1675), .A3 (
           HAZARD_UNIT_nx1677)) ;
    xnor2 HAZARD_UNIT_ix1674 (.Y (HAZARD_UNIT_nx1673), .A0 (DEC_IR_Dout_5), .A1 (
          MEM_Dst_18)) ;
    xnor2 HAZARD_UNIT_ix1676 (.Y (HAZARD_UNIT_nx1675), .A0 (DEC_IR_Dout_3), .A1 (
          MEM_Dst_16)) ;
    xnor2 HAZARD_UNIT_ix1678 (.Y (HAZARD_UNIT_nx1677), .A0 (DEC_IR_Dout_4), .A1 (
          MEM_Dst_17)) ;
    nand04 HAZARD_UNIT_ix1680 (.Y (HAZARD_UNIT_nx1679), .A0 (MEM_Src_19), .A1 (
           HAZARD_UNIT_nx1654), .A2 (HAZARD_UNIT_nx1656), .A3 (
           HAZARD_UNIT_nx1658)) ;
    aoi222 HAZARD_UNIT_ix1682 (.Y (HAZARD_UNIT_nx1681), .A0 (MEM_Dst_9), .A1 (
           HAZARD_UNIT_nx2202), .B0 (WRB_Dst_9), .B1 (HAZARD_UNIT_nx2210), .C0 (
           DEC_Rdst_Dout_9), .C1 (HAZARD_UNIT_nx2194)) ;
    nand04 HAZARD_UNIT_ix1686 (.Y (HAZARD_UNIT_nx1685), .A0 (WRB_Dst_19), .A1 (
           HAZARD_UNIT_nx1687), .A2 (HAZARD_UNIT_nx1689), .A3 (
           HAZARD_UNIT_nx1691)) ;
    xnor2 HAZARD_UNIT_ix1688 (.Y (HAZARD_UNIT_nx1687), .A0 (DEC_IR_Dout_5), .A1 (
          WRB_Dst_18)) ;
    xnor2 HAZARD_UNIT_ix1690 (.Y (HAZARD_UNIT_nx1689), .A0 (DEC_IR_Dout_3), .A1 (
          WRB_Dst_16)) ;
    xnor2 HAZARD_UNIT_ix1692 (.Y (HAZARD_UNIT_nx1691), .A0 (DEC_IR_Dout_4), .A1 (
          WRB_Dst_17)) ;
    inv01 HAZARD_UNIT_ix467 (.Y (EXE_Dst_Din_8), .A (HAZARD_UNIT_nx1698)) ;
    aoi222 HAZARD_UNIT_ix1699 (.Y (HAZARD_UNIT_nx1698), .A0 (PORT_IN[8]), .A1 (
           HAZARD_UNIT_nx2228), .B0 (DEC_IR_Dout_11), .B1 (nx1242), .C0 (
           HAZARD_UNIT_nx458), .C1 (HAZARD_UNIT_nx2222)) ;
    nand02 HAZARD_UNIT_ix459 (.Y (HAZARD_UNIT_nx458), .A0 (HAZARD_UNIT_nx1701), 
           .A1 (HAZARD_UNIT_nx1703)) ;
    aoi22 HAZARD_UNIT_ix1702 (.Y (HAZARD_UNIT_nx1701), .A0 (MEM_Src_8), .A1 (
          HAZARD_UNIT_nx2186), .B0 (WRB_Src_8), .B1 (HAZARD_UNIT_nx2216)) ;
    aoi222 HAZARD_UNIT_ix1704 (.Y (HAZARD_UNIT_nx1703), .A0 (MEM_Dst_8), .A1 (
           HAZARD_UNIT_nx2202), .B0 (WRB_Dst_8), .B1 (HAZARD_UNIT_nx2210), .C0 (
           DEC_Rdst_Dout_8), .C1 (HAZARD_UNIT_nx2194)) ;
    inv01 HAZARD_UNIT_ix439 (.Y (EXE_Dst_Din_7), .A (HAZARD_UNIT_nx1706)) ;
    aoi222 HAZARD_UNIT_ix1707 (.Y (HAZARD_UNIT_nx1706), .A0 (PORT_IN[7]), .A1 (
           HAZARD_UNIT_nx2228), .B0 (DEC_IR_Dout_10), .B1 (nx1242), .C0 (
           HAZARD_UNIT_nx430), .C1 (HAZARD_UNIT_nx2222)) ;
    nand02 HAZARD_UNIT_ix431 (.Y (HAZARD_UNIT_nx430), .A0 (HAZARD_UNIT_nx1709), 
           .A1 (HAZARD_UNIT_nx1711)) ;
    aoi22 HAZARD_UNIT_ix1710 (.Y (HAZARD_UNIT_nx1709), .A0 (MEM_Src_7), .A1 (
          HAZARD_UNIT_nx2186), .B0 (WRB_Src_7), .B1 (HAZARD_UNIT_nx2216)) ;
    aoi222 HAZARD_UNIT_ix1712 (.Y (HAZARD_UNIT_nx1711), .A0 (MEM_Dst_7), .A1 (
           HAZARD_UNIT_nx2202), .B0 (WRB_Dst_7), .B1 (HAZARD_UNIT_nx2210), .C0 (
           DEC_Rdst_Dout_7), .C1 (HAZARD_UNIT_nx2194)) ;
    inv01 HAZARD_UNIT_ix411 (.Y (EXE_Dst_Din_6), .A (HAZARD_UNIT_nx1714)) ;
    aoi222 HAZARD_UNIT_ix1715 (.Y (HAZARD_UNIT_nx1714), .A0 (PORT_IN[6]), .A1 (
           HAZARD_UNIT_nx2228), .B0 (DEC_IR_Dout_9), .B1 (nx1242), .C0 (
           HAZARD_UNIT_nx402), .C1 (HAZARD_UNIT_nx2222)) ;
    nand02 HAZARD_UNIT_ix403 (.Y (HAZARD_UNIT_nx402), .A0 (HAZARD_UNIT_nx1717), 
           .A1 (HAZARD_UNIT_nx1719)) ;
    aoi22 HAZARD_UNIT_ix1718 (.Y (HAZARD_UNIT_nx1717), .A0 (MEM_Src_6), .A1 (
          HAZARD_UNIT_nx2186), .B0 (WRB_Src_6), .B1 (HAZARD_UNIT_nx2216)) ;
    aoi222 HAZARD_UNIT_ix1720 (.Y (HAZARD_UNIT_nx1719), .A0 (MEM_Dst_6), .A1 (
           HAZARD_UNIT_nx2202), .B0 (WRB_Dst_6), .B1 (HAZARD_UNIT_nx2210), .C0 (
           DEC_Rdst_Dout_6), .C1 (HAZARD_UNIT_nx2194)) ;
    nor04 HAZARD_UNIT_ix1722 (.Y (HAZARD_UNIT_nx1721), .A0 (EXE_Dst_Din_5), .A1 (
          EXE_Dst_Din_4), .A2 (EXE_Dst_Din_3), .A3 (EXE_Dst_Din_2)) ;
    inv01 HAZARD_UNIT_ix383 (.Y (EXE_Dst_Din_5), .A (HAZARD_UNIT_nx1724)) ;
    aoi222 HAZARD_UNIT_ix1725 (.Y (HAZARD_UNIT_nx1724), .A0 (PORT_IN[5]), .A1 (
           HAZARD_UNIT_nx2228), .B0 (DEC_IR_Dout_8), .B1 (nx1244), .C0 (
           HAZARD_UNIT_nx374), .C1 (HAZARD_UNIT_nx2222)) ;
    nand02 HAZARD_UNIT_ix375 (.Y (HAZARD_UNIT_nx374), .A0 (HAZARD_UNIT_nx1727), 
           .A1 (HAZARD_UNIT_nx1729)) ;
    aoi22 HAZARD_UNIT_ix1728 (.Y (HAZARD_UNIT_nx1727), .A0 (MEM_Src_5), .A1 (
          HAZARD_UNIT_nx2186), .B0 (WRB_Src_5), .B1 (HAZARD_UNIT_nx2216)) ;
    aoi222 HAZARD_UNIT_ix1730 (.Y (HAZARD_UNIT_nx1729), .A0 (MEM_Dst_5), .A1 (
           HAZARD_UNIT_nx2202), .B0 (WRB_Dst_5), .B1 (HAZARD_UNIT_nx2210), .C0 (
           DEC_Rdst_Dout_5), .C1 (HAZARD_UNIT_nx2194)) ;
    inv01 HAZARD_UNIT_ix355 (.Y (EXE_Dst_Din_4), .A (HAZARD_UNIT_nx1732)) ;
    aoi222 HAZARD_UNIT_ix1733 (.Y (HAZARD_UNIT_nx1732), .A0 (PORT_IN[4]), .A1 (
           HAZARD_UNIT_nx2228), .B0 (DEC_IR_Dout_7), .B1 (nx1244), .C0 (
           HAZARD_UNIT_nx346), .C1 (HAZARD_UNIT_nx2222)) ;
    nand02 HAZARD_UNIT_ix347 (.Y (HAZARD_UNIT_nx346), .A0 (HAZARD_UNIT_nx1735), 
           .A1 (HAZARD_UNIT_nx1737)) ;
    aoi22 HAZARD_UNIT_ix1736 (.Y (HAZARD_UNIT_nx1735), .A0 (MEM_Src_4), .A1 (
          HAZARD_UNIT_nx2186), .B0 (WRB_Src_4), .B1 (HAZARD_UNIT_nx2216)) ;
    aoi222 HAZARD_UNIT_ix1738 (.Y (HAZARD_UNIT_nx1737), .A0 (MEM_Dst_4), .A1 (
           HAZARD_UNIT_nx2202), .B0 (WRB_Dst_4), .B1 (HAZARD_UNIT_nx2210), .C0 (
           DEC_Rdst_Dout_4), .C1 (HAZARD_UNIT_nx2194)) ;
    nand02 HAZARD_UNIT_ix327 (.Y (EXE_Dst_Din_3), .A0 (HAZARD_UNIT_nx1740), .A1 (
           HAZARD_UNIT_nx1742)) ;
    aoi22 HAZARD_UNIT_ix1741 (.Y (HAZARD_UNIT_nx1740), .A0 (DEC_IR_Dout_6), .A1 (
          nx1244), .B0 (PORT_IN[3]), .B1 (HAZARD_UNIT_nx2228)) ;
    aoi22 HAZARD_UNIT_ix1743 (.Y (HAZARD_UNIT_nx1742), .A0 (DEC_IR_Dout_9), .A1 (
          HAZARD_UNIT_nx262), .B0 (HAZARD_UNIT_nx314), .B1 (HAZARD_UNIT_nx2222)
          ) ;
    nand02 HAZARD_UNIT_ix315 (.Y (HAZARD_UNIT_nx314), .A0 (HAZARD_UNIT_nx1748), 
           .A1 (HAZARD_UNIT_nx1750)) ;
    aoi22 HAZARD_UNIT_ix1749 (.Y (HAZARD_UNIT_nx1748), .A0 (MEM_Src_3), .A1 (
          HAZARD_UNIT_nx2188), .B0 (WRB_Src_3), .B1 (HAZARD_UNIT_nx2216)) ;
    aoi222 HAZARD_UNIT_ix1751 (.Y (HAZARD_UNIT_nx1750), .A0 (MEM_Dst_3), .A1 (
           HAZARD_UNIT_nx2202), .B0 (WRB_Dst_3), .B1 (HAZARD_UNIT_nx2210), .C0 (
           DEC_Rdst_Dout_3), .C1 (HAZARD_UNIT_nx2194)) ;
    nand02 HAZARD_UNIT_ix295 (.Y (EXE_Dst_Din_2), .A0 (HAZARD_UNIT_nx1753), .A1 (
           HAZARD_UNIT_nx1755)) ;
    aoi22 HAZARD_UNIT_ix1754 (.Y (HAZARD_UNIT_nx1753), .A0 (DEC_IR_Dout_5), .A1 (
          nx1244), .B0 (PORT_IN[2]), .B1 (HAZARD_UNIT_nx2230)) ;
    aoi22 HAZARD_UNIT_ix1756 (.Y (HAZARD_UNIT_nx1755), .A0 (DEC_IR_Dout_8), .A1 (
          HAZARD_UNIT_nx262), .B0 (HAZARD_UNIT_nx282), .B1 (HAZARD_UNIT_nx2224)
          ) ;
    nand02 HAZARD_UNIT_ix283 (.Y (HAZARD_UNIT_nx282), .A0 (HAZARD_UNIT_nx1758), 
           .A1 (HAZARD_UNIT_nx1760)) ;
    aoi22 HAZARD_UNIT_ix1759 (.Y (HAZARD_UNIT_nx1758), .A0 (MEM_Src_2), .A1 (
          HAZARD_UNIT_nx2188), .B0 (WRB_Src_2), .B1 (HAZARD_UNIT_nx2218)) ;
    aoi222 HAZARD_UNIT_ix1761 (.Y (HAZARD_UNIT_nx1760), .A0 (MEM_Dst_2), .A1 (
           HAZARD_UNIT_nx2204), .B0 (WRB_Dst_2), .B1 (HAZARD_UNIT_nx2212), .C0 (
           DEC_Rdst_Dout_2), .C1 (HAZARD_UNIT_nx2196)) ;
    nand02 HAZARD_UNIT_ix685 (.Y (HAZARD_UNIT_nx684), .A0 (HAZARD_UNIT_nx1765), 
           .A1 (HAZARD_UNIT_nx1767)) ;
    aoi22 HAZARD_UNIT_ix1766 (.Y (HAZARD_UNIT_nx1765), .A0 (MEM_Src_1), .A1 (
          HAZARD_UNIT_nx2188), .B0 (WRB_Src_1), .B1 (HAZARD_UNIT_nx2218)) ;
    aoi222 HAZARD_UNIT_ix1768 (.Y (HAZARD_UNIT_nx1767), .A0 (MEM_Dst_1), .A1 (
           HAZARD_UNIT_nx2204), .B0 (WRB_Dst_1), .B1 (HAZARD_UNIT_nx2212), .C0 (
           DEC_Rdst_Dout_1), .C1 (HAZARD_UNIT_nx2196)) ;
    xnor2 HAZARD_UNIT_ix1771 (.Y (HAZARD_UNIT_nx1770), .A0 (HAZARD_UNIT_nx1772)
          , .A1 (HAZARD_UNIT_nx1546)) ;
    aoi221 HAZARD_UNIT_ix1773 (.Y (HAZARD_UNIT_nx1772), .A0 (DEC_IR_Dout_6), .A1 (
           HAZARD_UNIT_nx262), .B0 (HAZARD_UNIT_nx518), .B1 (HAZARD_UNIT_nx2224)
           , .C0 (HAZARD_UNIT_nx1532)) ;
    nand02 HAZARD_UNIT_ix519 (.Y (HAZARD_UNIT_nx518), .A0 (HAZARD_UNIT_nx1775), 
           .A1 (HAZARD_UNIT_nx1777)) ;
    aoi22 HAZARD_UNIT_ix1776 (.Y (HAZARD_UNIT_nx1775), .A0 (MEM_Src_0), .A1 (
          HAZARD_UNIT_nx2188), .B0 (WRB_Src_0), .B1 (HAZARD_UNIT_nx2218)) ;
    aoi222 HAZARD_UNIT_ix1778 (.Y (HAZARD_UNIT_nx1777), .A0 (MEM_Dst_0), .A1 (
           HAZARD_UNIT_nx2204), .B0 (WRB_Dst_0), .B1 (HAZARD_UNIT_nx2212), .C0 (
           DEC_Rdst_Dout_0), .C1 (HAZARD_UNIT_nx2196)) ;
    nand04 HAZARD_UNIT_ix1547 (.Y (HAZARD_UNIT_nx1546), .A0 (HAZARD_UNIT_nx1781)
           , .A1 (DEC_ALU_Opr_2), .A2 (DEC_ALU_Opr_1), .A3 (DEC_ALU_Opr_0)) ;
    inv01 HAZARD_UNIT_ix1782 (.Y (HAZARD_UNIT_nx1781), .A (DEC_ALU_Opr_3)) ;
    nor03_2x HAZARD_UNIT_ix1581 (.Y (INTR_Stall), .A0 (HAZARD_UNIT_nx1784), .A1 (
             nx1332), .A2 (HAZARD_UNIT_nx1502)) ;
    aoi33 HAZARD_UNIT_ix1785 (.Y (HAZARD_UNIT_nx1784), .A0 (HAZARD_UNIT_nx1478)
          , .A1 (EXE_Ctrl_2), .A2 (HAZARD_UNIT_nx1562), .B0 (HAZARD_UNIT_nx1548)
          , .B1 (DEC_Mem_WR), .B2 (HAZARD_UNIT_nx1568)) ;
    xor2 HAZARD_UNIT_ix1563 (.Y (HAZARD_UNIT_nx1562), .A0 (EXE_Dst_1), .A1 (
         HAZARD_UNIT_nx1476)) ;
    nand02 HAZARD_UNIT_ix1503 (.Y (HAZARD_UNIT_nx1502), .A0 (HAZARD_UNIT_nx1641)
           , .A1 (HAZARD_UNIT_nx1721)) ;
    nor02ii HAZARD_UNIT_ix1651 (.Y (Flush), .A0 (Stall), .A1 (HAZARD_UNIT_nx1646
            )) ;
    nor02ii HAZARD_UNIT_ix1621 (.Y (Stall), .A0 (HAZARD_UNIT_nx1794), .A1 (
            EXE_Ctrl_1)) ;
    aoi44 HAZARD_UNIT_ix1795 (.Y (HAZARD_UNIT_nx1794), .A0 (DEC_Rsrc_Load), .A1 (
          HAZARD_UNIT_nx1796), .A2 (HAZARD_UNIT_nx1798), .A3 (HAZARD_UNIT_nx1800
          ), .B0 (DEC_Rdst_Load), .B1 (HAZARD_UNIT_nx1802), .B2 (
          HAZARD_UNIT_nx1804), .B3 (HAZARD_UNIT_nx1806)) ;
    xnor2 HAZARD_UNIT_ix1797 (.Y (HAZARD_UNIT_nx1796), .A0 (DEC_IR_Dout_2), .A1 (
          EXE_Src_18)) ;
    xnor2 HAZARD_UNIT_ix1799 (.Y (HAZARD_UNIT_nx1798), .A0 (DEC_IR_Dout_0), .A1 (
          EXE_Src_16)) ;
    xnor2 HAZARD_UNIT_ix1801 (.Y (HAZARD_UNIT_nx1800), .A0 (DEC_IR_Dout_1), .A1 (
          EXE_Src_17)) ;
    xnor2 HAZARD_UNIT_ix1803 (.Y (HAZARD_UNIT_nx1802), .A0 (DEC_IR_Dout_5), .A1 (
          EXE_Src_18)) ;
    xnor2 HAZARD_UNIT_ix1805 (.Y (HAZARD_UNIT_nx1804), .A0 (DEC_IR_Dout_3), .A1 (
          EXE_Src_16)) ;
    xnor2 HAZARD_UNIT_ix1807 (.Y (HAZARD_UNIT_nx1806), .A0 (DEC_IR_Dout_4), .A1 (
          EXE_Src_17)) ;
    nand04 HAZARD_UNIT_ix1647 (.Y (HAZARD_UNIT_nx1646), .A0 (HAZARD_UNIT_nx1809)
           , .A1 (HAZARD_UNIT_nx1813), .A2 (HAZARD_UNIT_nx1815), .A3 (
           HAZARD_UNIT_nx1817)) ;
    nand04 HAZARD_UNIT_ix1812 (.Y (HAZARD_UNIT_nx1811), .A0 (WRB_Src_18), .A1 (
           WRB_Src_17), .A2 (WRB_Src_16), .A3 (WRB_Src_19)) ;
    inv01 HAZARD_UNIT_ix1814 (.Y (HAZARD_UNIT_nx1813), .A (DEC_Imm_Load)) ;
    aoi44 HAZARD_UNIT_ix1816 (.Y (HAZARD_UNIT_nx1815), .A0 (DEC_IR_Dout_2), .A1 (
          DEC_IR_Dout_1), .A2 (DEC_IR_Dout_0), .A3 (DEC_Rsrc_WB), .B0 (
          MEM_Src_18), .B1 (MEM_Src_17), .B2 (MEM_Src_16), .B3 (MEM_Src_19)) ;
    nand04 HAZARD_UNIT_ix1818 (.Y (HAZARD_UNIT_nx1817), .A0 (EXE_Src_18), .A1 (
           EXE_Src_17), .A2 (EXE_Src_16), .A3 (EXE_Src_19)) ;
    oai221 HAZARD_UNIT_ix1207 (.Y (PC_Next_0), .A0 (HAZARD_UNIT_nx1820), .A1 (
           HAZARD_UNIT_nx1822), .B0 (PC_Cur_0), .B1 (HAZARD_UNIT_nx1868), .C0 (
           HAZARD_UNIT_nx1871)) ;
    inv01 HAZARD_UNIT_ix1821 (.Y (HAZARD_UNIT_nx1820), .A (DEC_Branch_Taken)) ;
    xnor2 HAZARD_UNIT_ix1826 (.Y (HAZARD_UNIT_nx1825), .A0 (DEC_IR_Dout_2), .A1 (
          MEM_Src_18)) ;
    xnor2 HAZARD_UNIT_ix1828 (.Y (HAZARD_UNIT_nx1827), .A0 (DEC_IR_Dout_0), .A1 (
          MEM_Src_16)) ;
    xnor2 HAZARD_UNIT_ix1830 (.Y (HAZARD_UNIT_nx1829), .A0 (DEC_IR_Dout_1), .A1 (
          MEM_Src_17)) ;
    nand04 HAZARD_UNIT_ix1833 (.Y (HAZARD_UNIT_nx1832), .A0 (MEM_Dst_19), .A1 (
           HAZARD_UNIT_nx1834), .A2 (HAZARD_UNIT_nx1836), .A3 (
           HAZARD_UNIT_nx1838)) ;
    xnor2 HAZARD_UNIT_ix1835 (.Y (HAZARD_UNIT_nx1834), .A0 (DEC_IR_Dout_2), .A1 (
          MEM_Dst_18)) ;
    xnor2 HAZARD_UNIT_ix1837 (.Y (HAZARD_UNIT_nx1836), .A0 (DEC_IR_Dout_0), .A1 (
          MEM_Dst_16)) ;
    xnor2 HAZARD_UNIT_ix1839 (.Y (HAZARD_UNIT_nx1838), .A0 (DEC_IR_Dout_1), .A1 (
          MEM_Dst_17)) ;
    aoi222 HAZARD_UNIT_ix1842 (.Y (HAZARD_UNIT_nx1841), .A0 (WRB_Src_0), .A1 (
           HAZARD_UNIT_nx2246), .B0 (WRB_Dst_0), .B1 (HAZARD_UNIT_nx2250), .C0 (
           DEC_Rsrc_Dout_0), .C1 (HAZARD_UNIT_nx2254)) ;
    nor02_2x HAZARD_UNIT_ix593 (.Y (HAZARD_UNIT_nx592), .A0 (HAZARD_UNIT_nx1844)
             , .A1 (HAZARD_UNIT_nx1852)) ;
    nand04 HAZARD_UNIT_ix1845 (.Y (HAZARD_UNIT_nx1844), .A0 (WRB_Src_19), .A1 (
           HAZARD_UNIT_nx1846), .A2 (HAZARD_UNIT_nx1848), .A3 (
           HAZARD_UNIT_nx1850)) ;
    xnor2 HAZARD_UNIT_ix1847 (.Y (HAZARD_UNIT_nx1846), .A0 (DEC_IR_Dout_2), .A1 (
          WRB_Src_18)) ;
    xnor2 HAZARD_UNIT_ix1849 (.Y (HAZARD_UNIT_nx1848), .A0 (DEC_IR_Dout_0), .A1 (
          WRB_Src_16)) ;
    xnor2 HAZARD_UNIT_ix1851 (.Y (HAZARD_UNIT_nx1850), .A0 (DEC_IR_Dout_1), .A1 (
          WRB_Src_17)) ;
    nand02 HAZARD_UNIT_ix1853 (.Y (HAZARD_UNIT_nx1852), .A0 (HAZARD_UNIT_nx1832)
           , .A1 (HAZARD_UNIT_nx1854)) ;
    nand04 HAZARD_UNIT_ix1855 (.Y (HAZARD_UNIT_nx1854), .A0 (MEM_Src_19), .A1 (
           HAZARD_UNIT_nx1825), .A2 (HAZARD_UNIT_nx1827), .A3 (
           HAZARD_UNIT_nx1829)) ;
    nand04 HAZARD_UNIT_ix1858 (.Y (HAZARD_UNIT_nx1857), .A0 (WRB_Dst_19), .A1 (
           HAZARD_UNIT_nx1859), .A2 (HAZARD_UNIT_nx1861), .A3 (
           HAZARD_UNIT_nx1863)) ;
    xnor2 HAZARD_UNIT_ix1860 (.Y (HAZARD_UNIT_nx1859), .A0 (DEC_IR_Dout_2), .A1 (
          WRB_Dst_18)) ;
    xnor2 HAZARD_UNIT_ix1862 (.Y (HAZARD_UNIT_nx1861), .A0 (DEC_IR_Dout_0), .A1 (
          WRB_Dst_16)) ;
    xnor2 HAZARD_UNIT_ix1864 (.Y (HAZARD_UNIT_nx1863), .A0 (DEC_IR_Dout_1), .A1 (
          WRB_Dst_17)) ;
    nand02 HAZARD_UNIT_ix1161 (.Y (HAZARD_UNIT_nx1160), .A0 (HAZARD_UNIT_nx1811)
           , .A1 (HAZARD_UNIT_nx1820)) ;
    aoi222 HAZARD_UNIT_ix1872 (.Y (HAZARD_UNIT_nx1871), .A0 (WRB_Src_0), .A1 (
           nx1338), .B0 (PC_Reset_Dout_0), .B1 (HAZARD_UNIT_nx2286), .C0 (
           PC_INTR_Dout_0), .C1 (HAZARD_UNIT_nx2266)) ;
    nor03_2x HAZARD_UNIT_ix1169 (.Y (HAZARD_UNIT_nx1168), .A0 (
             HAZARD_UNIT_nx1160), .A1 (RESET), .A2 (nx1332)) ;
    nand02 HAZARD_UNIT_ix1233 (.Y (PC_Next_1), .A0 (HAZARD_UNIT_nx1877), .A1 (
           HAZARD_UNIT_nx1884)) ;
    aoi22 HAZARD_UNIT_ix1878 (.Y (HAZARD_UNIT_nx1877), .A0 (PC_INTR_Dout_1), .A1 (
          HAZARD_UNIT_nx2266), .B0 (nx1250), .B1 (HAZARD_UNIT_nx706)) ;
    nand02 HAZARD_UNIT_ix707 (.Y (HAZARD_UNIT_nx706), .A0 (HAZARD_UNIT_nx1880), 
           .A1 (HAZARD_UNIT_nx1882)) ;
    aoi22 HAZARD_UNIT_ix1881 (.Y (HAZARD_UNIT_nx1880), .A0 (MEM_Src_1), .A1 (
          HAZARD_UNIT_nx2244), .B0 (MEM_Dst_1), .B1 (HAZARD_UNIT_nx2258)) ;
    aoi222 HAZARD_UNIT_ix1883 (.Y (HAZARD_UNIT_nx1882), .A0 (WRB_Src_1), .A1 (
           HAZARD_UNIT_nx2246), .B0 (WRB_Dst_1), .B1 (HAZARD_UNIT_nx2250), .C0 (
           DEC_Rsrc_Dout_1), .C1 (HAZARD_UNIT_nx2254)) ;
    aoi322 HAZARD_UNIT_ix1885 (.Y (HAZARD_UNIT_nx1884), .A0 (HAZARD_UNIT_nx1210)
           , .A1 (HAZARD_UNIT_nx1887), .A2 (HAZARD_UNIT_nx2274), .B0 (
           PC_Reset_Dout_1), .B1 (HAZARD_UNIT_nx2286), .C0 (WRB_Src_1), .C1 (
           nx1338)) ;
    or02 HAZARD_UNIT_ix1211 (.Y (HAZARD_UNIT_nx1210), .A0 (PC_Cur_1), .A1 (
         PC_Cur_0)) ;
    nand02 HAZARD_UNIT_ix1888 (.Y (HAZARD_UNIT_nx1887), .A0 (PC_Cur_0), .A1 (
           PC_Cur_1)) ;
    nand02 HAZARD_UNIT_ix1259 (.Y (PC_Next_2), .A0 (HAZARD_UNIT_nx1891), .A1 (
           HAZARD_UNIT_nx1898)) ;
    aoi22 HAZARD_UNIT_ix1892 (.Y (HAZARD_UNIT_nx1891), .A0 (PC_INTR_Dout_2), .A1 (
          HAZARD_UNIT_nx2266), .B0 (nx1250), .B1 (HAZARD_UNIT_nx738)) ;
    nand02 HAZARD_UNIT_ix739 (.Y (HAZARD_UNIT_nx738), .A0 (HAZARD_UNIT_nx1894), 
           .A1 (HAZARD_UNIT_nx1896)) ;
    aoi22 HAZARD_UNIT_ix1895 (.Y (HAZARD_UNIT_nx1894), .A0 (MEM_Src_2), .A1 (
          HAZARD_UNIT_nx2244), .B0 (MEM_Dst_2), .B1 (HAZARD_UNIT_nx2258)) ;
    aoi222 HAZARD_UNIT_ix1897 (.Y (HAZARD_UNIT_nx1896), .A0 (WRB_Src_2), .A1 (
           HAZARD_UNIT_nx2246), .B0 (WRB_Dst_2), .B1 (HAZARD_UNIT_nx2250), .C0 (
           DEC_Rsrc_Dout_2), .C1 (HAZARD_UNIT_nx2254)) ;
    aoi322 HAZARD_UNIT_ix1899 (.Y (HAZARD_UNIT_nx1898), .A0 (HAZARD_UNIT_nx1236)
           , .A1 (HAZARD_UNIT_nx1903), .A2 (HAZARD_UNIT_nx2274), .B0 (
           PC_Reset_Dout_2), .B1 (HAZARD_UNIT_nx2286), .C0 (WRB_Src_2), .C1 (
           nx1338)) ;
    nand02 HAZARD_UNIT_ix1237 (.Y (HAZARD_UNIT_nx1236), .A0 (HAZARD_UNIT_nx1887)
           , .A1 (HAZARD_UNIT_nx1901)) ;
    inv01 HAZARD_UNIT_ix1902 (.Y (HAZARD_UNIT_nx1901), .A (PC_Cur_2)) ;
    nand03 HAZARD_UNIT_ix1904 (.Y (HAZARD_UNIT_nx1903), .A0 (PC_Cur_2), .A1 (
           PC_Cur_0), .A2 (PC_Cur_1)) ;
    nand02 HAZARD_UNIT_ix1285 (.Y (PC_Next_3), .A0 (HAZARD_UNIT_nx1906), .A1 (
           HAZARD_UNIT_nx1913)) ;
    aoi22 HAZARD_UNIT_ix1907 (.Y (HAZARD_UNIT_nx1906), .A0 (PC_INTR_Dout_3), .A1 (
          HAZARD_UNIT_nx2266), .B0 (nx1250), .B1 (HAZARD_UNIT_nx770)) ;
    nand02 HAZARD_UNIT_ix771 (.Y (HAZARD_UNIT_nx770), .A0 (HAZARD_UNIT_nx1909), 
           .A1 (HAZARD_UNIT_nx1911)) ;
    aoi22 HAZARD_UNIT_ix1910 (.Y (HAZARD_UNIT_nx1909), .A0 (MEM_Src_3), .A1 (
          HAZARD_UNIT_nx2244), .B0 (MEM_Dst_3), .B1 (HAZARD_UNIT_nx2258)) ;
    aoi222 HAZARD_UNIT_ix1912 (.Y (HAZARD_UNIT_nx1911), .A0 (WRB_Src_3), .A1 (
           HAZARD_UNIT_nx2246), .B0 (WRB_Dst_3), .B1 (HAZARD_UNIT_nx2250), .C0 (
           DEC_Rsrc_Dout_3), .C1 (HAZARD_UNIT_nx2254)) ;
    aoi322 HAZARD_UNIT_ix1914 (.Y (HAZARD_UNIT_nx1913), .A0 (HAZARD_UNIT_nx1262)
           , .A1 (HAZARD_UNIT_nx1918), .A2 (HAZARD_UNIT_nx2274), .B0 (
           PC_Reset_Dout_3), .B1 (HAZARD_UNIT_nx2286), .C0 (WRB_Src_3), .C1 (
           nx1338)) ;
    nand02 HAZARD_UNIT_ix1263 (.Y (HAZARD_UNIT_nx1262), .A0 (HAZARD_UNIT_nx1903)
           , .A1 (HAZARD_UNIT_nx1916)) ;
    inv01 HAZARD_UNIT_ix1917 (.Y (HAZARD_UNIT_nx1916), .A (PC_Cur_3)) ;
    nand04 HAZARD_UNIT_ix1919 (.Y (HAZARD_UNIT_nx1918), .A0 (PC_Cur_3), .A1 (
           PC_Cur_2), .A2 (PC_Cur_0), .A3 (PC_Cur_1)) ;
    nand02 HAZARD_UNIT_ix1311 (.Y (PC_Next_4), .A0 (HAZARD_UNIT_nx1921), .A1 (
           HAZARD_UNIT_nx1928)) ;
    aoi22 HAZARD_UNIT_ix1922 (.Y (HAZARD_UNIT_nx1921), .A0 (PC_INTR_Dout_4), .A1 (
          HAZARD_UNIT_nx2266), .B0 (nx1250), .B1 (HAZARD_UNIT_nx802)) ;
    nand02 HAZARD_UNIT_ix803 (.Y (HAZARD_UNIT_nx802), .A0 (HAZARD_UNIT_nx1924), 
           .A1 (HAZARD_UNIT_nx1926)) ;
    aoi22 HAZARD_UNIT_ix1925 (.Y (HAZARD_UNIT_nx1924), .A0 (MEM_Src_4), .A1 (
          HAZARD_UNIT_nx2244), .B0 (MEM_Dst_4), .B1 (HAZARD_UNIT_nx2258)) ;
    aoi222 HAZARD_UNIT_ix1927 (.Y (HAZARD_UNIT_nx1926), .A0 (WRB_Src_4), .A1 (
           HAZARD_UNIT_nx2246), .B0 (WRB_Dst_4), .B1 (HAZARD_UNIT_nx2250), .C0 (
           DEC_Rsrc_Dout_4), .C1 (HAZARD_UNIT_nx2254)) ;
    aoi322 HAZARD_UNIT_ix1929 (.Y (HAZARD_UNIT_nx1928), .A0 (HAZARD_UNIT_nx1288)
           , .A1 (HAZARD_UNIT_nx1933), .A2 (HAZARD_UNIT_nx2274), .B0 (
           PC_Reset_Dout_4), .B1 (HAZARD_UNIT_nx2286), .C0 (WRB_Src_4), .C1 (
           nx1338)) ;
    nand02 HAZARD_UNIT_ix1289 (.Y (HAZARD_UNIT_nx1288), .A0 (HAZARD_UNIT_nx1918)
           , .A1 (HAZARD_UNIT_nx1931)) ;
    inv01 HAZARD_UNIT_ix1932 (.Y (HAZARD_UNIT_nx1931), .A (PC_Cur_4)) ;
    nand02 HAZARD_UNIT_ix1337 (.Y (PC_Next_5), .A0 (HAZARD_UNIT_nx1937), .A1 (
           HAZARD_UNIT_nx1944)) ;
    aoi22 HAZARD_UNIT_ix1938 (.Y (HAZARD_UNIT_nx1937), .A0 (PC_INTR_Dout_5), .A1 (
          HAZARD_UNIT_nx2266), .B0 (nx1250), .B1 (HAZARD_UNIT_nx834)) ;
    nand02 HAZARD_UNIT_ix835 (.Y (HAZARD_UNIT_nx834), .A0 (HAZARD_UNIT_nx1940), 
           .A1 (HAZARD_UNIT_nx1942)) ;
    aoi22 HAZARD_UNIT_ix1941 (.Y (HAZARD_UNIT_nx1940), .A0 (MEM_Src_5), .A1 (
          HAZARD_UNIT_nx2244), .B0 (MEM_Dst_5), .B1 (HAZARD_UNIT_nx2258)) ;
    aoi222 HAZARD_UNIT_ix1943 (.Y (HAZARD_UNIT_nx1942), .A0 (WRB_Src_5), .A1 (
           HAZARD_UNIT_nx2246), .B0 (WRB_Dst_5), .B1 (HAZARD_UNIT_nx2250), .C0 (
           DEC_Rsrc_Dout_5), .C1 (HAZARD_UNIT_nx2254)) ;
    aoi322 HAZARD_UNIT_ix1945 (.Y (HAZARD_UNIT_nx1944), .A0 (HAZARD_UNIT_nx1314)
           , .A1 (HAZARD_UNIT_nx1948), .A2 (HAZARD_UNIT_nx2274), .B0 (
           PC_Reset_Dout_5), .B1 (HAZARD_UNIT_nx2286), .C0 (WRB_Src_5), .C1 (
           nx1338)) ;
    or02 HAZARD_UNIT_ix1315 (.Y (HAZARD_UNIT_nx1314), .A0 (HAZARD_UNIT_nx1290), 
         .A1 (PC_Cur_5)) ;
    nor02ii HAZARD_UNIT_ix1291 (.Y (HAZARD_UNIT_nx1290), .A0 (HAZARD_UNIT_nx1918
            ), .A1 (PC_Cur_4)) ;
    nand02 HAZARD_UNIT_ix1949 (.Y (HAZARD_UNIT_nx1948), .A0 (PC_Cur_5), .A1 (
           HAZARD_UNIT_nx1290)) ;
    nand02 HAZARD_UNIT_ix1363 (.Y (PC_Next_6), .A0 (HAZARD_UNIT_nx1951), .A1 (
           HAZARD_UNIT_nx1958)) ;
    aoi22 HAZARD_UNIT_ix1952 (.Y (HAZARD_UNIT_nx1951), .A0 (PC_INTR_Dout_6), .A1 (
          HAZARD_UNIT_nx2266), .B0 (nx1250), .B1 (HAZARD_UNIT_nx866)) ;
    nand02 HAZARD_UNIT_ix867 (.Y (HAZARD_UNIT_nx866), .A0 (HAZARD_UNIT_nx1954), 
           .A1 (HAZARD_UNIT_nx1956)) ;
    aoi22 HAZARD_UNIT_ix1955 (.Y (HAZARD_UNIT_nx1954), .A0 (MEM_Src_6), .A1 (
          HAZARD_UNIT_nx584), .B0 (MEM_Dst_6), .B1 (HAZARD_UNIT_nx2258)) ;
    aoi222 HAZARD_UNIT_ix1957 (.Y (HAZARD_UNIT_nx1956), .A0 (WRB_Src_6), .A1 (
           HAZARD_UNIT_nx2246), .B0 (WRB_Dst_6), .B1 (HAZARD_UNIT_nx2250), .C0 (
           DEC_Rsrc_Dout_6), .C1 (HAZARD_UNIT_nx2254)) ;
    aoi322 HAZARD_UNIT_ix1959 (.Y (HAZARD_UNIT_nx1958), .A0 (HAZARD_UNIT_nx1340)
           , .A1 (HAZARD_UNIT_nx1963), .A2 (HAZARD_UNIT_nx2274), .B0 (
           PC_Reset_Dout_6), .B1 (HAZARD_UNIT_nx1174), .C0 (WRB_Src_6), .C1 (
           nx1330)) ;
    nand02 HAZARD_UNIT_ix1341 (.Y (HAZARD_UNIT_nx1340), .A0 (HAZARD_UNIT_nx1948)
           , .A1 (HAZARD_UNIT_nx1961)) ;
    inv01 HAZARD_UNIT_ix1962 (.Y (HAZARD_UNIT_nx1961), .A (PC_Cur_6)) ;
    nand02 HAZARD_UNIT_ix1389 (.Y (PC_Next_7), .A0 (HAZARD_UNIT_nx1967), .A1 (
           HAZARD_UNIT_nx1974)) ;
    aoi22 HAZARD_UNIT_ix1968 (.Y (HAZARD_UNIT_nx1967), .A0 (PC_INTR_Dout_7), .A1 (
          HAZARD_UNIT_nx2268), .B0 (nx1252), .B1 (HAZARD_UNIT_nx898)) ;
    nand02 HAZARD_UNIT_ix899 (.Y (HAZARD_UNIT_nx898), .A0 (HAZARD_UNIT_nx1970), 
           .A1 (HAZARD_UNIT_nx1972)) ;
    aoi22 HAZARD_UNIT_ix1971 (.Y (HAZARD_UNIT_nx1970), .A0 (MEM_Src_7), .A1 (
          HAZARD_UNIT_nx584), .B0 (MEM_Dst_7), .B1 (HAZARD_UNIT_nx2258)) ;
    aoi222 HAZARD_UNIT_ix1973 (.Y (HAZARD_UNIT_nx1972), .A0 (WRB_Src_7), .A1 (
           HAZARD_UNIT_nx2248), .B0 (WRB_Dst_7), .B1 (HAZARD_UNIT_nx2252), .C0 (
           DEC_Rsrc_Dout_7), .C1 (HAZARD_UNIT_nx2256)) ;
    aoi322 HAZARD_UNIT_ix1975 (.Y (HAZARD_UNIT_nx1974), .A0 (HAZARD_UNIT_nx1366)
           , .A1 (HAZARD_UNIT_nx1978), .A2 (HAZARD_UNIT_nx2274), .B0 (
           PC_Reset_Dout_7), .B1 (HAZARD_UNIT_nx1174), .C0 (WRB_Src_7), .C1 (
           nx1330)) ;
    or02 HAZARD_UNIT_ix1367 (.Y (HAZARD_UNIT_nx1366), .A0 (HAZARD_UNIT_nx1342), 
         .A1 (PC_Cur_7)) ;
    nor02ii HAZARD_UNIT_ix1343 (.Y (HAZARD_UNIT_nx1342), .A0 (HAZARD_UNIT_nx1948
            ), .A1 (PC_Cur_6)) ;
    nand02 HAZARD_UNIT_ix1979 (.Y (HAZARD_UNIT_nx1978), .A0 (PC_Cur_7), .A1 (
           HAZARD_UNIT_nx1342)) ;
    nand02 HAZARD_UNIT_ix1415 (.Y (PC_Next_8), .A0 (HAZARD_UNIT_nx1981), .A1 (
           HAZARD_UNIT_nx1988)) ;
    aoi22 HAZARD_UNIT_ix1982 (.Y (HAZARD_UNIT_nx1981), .A0 (PC_INTR_Dout_8), .A1 (
          HAZARD_UNIT_nx2268), .B0 (nx1252), .B1 (HAZARD_UNIT_nx930)) ;
    nand02 HAZARD_UNIT_ix931 (.Y (HAZARD_UNIT_nx930), .A0 (HAZARD_UNIT_nx1984), 
           .A1 (HAZARD_UNIT_nx1986)) ;
    aoi22 HAZARD_UNIT_ix1985 (.Y (HAZARD_UNIT_nx1984), .A0 (MEM_Src_8), .A1 (
          HAZARD_UNIT_nx584), .B0 (MEM_Dst_8), .B1 (HAZARD_UNIT_nx2260)) ;
    aoi222 HAZARD_UNIT_ix1987 (.Y (HAZARD_UNIT_nx1986), .A0 (WRB_Src_8), .A1 (
           HAZARD_UNIT_nx2248), .B0 (WRB_Dst_8), .B1 (HAZARD_UNIT_nx2252), .C0 (
           DEC_Rsrc_Dout_8), .C1 (HAZARD_UNIT_nx2256)) ;
    aoi322 HAZARD_UNIT_ix1989 (.Y (HAZARD_UNIT_nx1988), .A0 (HAZARD_UNIT_nx1392)
           , .A1 (HAZARD_UNIT_nx1993), .A2 (HAZARD_UNIT_nx2276), .B0 (
           PC_Reset_Dout_8), .B1 (HAZARD_UNIT_nx1174), .C0 (WRB_Src_8), .C1 (
           nx1330)) ;
    nand02 HAZARD_UNIT_ix1393 (.Y (HAZARD_UNIT_nx1392), .A0 (HAZARD_UNIT_nx1978)
           , .A1 (HAZARD_UNIT_nx1991)) ;
    inv01 HAZARD_UNIT_ix1992 (.Y (HAZARD_UNIT_nx1991), .A (PC_Cur_8)) ;
    oai221 HAZARD_UNIT_ix1435 (.Y (PC_Next_9), .A0 (HAZARD_UNIT_nx1820), .A1 (
           HAZARD_UNIT_nx1997), .B0 (HAZARD_UNIT_nx2002), .B1 (
           HAZARD_UNIT_nx1868), .C0 (HAZARD_UNIT_nx2005)) ;
    aoi222 HAZARD_UNIT_ix2001 (.Y (HAZARD_UNIT_nx2000), .A0 (WRB_Src_9), .A1 (
           HAZARD_UNIT_nx2248), .B0 (WRB_Dst_9), .B1 (HAZARD_UNIT_nx2252), .C0 (
           DEC_Rsrc_Dout_9), .C1 (HAZARD_UNIT_nx2256)) ;
    xnor2 HAZARD_UNIT_ix2003 (.Y (HAZARD_UNIT_nx2002), .A0 (PC_Cur_9), .A1 (
          HAZARD_UNIT_nx1394)) ;
    nor02ii HAZARD_UNIT_ix1395 (.Y (HAZARD_UNIT_nx1394), .A0 (HAZARD_UNIT_nx1978
            ), .A1 (PC_Cur_8)) ;
    aoi222 HAZARD_UNIT_ix2006 (.Y (HAZARD_UNIT_nx2005), .A0 (WRB_Src_9), .A1 (
           nx1330), .B0 (PC_Reset_Dout_9), .B1 (HAZARD_UNIT_nx2286), .C0 (
           PC_INTR_Dout_9), .C1 (HAZARD_UNIT_nx2268)) ;
    ao32 HAZARD_UNIT_ix135 (.Y (EXE_Dst_Din_10), .A0 (PORT_IN[10]), .A1 (nx1254)
         , .A2 (nx1246), .B0 (HAZARD_UNIT_nx114), .B1 (HAZARD_UNIT_nx2224)) ;
    nand02 HAZARD_UNIT_ix115 (.Y (HAZARD_UNIT_nx114), .A0 (HAZARD_UNIT_nx2021), 
           .A1 (HAZARD_UNIT_nx2023)) ;
    aoi22 HAZARD_UNIT_ix2022 (.Y (HAZARD_UNIT_nx2021), .A0 (MEM_Src_10), .A1 (
          HAZARD_UNIT_nx2188), .B0 (WRB_Src_10), .B1 (HAZARD_UNIT_nx2218)) ;
    aoi222 HAZARD_UNIT_ix2024 (.Y (HAZARD_UNIT_nx2023), .A0 (MEM_Dst_10), .A1 (
           HAZARD_UNIT_nx2204), .B0 (WRB_Dst_10), .B1 (HAZARD_UNIT_nx2212), .C0 (
           DEC_Rdst_Dout_10), .C1 (HAZARD_UNIT_nx2196)) ;
    ao32 HAZARD_UNIT_ix159 (.Y (EXE_Dst_Din_11), .A0 (PORT_IN[11]), .A1 (nx1254)
         , .A2 (nx1246), .B0 (HAZARD_UNIT_nx152), .B1 (HAZARD_UNIT_nx2224)) ;
    nand02 HAZARD_UNIT_ix153 (.Y (HAZARD_UNIT_nx152), .A0 (HAZARD_UNIT_nx2027), 
           .A1 (HAZARD_UNIT_nx2029)) ;
    aoi22 HAZARD_UNIT_ix2028 (.Y (HAZARD_UNIT_nx2027), .A0 (MEM_Src_11), .A1 (
          HAZARD_UNIT_nx2188), .B0 (WRB_Src_11), .B1 (HAZARD_UNIT_nx2218)) ;
    aoi222 HAZARD_UNIT_ix2030 (.Y (HAZARD_UNIT_nx2029), .A0 (MEM_Dst_11), .A1 (
           HAZARD_UNIT_nx2204), .B0 (WRB_Dst_11), .B1 (HAZARD_UNIT_nx2212), .C0 (
           DEC_Rdst_Dout_11), .C1 (HAZARD_UNIT_nx2196)) ;
    ao32 HAZARD_UNIT_ix183 (.Y (EXE_Dst_Din_12), .A0 (PORT_IN[12]), .A1 (nx1254)
         , .A2 (nx1246), .B0 (HAZARD_UNIT_nx176), .B1 (HAZARD_UNIT_nx2224)) ;
    nand02 HAZARD_UNIT_ix177 (.Y (HAZARD_UNIT_nx176), .A0 (HAZARD_UNIT_nx2033), 
           .A1 (HAZARD_UNIT_nx2035)) ;
    aoi22 HAZARD_UNIT_ix2034 (.Y (HAZARD_UNIT_nx2033), .A0 (MEM_Src_12), .A1 (
          HAZARD_UNIT_nx2188), .B0 (WRB_Src_12), .B1 (HAZARD_UNIT_nx2218)) ;
    aoi222 HAZARD_UNIT_ix2036 (.Y (HAZARD_UNIT_nx2035), .A0 (MEM_Dst_12), .A1 (
           HAZARD_UNIT_nx2204), .B0 (WRB_Dst_12), .B1 (HAZARD_UNIT_nx2212), .C0 (
           DEC_Rdst_Dout_12), .C1 (HAZARD_UNIT_nx2196)) ;
    ao32 HAZARD_UNIT_ix207 (.Y (EXE_Dst_Din_13), .A0 (PORT_IN[13]), .A1 (nx1254)
         , .A2 (nx1246), .B0 (HAZARD_UNIT_nx200), .B1 (HAZARD_UNIT_nx2224)) ;
    nand02 HAZARD_UNIT_ix201 (.Y (HAZARD_UNIT_nx200), .A0 (HAZARD_UNIT_nx2039), 
           .A1 (HAZARD_UNIT_nx2041)) ;
    aoi22 HAZARD_UNIT_ix2040 (.Y (HAZARD_UNIT_nx2039), .A0 (MEM_Src_13), .A1 (
          HAZARD_UNIT_nx2190), .B0 (WRB_Src_13), .B1 (HAZARD_UNIT_nx2218)) ;
    aoi222 HAZARD_UNIT_ix2042 (.Y (HAZARD_UNIT_nx2041), .A0 (MEM_Dst_13), .A1 (
           HAZARD_UNIT_nx2204), .B0 (WRB_Dst_13), .B1 (HAZARD_UNIT_nx2212), .C0 (
           DEC_Rdst_Dout_13), .C1 (HAZARD_UNIT_nx2196)) ;
    ao32 HAZARD_UNIT_ix231 (.Y (EXE_Dst_Din_14), .A0 (PORT_IN[14]), .A1 (nx1254)
         , .A2 (nx1248), .B0 (HAZARD_UNIT_nx224), .B1 (HAZARD_UNIT_nx2226)) ;
    nand02 HAZARD_UNIT_ix225 (.Y (HAZARD_UNIT_nx224), .A0 (HAZARD_UNIT_nx2045), 
           .A1 (HAZARD_UNIT_nx2047)) ;
    aoi22 HAZARD_UNIT_ix2046 (.Y (HAZARD_UNIT_nx2045), .A0 (MEM_Src_14), .A1 (
          HAZARD_UNIT_nx2190), .B0 (WRB_Src_14), .B1 (HAZARD_UNIT_nx106)) ;
    aoi222 HAZARD_UNIT_ix2048 (.Y (HAZARD_UNIT_nx2047), .A0 (MEM_Dst_14), .A1 (
           HAZARD_UNIT_nx2206), .B0 (WRB_Dst_14), .B1 (HAZARD_UNIT_nx2214), .C0 (
           DEC_Rdst_Dout_14), .C1 (HAZARD_UNIT_nx2198)) ;
    ao32 HAZARD_UNIT_ix255 (.Y (EXE_Dst_Din_15), .A0 (PORT_IN[15]), .A1 (nx1254)
         , .A2 (nx1248), .B0 (HAZARD_UNIT_nx248), .B1 (HAZARD_UNIT_nx2226)) ;
    nand02 HAZARD_UNIT_ix249 (.Y (HAZARD_UNIT_nx248), .A0 (HAZARD_UNIT_nx2051), 
           .A1 (HAZARD_UNIT_nx2053)) ;
    aoi22 HAZARD_UNIT_ix2052 (.Y (HAZARD_UNIT_nx2051), .A0 (MEM_Src_15), .A1 (
          HAZARD_UNIT_nx2190), .B0 (WRB_Src_15), .B1 (HAZARD_UNIT_nx106)) ;
    aoi222 HAZARD_UNIT_ix2054 (.Y (HAZARD_UNIT_nx2053), .A0 (MEM_Dst_15), .A1 (
           HAZARD_UNIT_nx2206), .B0 (WRB_Dst_15), .B1 (HAZARD_UNIT_nx2214), .C0 (
           DEC_Rdst_Dout_15), .C1 (HAZARD_UNIT_nx2198)) ;
    nand02 HAZARD_UNIT_ix665 (.Y (EXE_Src_Din_0), .A0 (HAZARD_UNIT_nx2056), .A1 (
           HAZARD_UNIT_nx2062)) ;
    aoi22 HAZARD_UNIT_ix2057 (.Y (HAZARD_UNIT_nx2056), .A0 (Instr_0), .A1 (
          nx1236), .B0 (HAZARD_UNIT_nx646), .B1 (HAZARD_UNIT_nx2262)) ;
    nand02 HAZARD_UNIT_ix647 (.Y (HAZARD_UNIT_nx646), .A0 (HAZARD_UNIT_nx2059), 
           .A1 (HAZARD_UNIT_nx1841)) ;
    aoi22 HAZARD_UNIT_ix2060 (.Y (HAZARD_UNIT_nx2059), .A0 (MEM_Src_0), .A1 (
          HAZARD_UNIT_nx584), .B0 (MEM_Dst_0), .B1 (HAZARD_UNIT_nx2260)) ;
    nor03_2x HAZARD_UNIT_ix657 (.Y (HAZARD_UNIT_nx656), .A0 (nx1236), .A1 (
             DEC_PC_Flags_Save), .A2 (DEC_Mem_Addr_Switch)) ;
    aoi22 HAZARD_UNIT_ix2063 (.Y (HAZARD_UNIT_nx2062), .A0 (
          DEC_PC_To_Store_Dout_0), .A1 (HAZARD_UNIT_nx2232), .B0 (
          HAZARD_UNIT_nx518), .B1 (HAZARD_UNIT_nx2238)) ;
    nand02 HAZARD_UNIT_ix715 (.Y (EXE_Src_Din_1), .A0 (HAZARD_UNIT_nx2069), .A1 (
           HAZARD_UNIT_nx2071)) ;
    aoi22 HAZARD_UNIT_ix2070 (.Y (HAZARD_UNIT_nx2069), .A0 (Instr_1), .A1 (
          nx1236), .B0 (HAZARD_UNIT_nx706), .B1 (HAZARD_UNIT_nx2262)) ;
    aoi22 HAZARD_UNIT_ix2072 (.Y (HAZARD_UNIT_nx2071), .A0 (
          DEC_PC_To_Store_Dout_1), .A1 (HAZARD_UNIT_nx2232), .B0 (
          HAZARD_UNIT_nx684), .B1 (HAZARD_UNIT_nx2238)) ;
    nand02 HAZARD_UNIT_ix747 (.Y (EXE_Src_Din_2), .A0 (HAZARD_UNIT_nx2074), .A1 (
           HAZARD_UNIT_nx2076)) ;
    aoi22 HAZARD_UNIT_ix2075 (.Y (HAZARD_UNIT_nx2074), .A0 (Instr_2), .A1 (
          nx1236), .B0 (HAZARD_UNIT_nx738), .B1 (HAZARD_UNIT_nx2262)) ;
    aoi22 HAZARD_UNIT_ix2077 (.Y (HAZARD_UNIT_nx2076), .A0 (
          DEC_PC_To_Store_Dout_2), .A1 (HAZARD_UNIT_nx2232), .B0 (
          HAZARD_UNIT_nx282), .B1 (HAZARD_UNIT_nx2238)) ;
    nand02 HAZARD_UNIT_ix779 (.Y (EXE_Src_Din_3), .A0 (HAZARD_UNIT_nx2079), .A1 (
           HAZARD_UNIT_nx2081)) ;
    aoi22 HAZARD_UNIT_ix2080 (.Y (HAZARD_UNIT_nx2079), .A0 (Instr_3), .A1 (
          nx1236), .B0 (HAZARD_UNIT_nx770), .B1 (HAZARD_UNIT_nx2262)) ;
    aoi22 HAZARD_UNIT_ix2082 (.Y (HAZARD_UNIT_nx2081), .A0 (
          DEC_PC_To_Store_Dout_3), .A1 (HAZARD_UNIT_nx2232), .B0 (
          HAZARD_UNIT_nx314), .B1 (HAZARD_UNIT_nx2238)) ;
    nand02 HAZARD_UNIT_ix811 (.Y (EXE_Src_Din_4), .A0 (HAZARD_UNIT_nx2084), .A1 (
           HAZARD_UNIT_nx2086)) ;
    aoi22 HAZARD_UNIT_ix2085 (.Y (HAZARD_UNIT_nx2084), .A0 (Instr_4), .A1 (
          nx1236), .B0 (HAZARD_UNIT_nx802), .B1 (HAZARD_UNIT_nx2262)) ;
    aoi22 HAZARD_UNIT_ix2087 (.Y (HAZARD_UNIT_nx2086), .A0 (
          DEC_PC_To_Store_Dout_4), .A1 (HAZARD_UNIT_nx2232), .B0 (
          HAZARD_UNIT_nx346), .B1 (HAZARD_UNIT_nx2238)) ;
    nand02 HAZARD_UNIT_ix843 (.Y (EXE_Src_Din_5), .A0 (HAZARD_UNIT_nx2089), .A1 (
           HAZARD_UNIT_nx2091)) ;
    aoi22 HAZARD_UNIT_ix2090 (.Y (HAZARD_UNIT_nx2089), .A0 (Instr_5), .A1 (
          nx1238), .B0 (HAZARD_UNIT_nx834), .B1 (HAZARD_UNIT_nx2262)) ;
    aoi22 HAZARD_UNIT_ix2092 (.Y (HAZARD_UNIT_nx2091), .A0 (
          DEC_PC_To_Store_Dout_5), .A1 (HAZARD_UNIT_nx2232), .B0 (
          HAZARD_UNIT_nx374), .B1 (HAZARD_UNIT_nx2238)) ;
    nand02 HAZARD_UNIT_ix875 (.Y (EXE_Src_Din_6), .A0 (HAZARD_UNIT_nx2094), .A1 (
           HAZARD_UNIT_nx2096)) ;
    aoi22 HAZARD_UNIT_ix2095 (.Y (HAZARD_UNIT_nx2094), .A0 (Instr_6), .A1 (
          nx1238), .B0 (HAZARD_UNIT_nx866), .B1 (HAZARD_UNIT_nx2262)) ;
    aoi22 HAZARD_UNIT_ix2097 (.Y (HAZARD_UNIT_nx2096), .A0 (
          DEC_PC_To_Store_Dout_6), .A1 (HAZARD_UNIT_nx2232), .B0 (
          HAZARD_UNIT_nx402), .B1 (HAZARD_UNIT_nx2238)) ;
    nand02 HAZARD_UNIT_ix907 (.Y (EXE_Src_Din_7), .A0 (HAZARD_UNIT_nx2099), .A1 (
           HAZARD_UNIT_nx2101)) ;
    aoi22 HAZARD_UNIT_ix2100 (.Y (HAZARD_UNIT_nx2099), .A0 (Instr_7), .A1 (
          nx1238), .B0 (HAZARD_UNIT_nx898), .B1 (HAZARD_UNIT_nx2264)) ;
    aoi22 HAZARD_UNIT_ix2102 (.Y (HAZARD_UNIT_nx2101), .A0 (
          DEC_PC_To_Store_Dout_7), .A1 (HAZARD_UNIT_nx2234), .B0 (
          HAZARD_UNIT_nx430), .B1 (HAZARD_UNIT_nx2240)) ;
    nand02 HAZARD_UNIT_ix939 (.Y (EXE_Src_Din_8), .A0 (HAZARD_UNIT_nx2104), .A1 (
           HAZARD_UNIT_nx2106)) ;
    aoi22 HAZARD_UNIT_ix2105 (.Y (HAZARD_UNIT_nx2104), .A0 (Instr_8), .A1 (
          nx1238), .B0 (HAZARD_UNIT_nx930), .B1 (HAZARD_UNIT_nx2264)) ;
    aoi22 HAZARD_UNIT_ix2107 (.Y (HAZARD_UNIT_nx2106), .A0 (
          DEC_PC_To_Store_Dout_8), .A1 (HAZARD_UNIT_nx2234), .B0 (
          HAZARD_UNIT_nx458), .B1 (HAZARD_UNIT_nx2240)) ;
    nand02 HAZARD_UNIT_ix971 (.Y (EXE_Src_Din_9), .A0 (HAZARD_UNIT_nx2109), .A1 (
           HAZARD_UNIT_nx2114)) ;
    aoi22 HAZARD_UNIT_ix2110 (.Y (HAZARD_UNIT_nx2109), .A0 (Instr_9), .A1 (
          nx1238), .B0 (HAZARD_UNIT_nx962), .B1 (HAZARD_UNIT_nx2264)) ;
    nand02 HAZARD_UNIT_ix963 (.Y (HAZARD_UNIT_nx962), .A0 (HAZARD_UNIT_nx2112), 
           .A1 (HAZARD_UNIT_nx2000)) ;
    aoi22 HAZARD_UNIT_ix2113 (.Y (HAZARD_UNIT_nx2112), .A0 (MEM_Src_9), .A1 (
          HAZARD_UNIT_nx584), .B0 (MEM_Dst_9), .B1 (HAZARD_UNIT_nx2260)) ;
    aoi22 HAZARD_UNIT_ix2115 (.Y (HAZARD_UNIT_nx2114), .A0 (
          DEC_PC_To_Store_Dout_9), .A1 (HAZARD_UNIT_nx2234), .B0 (
          HAZARD_UNIT_nx486), .B1 (HAZARD_UNIT_nx2240)) ;
    nand04 HAZARD_UNIT_ix1011 (.Y (EXE_Src_Din_10), .A0 (HAZARD_UNIT_nx2117), .A1 (
           HAZARD_UNIT_nx2119), .A2 (HAZARD_UNIT_nx2126), .A3 (
           HAZARD_UNIT_nx2134)) ;
    aoi22 HAZARD_UNIT_ix2118 (.Y (HAZARD_UNIT_nx2117), .A0 (Instr_10), .A1 (
          nx1238), .B0 (HAZARD_UNIT_nx114), .B1 (HAZARD_UNIT_nx2240)) ;
    aoi22 HAZARD_UNIT_ix2120 (.Y (HAZARD_UNIT_nx2119), .A0 (Flags_Dout_0), .A1 (
          HAZARD_UNIT_nx2234), .B0 (DEC_Rsrc_Dout_10), .B1 (HAZARD_UNIT_nx2284)
          ) ;
    nand03 HAZARD_UNIT_ix2125 (.Y (HAZARD_UNIT_nx2124), .A0 (HAZARD_UNIT_nx590)
           , .A1 (HAZARD_UNIT_nx1857), .A2 (HAZARD_UNIT_nx1844)) ;
    aoi22 HAZARD_UNIT_ix2127 (.Y (HAZARD_UNIT_nx2126), .A0 (MEM_Dst_10), .A1 (
          HAZARD_UNIT_nx982), .B0 (WRB_Dst_10), .B1 (HAZARD_UNIT_nx986)) ;
    aoi22 HAZARD_UNIT_ix2135 (.Y (HAZARD_UNIT_nx2134), .A0 (MEM_Src_10), .A1 (
          HAZARD_UNIT_nx972), .B0 (WRB_Src_10), .B1 (HAZARD_UNIT_nx976)) ;
    nand04 HAZARD_UNIT_ix1041 (.Y (EXE_Src_Din_11), .A0 (HAZARD_UNIT_nx2141), .A1 (
           HAZARD_UNIT_nx2143), .A2 (HAZARD_UNIT_nx2145), .A3 (
           HAZARD_UNIT_nx2147)) ;
    aoi22 HAZARD_UNIT_ix2142 (.Y (HAZARD_UNIT_nx2141), .A0 (Instr_11), .A1 (
          nx1238), .B0 (HAZARD_UNIT_nx152), .B1 (HAZARD_UNIT_nx2240)) ;
    aoi22 HAZARD_UNIT_ix2144 (.Y (HAZARD_UNIT_nx2143), .A0 (Flags_Dout_1), .A1 (
          HAZARD_UNIT_nx2234), .B0 (DEC_Rsrc_Dout_11), .B1 (HAZARD_UNIT_nx2284)
          ) ;
    aoi22 HAZARD_UNIT_ix2146 (.Y (HAZARD_UNIT_nx2145), .A0 (MEM_Dst_11), .A1 (
          HAZARD_UNIT_nx982), .B0 (WRB_Dst_11), .B1 (HAZARD_UNIT_nx986)) ;
    aoi22 HAZARD_UNIT_ix2148 (.Y (HAZARD_UNIT_nx2147), .A0 (MEM_Src_11), .A1 (
          HAZARD_UNIT_nx972), .B0 (WRB_Src_11), .B1 (HAZARD_UNIT_nx976)) ;
    nand04 HAZARD_UNIT_ix1071 (.Y (EXE_Src_Din_12), .A0 (HAZARD_UNIT_nx2150), .A1 (
           HAZARD_UNIT_nx2152), .A2 (HAZARD_UNIT_nx2154), .A3 (
           HAZARD_UNIT_nx2156)) ;
    aoi22 HAZARD_UNIT_ix2151 (.Y (HAZARD_UNIT_nx2150), .A0 (Instr_12), .A1 (
          nx1240), .B0 (HAZARD_UNIT_nx176), .B1 (HAZARD_UNIT_nx2240)) ;
    aoi22 HAZARD_UNIT_ix2153 (.Y (HAZARD_UNIT_nx2152), .A0 (Flags_Dout_2), .A1 (
          HAZARD_UNIT_nx2234), .B0 (DEC_Rsrc_Dout_12), .B1 (HAZARD_UNIT_nx2284)
          ) ;
    aoi22 HAZARD_UNIT_ix2155 (.Y (HAZARD_UNIT_nx2154), .A0 (MEM_Dst_12), .A1 (
          HAZARD_UNIT_nx982), .B0 (WRB_Dst_12), .B1 (HAZARD_UNIT_nx986)) ;
    aoi22 HAZARD_UNIT_ix2157 (.Y (HAZARD_UNIT_nx2156), .A0 (MEM_Src_12), .A1 (
          HAZARD_UNIT_nx972), .B0 (WRB_Src_12), .B1 (HAZARD_UNIT_nx976)) ;
    nand04 HAZARD_UNIT_ix1101 (.Y (EXE_Src_Din_13), .A0 (HAZARD_UNIT_nx2159), .A1 (
           HAZARD_UNIT_nx2161), .A2 (HAZARD_UNIT_nx2163), .A3 (
           HAZARD_UNIT_nx2165)) ;
    aoi22 HAZARD_UNIT_ix2160 (.Y (HAZARD_UNIT_nx2159), .A0 (Instr_13), .A1 (
          nx1240), .B0 (HAZARD_UNIT_nx200), .B1 (HAZARD_UNIT_nx2240)) ;
    aoi22 HAZARD_UNIT_ix2162 (.Y (HAZARD_UNIT_nx2161), .A0 (Flags_Dout_3), .A1 (
          HAZARD_UNIT_nx2234), .B0 (DEC_Rsrc_Dout_13), .B1 (HAZARD_UNIT_nx2284)
          ) ;
    aoi22 HAZARD_UNIT_ix2164 (.Y (HAZARD_UNIT_nx2163), .A0 (MEM_Dst_13), .A1 (
          HAZARD_UNIT_nx982), .B0 (WRB_Dst_13), .B1 (HAZARD_UNIT_nx986)) ;
    aoi22 HAZARD_UNIT_ix2166 (.Y (HAZARD_UNIT_nx2165), .A0 (MEM_Src_13), .A1 (
          HAZARD_UNIT_nx972), .B0 (WRB_Src_13), .B1 (HAZARD_UNIT_nx976)) ;
    nand03 HAZARD_UNIT_ix1127 (.Y (EXE_Src_Din_14), .A0 (HAZARD_UNIT_nx2168), .A1 (
           HAZARD_UNIT_nx2170), .A2 (HAZARD_UNIT_nx2172)) ;
    aoi222 HAZARD_UNIT_ix2169 (.Y (HAZARD_UNIT_nx2168), .A0 (DEC_Rsrc_Dout_14), 
           .A1 (HAZARD_UNIT_nx2284), .B0 (Instr_14), .B1 (nx1240), .C0 (
           HAZARD_UNIT_nx224), .C1 (HAZARD_UNIT_nx2242)) ;
    aoi22 HAZARD_UNIT_ix2171 (.Y (HAZARD_UNIT_nx2170), .A0 (MEM_Dst_14), .A1 (
          HAZARD_UNIT_nx982), .B0 (WRB_Dst_14), .B1 (HAZARD_UNIT_nx986)) ;
    aoi22 HAZARD_UNIT_ix2173 (.Y (HAZARD_UNIT_nx2172), .A0 (MEM_Src_14), .A1 (
          HAZARD_UNIT_nx972), .B0 (WRB_Src_14), .B1 (HAZARD_UNIT_nx976)) ;
    nand03 HAZARD_UNIT_ix1153 (.Y (EXE_Src_Din_15), .A0 (HAZARD_UNIT_nx2175), .A1 (
           HAZARD_UNIT_nx2177), .A2 (HAZARD_UNIT_nx2179)) ;
    aoi222 HAZARD_UNIT_ix2176 (.Y (HAZARD_UNIT_nx2175), .A0 (DEC_Rsrc_Dout_15), 
           .A1 (HAZARD_UNIT_nx2284), .B0 (nx1240), .B1 (Instr_15), .C0 (
           HAZARD_UNIT_nx248), .C1 (HAZARD_UNIT_nx2242)) ;
    aoi22 HAZARD_UNIT_ix2178 (.Y (HAZARD_UNIT_nx2177), .A0 (MEM_Dst_15), .A1 (
          HAZARD_UNIT_nx982), .B0 (WRB_Dst_15), .B1 (HAZARD_UNIT_nx986)) ;
    aoi22 HAZARD_UNIT_ix2180 (.Y (HAZARD_UNIT_nx2179), .A0 (MEM_Src_15), .A1 (
          HAZARD_UNIT_nx972), .B0 (WRB_Src_15), .B1 (HAZARD_UNIT_nx976)) ;
    inv01 HAZARD_UNIT_ix1549 (.Y (HAZARD_UNIT_nx1548), .A (HAZARD_UNIT_nx1770)
          ) ;
    inv01 HAZARD_UNIT_ix1994 (.Y (HAZARD_UNIT_nx1993), .A (HAZARD_UNIT_nx1394)
          ) ;
    inv01 HAZARD_UNIT_ix1964 (.Y (HAZARD_UNIT_nx1963), .A (HAZARD_UNIT_nx1342)
          ) ;
    inv01 HAZARD_UNIT_ix1934 (.Y (HAZARD_UNIT_nx1933), .A (HAZARD_UNIT_nx1290)
          ) ;
    inv01 HAZARD_UNIT_ix1810 (.Y (HAZARD_UNIT_nx1809), .A (HAZARD_UNIT_nx1160)
          ) ;
    inv01 HAZARD_UNIT_ix1998 (.Y (HAZARD_UNIT_nx1997), .A (HAZARD_UNIT_nx962)) ;
    inv02 HAZARD_UNIT_ix2123 (.Y (HAZARD_UNIT_nx2122), .A (HAZARD_UNIT_nx656)) ;
    inv01 HAZARD_UNIT_ix1823 (.Y (HAZARD_UNIT_nx1822), .A (HAZARD_UNIT_nx646)) ;
    inv01 HAZARD_UNIT_ix2139 (.Y (HAZARD_UNIT_nx2138), .A (HAZARD_UNIT_nx592)) ;
    inv01 HAZARD_UNIT_ix591 (.Y (HAZARD_UNIT_nx590), .A (HAZARD_UNIT_nx1852)) ;
    inv01 HAZARD_UNIT_ix585 (.Y (HAZARD_UNIT_nx584), .A (HAZARD_UNIT_nx1854)) ;
    inv01 HAZARD_UNIT_ix549 (.Y (HAZARD_UNIT_nx548), .A (HAZARD_UNIT_nx1844)) ;
    inv01 HAZARD_UNIT_ix77 (.Y (HAZARD_UNIT_nx76), .A (HAZARD_UNIT_nx1661)) ;
    inv01 HAZARD_UNIT_ix41 (.Y (HAZARD_UNIT_nx40), .A (HAZARD_UNIT_nx1669)) ;
    inv01 HAZARD_UNIT_ix1535 (.Y (EXE_Dst_Din_0), .A (HAZARD_UNIT_nx1772)) ;
    inv02 HAZARD_UNIT_ix2185 (.Y (HAZARD_UNIT_nx2186), .A (HAZARD_UNIT_nx1679)
          ) ;
    inv02 HAZARD_UNIT_ix2187 (.Y (HAZARD_UNIT_nx2188), .A (HAZARD_UNIT_nx1679)
          ) ;
    inv02 HAZARD_UNIT_ix2189 (.Y (HAZARD_UNIT_nx2190), .A (HAZARD_UNIT_nx1679)
          ) ;
    inv02 HAZARD_UNIT_ix2193 (.Y (HAZARD_UNIT_nx2194), .A (HAZARD_UNIT_nx2192)
          ) ;
    inv02 HAZARD_UNIT_ix2195 (.Y (HAZARD_UNIT_nx2196), .A (HAZARD_UNIT_nx2192)
          ) ;
    inv02 HAZARD_UNIT_ix2197 (.Y (HAZARD_UNIT_nx2198), .A (HAZARD_UNIT_nx2192)
          ) ;
    inv02 HAZARD_UNIT_ix2201 (.Y (HAZARD_UNIT_nx2202), .A (HAZARD_UNIT_nx2200)
          ) ;
    inv02 HAZARD_UNIT_ix2203 (.Y (HAZARD_UNIT_nx2204), .A (HAZARD_UNIT_nx2200)
          ) ;
    inv02 HAZARD_UNIT_ix2205 (.Y (HAZARD_UNIT_nx2206), .A (HAZARD_UNIT_nx2200)
          ) ;
    inv02 HAZARD_UNIT_ix2209 (.Y (HAZARD_UNIT_nx2210), .A (HAZARD_UNIT_nx2208)
          ) ;
    inv02 HAZARD_UNIT_ix2211 (.Y (HAZARD_UNIT_nx2212), .A (HAZARD_UNIT_nx2208)
          ) ;
    inv02 HAZARD_UNIT_ix2213 (.Y (HAZARD_UNIT_nx2214), .A (HAZARD_UNIT_nx2208)
          ) ;
    nor02_2x HAZARD_UNIT_ix2215 (.Y (HAZARD_UNIT_nx2216), .A0 (
             HAZARD_UNIT_nx1661), .A1 (HAZARD_UNIT_nx1669)) ;
    nor02_2x HAZARD_UNIT_ix2217 (.Y (HAZARD_UNIT_nx2218), .A0 (
             HAZARD_UNIT_nx1661), .A1 (HAZARD_UNIT_nx1669)) ;
    inv02 HAZARD_UNIT_ix2221 (.Y (HAZARD_UNIT_nx2222), .A (HAZARD_UNIT_nx2220)
          ) ;
    inv02 HAZARD_UNIT_ix2223 (.Y (HAZARD_UNIT_nx2224), .A (HAZARD_UNIT_nx2220)
          ) ;
    inv02 HAZARD_UNIT_ix2225 (.Y (HAZARD_UNIT_nx2226), .A (HAZARD_UNIT_nx2220)
          ) ;
    buf02 HAZARD_UNIT_ix2227 (.Y (HAZARD_UNIT_nx2228), .A (HAZARD_UNIT_nx130)) ;
    buf02 HAZARD_UNIT_ix2229 (.Y (HAZARD_UNIT_nx2230), .A (HAZARD_UNIT_nx130)) ;
    buf02 HAZARD_UNIT_ix2231 (.Y (HAZARD_UNIT_nx2232), .A (HAZARD_UNIT_nx498)) ;
    buf02 HAZARD_UNIT_ix2233 (.Y (HAZARD_UNIT_nx2234), .A (HAZARD_UNIT_nx498)) ;
    inv02 HAZARD_UNIT_ix2237 (.Y (HAZARD_UNIT_nx2238), .A (HAZARD_UNIT_nx2236)
          ) ;
    inv02 HAZARD_UNIT_ix2239 (.Y (HAZARD_UNIT_nx2240), .A (HAZARD_UNIT_nx2236)
          ) ;
    inv02 HAZARD_UNIT_ix2241 (.Y (HAZARD_UNIT_nx2242), .A (HAZARD_UNIT_nx2236)
          ) ;
    inv01 HAZARD_UNIT_ix2243 (.Y (HAZARD_UNIT_nx2244), .A (HAZARD_UNIT_nx1854)
          ) ;
    inv02 HAZARD_UNIT_ix2245 (.Y (HAZARD_UNIT_nx2246), .A (HAZARD_UNIT_nx2138)
          ) ;
    inv02 HAZARD_UNIT_ix2247 (.Y (HAZARD_UNIT_nx2248), .A (HAZARD_UNIT_nx2138)
          ) ;
    inv02 HAZARD_UNIT_ix2249 (.Y (HAZARD_UNIT_nx2250), .A (HAZARD_UNIT_nx2132)
          ) ;
    inv02 HAZARD_UNIT_ix2251 (.Y (HAZARD_UNIT_nx2252), .A (HAZARD_UNIT_nx2132)
          ) ;
    inv02 HAZARD_UNIT_ix2253 (.Y (HAZARD_UNIT_nx2254), .A (HAZARD_UNIT_nx2124)
          ) ;
    inv02 HAZARD_UNIT_ix2255 (.Y (HAZARD_UNIT_nx2256), .A (HAZARD_UNIT_nx2124)
          ) ;
    inv02 HAZARD_UNIT_ix2257 (.Y (HAZARD_UNIT_nx2258), .A (HAZARD_UNIT_nx2129)
          ) ;
    inv02 HAZARD_UNIT_ix2259 (.Y (HAZARD_UNIT_nx2260), .A (HAZARD_UNIT_nx2129)
          ) ;
    inv02 HAZARD_UNIT_ix2261 (.Y (HAZARD_UNIT_nx2262), .A (HAZARD_UNIT_nx2122)
          ) ;
    inv02 HAZARD_UNIT_ix2263 (.Y (HAZARD_UNIT_nx2264), .A (HAZARD_UNIT_nx2122)
          ) ;
    buf02 HAZARD_UNIT_ix2265 (.Y (HAZARD_UNIT_nx2266), .A (HAZARD_UNIT_nx1168)
          ) ;
    buf02 HAZARD_UNIT_ix2267 (.Y (HAZARD_UNIT_nx2268), .A (HAZARD_UNIT_nx1168)
          ) ;
    inv04 HAZARD_UNIT_ix2273 (.Y (HAZARD_UNIT_nx2274), .A (HAZARD_UNIT_nx1868)
          ) ;
    inv04 HAZARD_UNIT_ix2275 (.Y (HAZARD_UNIT_nx2276), .A (HAZARD_UNIT_nx1868)
          ) ;
    and04 HAZARD_UNIT_ix1642 (.Y (HAZARD_UNIT_nx1641), .A0 (HAZARD_UNIT_nx1645)
          , .A1 (HAZARD_UNIT_nx1698), .A2 (HAZARD_UNIT_nx1706), .A3 (
          HAZARD_UNIT_nx1714)) ;
    or02 HAZARD_UNIT_ix91 (.Y (HAZARD_UNIT_nx2200), .A0 (HAZARD_UNIT_nx1671), .A1 (
         HAZARD_UNIT_nx2186)) ;
    or03 HAZARD_UNIT_ix99 (.Y (HAZARD_UNIT_nx2208), .A0 (HAZARD_UNIT_nx1669), .A1 (
         HAZARD_UNIT_nx1685), .A2 (HAZARD_UNIT_nx76)) ;
    nand03 HAZARD_UNIT_ix85 (.Y (HAZARD_UNIT_nx2192), .A0 (HAZARD_UNIT_nx40), .A1 (
           HAZARD_UNIT_nx1685), .A2 (HAZARD_UNIT_nx1661)) ;
    ao221 HAZARD_UNIT_ix1763 (.Y (EXE_Dst_Din_1), .A0 (DEC_IR_Dout_7), .A1 (
          HAZARD_UNIT_nx262), .B0 (HAZARD_UNIT_nx684), .B1 (HAZARD_UNIT_nx2224)
          , .C0 (HAZARD_UNIT_nx1518)) ;
    xor2 HAZARD_UNIT_ix1569 (.Y (HAZARD_UNIT_nx1568), .A0 (EXE_Dst_Din_1), .A1 (
         HAZARD_UNIT_nx1546)) ;
    or02 HAZARD_UNIT_ix639 (.Y (HAZARD_UNIT_nx2129), .A0 (HAZARD_UNIT_nx1832), .A1 (
         HAZARD_UNIT_nx2244)) ;
    or03 HAZARD_UNIT_ix619 (.Y (HAZARD_UNIT_nx2132), .A0 (HAZARD_UNIT_nx1852), .A1 (
         HAZARD_UNIT_nx1857), .A2 (HAZARD_UNIT_nx548)) ;
    nor02ii HAZARD_UNIT_ix1175 (.Y (HAZARD_UNIT_nx1174), .A0 (HAZARD_UNIT_nx1160
            ), .A1 (RESET)) ;
    nor02ii HAZARD_UNIT_ix995 (.Y (HAZARD_UNIT_nx994), .A0 (HAZARD_UNIT_nx2124)
            , .A1 (HAZARD_UNIT_nx656)) ;
    nor02ii HAZARD_UNIT_ix983 (.Y (HAZARD_UNIT_nx982), .A0 (HAZARD_UNIT_nx2129)
            , .A1 (HAZARD_UNIT_nx656)) ;
    nor02ii HAZARD_UNIT_ix987 (.Y (HAZARD_UNIT_nx986), .A0 (HAZARD_UNIT_nx2132)
            , .A1 (HAZARD_UNIT_nx656)) ;
    nor02ii HAZARD_UNIT_ix973 (.Y (HAZARD_UNIT_nx972), .A0 (HAZARD_UNIT_nx1854)
            , .A1 (HAZARD_UNIT_nx656)) ;
    and02 HAZARD_UNIT_ix977 (.Y (HAZARD_UNIT_nx976), .A0 (HAZARD_UNIT_nx656), .A1 (
          HAZARD_UNIT_nx592)) ;
    nor02ii HAZARD_UNIT_ix2269 (.Y (HAZARD_UNIT_nx2270), .A0 (HAZARD_UNIT_nx1160
            ), .A1 (RESET)) ;
    buf02 HAZARD_UNIT_ix2283 (.Y (HAZARD_UNIT_nx2284), .A (HAZARD_UNIT_nx994)) ;
    buf02 HAZARD_UNIT_ix2285 (.Y (HAZARD_UNIT_nx2286), .A (HAZARD_UNIT_nx2270)
          ) ;
    inv01 ix1135 (.Y (NOT_Stall), .A (Stall)) ;
    fake_vcc ix1035 (.Y (PWR)) ;
    fake_gnd ix1033 (.Y (PC_Next_15)) ;
    and04 ix485 (.Y (PC_INTR_EN), .A0 (MEM_Ctrl_2), .A1 (MEM_Addr_0), .A2 (nx460
          ), .A3 (nx482)) ;
    mux21_ni ix331 (.Y (MEM_Addr_0), .A0 (MEM_Dst_0), .A1 (MEM_Src_0), .S0 (
             MEM_Ctrl_3)) ;
    nor02_2x ix461 (.Y (nx460), .A0 (MEM_Addr_1), .A1 (MEM_Addr_2)) ;
    mux21_ni ix339 (.Y (MEM_Addr_1), .A0 (MEM_Dst_1), .A1 (MEM_Src_1), .S0 (
             MEM_Ctrl_3)) ;
    mux21_ni ix347 (.Y (MEM_Addr_2), .A0 (MEM_Dst_2), .A1 (MEM_Src_2), .S0 (
             MEM_Ctrl_3)) ;
    nor04 ix483 (.Y (nx482), .A0 (MEM_Addr_3), .A1 (MEM_Addr_8), .A2 (MEM_Addr_9
          ), .A3 (nx474)) ;
    mux21_ni ix355 (.Y (MEM_Addr_3), .A0 (MEM_Dst_3), .A1 (MEM_Src_3), .S0 (
             MEM_Ctrl_3)) ;
    mux21_ni ix395 (.Y (MEM_Addr_8), .A0 (MEM_Dst_8), .A1 (MEM_Src_8), .S0 (
             MEM_Ctrl_3)) ;
    mux21_ni ix403 (.Y (MEM_Addr_9), .A0 (MEM_Dst_9), .A1 (MEM_Src_9), .S0 (
             MEM_Ctrl_3)) ;
    or04 ix475 (.Y (nx474), .A0 (MEM_Addr_7), .A1 (MEM_Addr_6), .A2 (MEM_Addr_5)
         , .A3 (MEM_Addr_4)) ;
    mux21_ni ix387 (.Y (MEM_Addr_7), .A0 (MEM_Dst_7), .A1 (MEM_Src_7), .S0 (
             MEM_Ctrl_3)) ;
    mux21_ni ix379 (.Y (MEM_Addr_6), .A0 (MEM_Dst_6), .A1 (MEM_Src_6), .S0 (
             MEM_Ctrl_3)) ;
    mux21_ni ix371 (.Y (MEM_Addr_5), .A0 (MEM_Dst_5), .A1 (MEM_Src_5), .S0 (
             MEM_Ctrl_3)) ;
    mux21_ni ix363 (.Y (MEM_Addr_4), .A0 (MEM_Dst_4), .A1 (MEM_Src_4), .S0 (
             MEM_Ctrl_3)) ;
    and04 ix513 (.Y (PC_Reset_EN), .A0 (MEM_Ctrl_2), .A1 (nx1153), .A2 (nx494), 
          .A3 (nx510)) ;
    nor02_2x ix495 (.Y (nx494), .A0 (MEM_Addr_1), .A1 (MEM_Addr_2)) ;
    nor04 ix511 (.Y (nx510), .A0 (MEM_Addr_3), .A1 (MEM_Addr_8), .A2 (MEM_Addr_9
          ), .A3 (nx474)) ;
    mux21_ni ix83 (.Y (WRB_Src_Din_0), .A0 (MEM_Din_0), .A1 (MEM_Dout_0), .S0 (
             MEM_Ctrl_1)) ;
    nand04 ix1160 (.Y (nx1159), .A0 (WRB_Ctrl_1), .A1 (nx1161), .A2 (nx1163), .A3 (
           nx1165)) ;
    xnor2 ix1162 (.Y (nx1161), .A0 (WRB_Src_18), .A1 (MEM_Src_18)) ;
    xnor2 ix1164 (.Y (nx1163), .A0 (WRB_Src_16), .A1 (MEM_Src_16)) ;
    xnor2 ix1166 (.Y (nx1165), .A0 (WRB_Src_17), .A1 (MEM_Src_17)) ;
    mux21_ni ix99 (.Y (WRB_Src_Din_1), .A0 (MEM_Din_1), .A1 (MEM_Dout_1), .S0 (
             MEM_Ctrl_1)) ;
    mux21_ni ix115 (.Y (WRB_Src_Din_2), .A0 (MEM_Din_2), .A1 (MEM_Dout_2), .S0 (
             MEM_Ctrl_1)) ;
    mux21_ni ix131 (.Y (WRB_Src_Din_3), .A0 (MEM_Din_3), .A1 (MEM_Dout_3), .S0 (
             MEM_Ctrl_1)) ;
    mux21_ni ix147 (.Y (WRB_Src_Din_4), .A0 (MEM_Din_4), .A1 (MEM_Dout_4), .S0 (
             MEM_Ctrl_1)) ;
    mux21_ni ix163 (.Y (WRB_Src_Din_5), .A0 (MEM_Din_5), .A1 (MEM_Dout_5), .S0 (
             MEM_Ctrl_1)) ;
    mux21_ni ix179 (.Y (WRB_Src_Din_6), .A0 (MEM_Din_6), .A1 (MEM_Dout_6), .S0 (
             MEM_Ctrl_1)) ;
    mux21_ni ix195 (.Y (WRB_Src_Din_7), .A0 (MEM_Din_7), .A1 (MEM_Dout_7), .S0 (
             MEM_Ctrl_1)) ;
    mux21_ni ix211 (.Y (WRB_Src_Din_8), .A0 (MEM_Din_8), .A1 (MEM_Dout_8), .S0 (
             MEM_Ctrl_1)) ;
    mux21_ni ix227 (.Y (WRB_Src_Din_9), .A0 (MEM_Din_9), .A1 (MEM_Dout_9), .S0 (
             MEM_Ctrl_1)) ;
    mux21_ni ix243 (.Y (WRB_Src_Din_10), .A0 (MEM_Din_10), .A1 (MEM_Dout_10), .S0 (
             MEM_Ctrl_1)) ;
    mux21_ni ix259 (.Y (WRB_Src_Din_11), .A0 (MEM_Din_11), .A1 (MEM_Dout_11), .S0 (
             MEM_Ctrl_1)) ;
    mux21_ni ix275 (.Y (WRB_Src_Din_12), .A0 (MEM_Din_12), .A1 (MEM_Dout_12), .S0 (
             MEM_Ctrl_1)) ;
    mux21_ni ix291 (.Y (WRB_Src_Din_13), .A0 (MEM_Din_13), .A1 (MEM_Dout_13), .S0 (
             MEM_Ctrl_1)) ;
    mux21_ni ix307 (.Y (WRB_Src_Din_14), .A0 (MEM_Din_14), .A1 (MEM_Dout_14), .S0 (
             MEM_Ctrl_1)) ;
    mux21_ni ix323 (.Y (WRB_Src_Din_15), .A0 (MEM_Din_15), .A1 (MEM_Dout_15), .S0 (
             MEM_Ctrl_1)) ;
    or03 ix441 (.Y (EXE_RST), .A0 (HARD_RST), .A1 (RESET), .A2 (Stall)) ;
    or02 ix1 (.Y (DEC_IR_Din_4), .A0 (nx1230), .A1 (Instr_4)) ;
    or02 ix3 (.Y (DEC_IR_Din_5), .A0 (nx1232), .A1 (Instr_5)) ;
    or02 ix5 (.Y (DEC_IR_Din_6), .A0 (nx1232), .A1 (Instr_6)) ;
    or02 ix7 (.Y (DEC_IR_Din_7), .A0 (nx1232), .A1 (Instr_7)) ;
    or02 ix9 (.Y (DEC_IR_Din_10), .A0 (nx1232), .A1 (Instr_10)) ;
    or02 ix11 (.Y (DEC_IR_Din_14), .A0 (nx1234), .A1 (Instr_14)) ;
    or02 ix13 (.Y (DEC_IR_Din_15), .A0 (nx1234), .A1 (Instr_15)) ;
    or04 ix453 (.Y (DEC_IR_RST), .A0 (Flush), .A1 (HARD_RST), .A2 (RESET), .A3 (
         INTR_Stall)) ;
    mux21_ni ix411 (.Y (Flags_Din_0), .A0 (MEM_Dout_10), .A1 (EXE_Flags_0), .S0 (
             EXE_Ctrl_5)) ;
    mux21_ni ix419 (.Y (Flags_Din_1), .A0 (MEM_Dout_11), .A1 (EXE_Flags_1), .S0 (
             EXE_Ctrl_5)) ;
    mux21_ni ix427 (.Y (Flags_Din_2), .A0 (MEM_Dout_12), .A1 (EXE_Flags_2), .S0 (
             EXE_Ctrl_5)) ;
    mux21_ni ix435 (.Y (Flags_Din_3), .A0 (MEM_Dout_13), .A1 (EXE_Flags_3), .S0 (
             EXE_Ctrl_5)) ;
    or02 ix437 (.Y (Flags_EN), .A0 (EXE_Ctrl_5), .A1 (MEM_Ctrl_4)) ;
    or02 ix515 (.Y (INTR_RST), .A0 (HARD_RST), .A1 (INTR_ACK)) ;
    nor03_2x ix523 (.Y (INTR_EN), .A0 (Stall), .A1 (Flush), .A2 (nx1223)) ;
    inv01 ix1224 (.Y (nx1223), .A (EXT_INTR)) ;
    inv01 ix1154 (.Y (nx1153), .A (MEM_Addr_0)) ;
    inv01 ix1229 (.Y (nx1230), .A (nx1332)) ;
    inv01 ix1231 (.Y (nx1232), .A (nx1332)) ;
    inv01 ix1233 (.Y (nx1234), .A (nx1332)) ;
    inv02 ix1235 (.Y (nx1236), .A (HAZARD_UNIT_nx1813)) ;
    inv02 ix1237 (.Y (nx1238), .A (HAZARD_UNIT_nx1813)) ;
    inv02 ix1239 (.Y (nx1240), .A (HAZARD_UNIT_nx1813)) ;
    inv02 ix1241 (.Y (nx1242), .A (nx1254)) ;
    inv02 ix1243 (.Y (nx1244), .A (nx1256)) ;
    buf02 ix1245 (.Y (nx1246), .A (DEC_Port_In_RD)) ;
    buf02 ix1247 (.Y (nx1248), .A (DEC_Port_In_RD)) ;
    inv02 ix1249 (.Y (nx1250), .A (HAZARD_UNIT_nx1820)) ;
    inv02 ix1251 (.Y (nx1252), .A (HAZARD_UNIT_nx1820)) ;
    inv02 ix1253 (.Y (nx1254), .A (DEC_Mem_EA_Load)) ;
    inv02 ix1255 (.Y (nx1256), .A (DEC_Mem_EA_Load)) ;
    nand02 REG_FILE_ix903 (.Y (REG_FILE_Reg_EN_3), .A0 (REG_FILE_nx1392), .A1 (
           nx1270)) ;
    inv01 ix1269 (.Y (nx1270), .A (REG_FILE_Reg_B_in_3)) ;
    nand02 REG_FILE_ix905 (.Y (REG_FILE_Reg_EN_4), .A0 (REG_FILE_nx1386), .A1 (
           nx1272)) ;
    inv01 ix1271 (.Y (nx1272), .A (REG_FILE_Reg_B_in_4)) ;
    nor03_2x REG_FILE_DEC_A_IN_ix11 (.Y (REG_FILE_nx1364), .A0 (
             REG_FILE_DEC_A_IN_nx179), .A1 (WRB_Dst_17), .A2 (WRB_Dst_16)) ;
    and03 REG_FILE_DEC_A_IN_ix17 (.Y (REG_FILE_nx1356), .A0 (
          REG_FILE_DEC_A_IN_nx2), .A1 (REG_FILE_DEC_A_IN_nx187), .A2 (WRB_Dst_16
          )) ;
    and03 REG_FILE_DEC_A_IN_ix23 (.Y (REG_FILE_nx1348), .A0 (
          REG_FILE_DEC_A_IN_nx2), .A1 (WRB_Dst_17), .A2 (REG_FILE_DEC_A_IN_nx184
          )) ;
    nor03_2x REG_FILE_DEC_A_IN_ix43 (.Y (REG_FILE_nx1324), .A0 (
             REG_FILE_DEC_A_IN_nx192), .A1 (WRB_Dst_17), .A2 (
             REG_FILE_DEC_A_IN_nx184)) ;
    nor03_2x REG_FILE_DEC_A_IN_ix49 (.Y (REG_FILE_nx1316), .A0 (
             REG_FILE_DEC_A_IN_nx192), .A1 (REG_FILE_DEC_A_IN_nx187), .A2 (
             WRB_Dst_16)) ;
    mux21_ni REG_FILE_ix7 (.Y (REG_FILE_Reg_Din_6__0), .A0 (WRB_Src_0), .A1 (
             WRB_Dst_0), .S0 (nx1292)) ;
    mux21_ni REG_FILE_ix15 (.Y (REG_FILE_Reg_Din_6__1), .A0 (WRB_Src_1), .A1 (
             WRB_Dst_1), .S0 (nx1292)) ;
    mux21_ni REG_FILE_ix23 (.Y (REG_FILE_Reg_Din_6__2), .A0 (WRB_Src_2), .A1 (
             WRB_Dst_2), .S0 (nx1292)) ;
    mux21_ni REG_FILE_ix31 (.Y (REG_FILE_Reg_Din_6__3), .A0 (WRB_Src_3), .A1 (
             WRB_Dst_3), .S0 (nx1292)) ;
    mux21_ni REG_FILE_ix39 (.Y (REG_FILE_Reg_Din_6__4), .A0 (WRB_Src_4), .A1 (
             WRB_Dst_4), .S0 (nx1292)) ;
    mux21_ni REG_FILE_ix47 (.Y (REG_FILE_Reg_Din_6__5), .A0 (WRB_Src_5), .A1 (
             WRB_Dst_5), .S0 (nx1292)) ;
    mux21_ni REG_FILE_ix55 (.Y (REG_FILE_Reg_Din_6__6), .A0 (WRB_Src_6), .A1 (
             WRB_Dst_6), .S0 (nx1294)) ;
    mux21_ni REG_FILE_ix63 (.Y (REG_FILE_Reg_Din_6__7), .A0 (WRB_Src_7), .A1 (
             WRB_Dst_7), .S0 (nx1294)) ;
    mux21_ni REG_FILE_ix71 (.Y (REG_FILE_Reg_Din_6__8), .A0 (WRB_Src_8), .A1 (
             WRB_Dst_8), .S0 (nx1294)) ;
    mux21_ni REG_FILE_ix79 (.Y (REG_FILE_Reg_Din_6__9), .A0 (WRB_Src_9), .A1 (
             WRB_Dst_9), .S0 (nx1294)) ;
    mux21_ni REG_FILE_ix87 (.Y (REG_FILE_Reg_Din_6__10), .A0 (WRB_Src_10), .A1 (
             WRB_Dst_10), .S0 (nx1294)) ;
    mux21_ni REG_FILE_ix95 (.Y (REG_FILE_Reg_Din_6__11), .A0 (WRB_Src_11), .A1 (
             WRB_Dst_11), .S0 (nx1294)) ;
    mux21_ni REG_FILE_ix103 (.Y (REG_FILE_Reg_Din_6__12), .A0 (WRB_Src_12), .A1 (
             WRB_Dst_12), .S0 (nx1294)) ;
    mux21_ni REG_FILE_ix111 (.Y (REG_FILE_Reg_Din_6__13), .A0 (WRB_Src_13), .A1 (
             WRB_Dst_13), .S0 (nx1296)) ;
    mux21_ni REG_FILE_ix119 (.Y (REG_FILE_Reg_Din_6__14), .A0 (WRB_Src_14), .A1 (
             WRB_Dst_14), .S0 (nx1296)) ;
    mux21_ni REG_FILE_ix127 (.Y (REG_FILE_Reg_Din_6__15), .A0 (WRB_Src_15), .A1 (
             WRB_Dst_15), .S0 (nx1296)) ;
    mux21_ni REG_FILE_ix135 (.Y (REG_FILE_Reg_Din_5__0), .A0 (WRB_Src_0), .A1 (
             WRB_Dst_0), .S0 (nx1300)) ;
    mux21_ni REG_FILE_ix143 (.Y (REG_FILE_Reg_Din_5__1), .A0 (WRB_Src_1), .A1 (
             WRB_Dst_1), .S0 (nx1300)) ;
    mux21_ni REG_FILE_ix151 (.Y (REG_FILE_Reg_Din_5__2), .A0 (WRB_Src_2), .A1 (
             WRB_Dst_2), .S0 (nx1300)) ;
    mux21_ni REG_FILE_ix159 (.Y (REG_FILE_Reg_Din_5__3), .A0 (WRB_Src_3), .A1 (
             WRB_Dst_3), .S0 (nx1300)) ;
    mux21_ni REG_FILE_ix167 (.Y (REG_FILE_Reg_Din_5__4), .A0 (WRB_Src_4), .A1 (
             WRB_Dst_4), .S0 (nx1300)) ;
    mux21_ni REG_FILE_ix175 (.Y (REG_FILE_Reg_Din_5__5), .A0 (WRB_Src_5), .A1 (
             WRB_Dst_5), .S0 (nx1300)) ;
    mux21_ni REG_FILE_ix183 (.Y (REG_FILE_Reg_Din_5__6), .A0 (WRB_Src_6), .A1 (
             WRB_Dst_6), .S0 (nx1302)) ;
    mux21_ni REG_FILE_ix191 (.Y (REG_FILE_Reg_Din_5__7), .A0 (WRB_Src_7), .A1 (
             WRB_Dst_7), .S0 (nx1302)) ;
    mux21_ni REG_FILE_ix199 (.Y (REG_FILE_Reg_Din_5__8), .A0 (WRB_Src_8), .A1 (
             WRB_Dst_8), .S0 (nx1302)) ;
    mux21_ni REG_FILE_ix207 (.Y (REG_FILE_Reg_Din_5__9), .A0 (WRB_Src_9), .A1 (
             WRB_Dst_9), .S0 (nx1302)) ;
    mux21_ni REG_FILE_ix215 (.Y (REG_FILE_Reg_Din_5__10), .A0 (WRB_Src_10), .A1 (
             WRB_Dst_10), .S0 (nx1302)) ;
    mux21_ni REG_FILE_ix223 (.Y (REG_FILE_Reg_Din_5__11), .A0 (WRB_Src_11), .A1 (
             WRB_Dst_11), .S0 (nx1302)) ;
    mux21_ni REG_FILE_ix231 (.Y (REG_FILE_Reg_Din_5__12), .A0 (WRB_Src_12), .A1 (
             WRB_Dst_12), .S0 (nx1302)) ;
    mux21_ni REG_FILE_ix239 (.Y (REG_FILE_Reg_Din_5__13), .A0 (WRB_Src_13), .A1 (
             WRB_Dst_13), .S0 (nx1304)) ;
    mux21_ni REG_FILE_ix247 (.Y (REG_FILE_Reg_Din_5__14), .A0 (WRB_Src_14), .A1 (
             WRB_Dst_14), .S0 (nx1304)) ;
    mux21_ni REG_FILE_ix255 (.Y (REG_FILE_Reg_Din_5__15), .A0 (WRB_Src_15), .A1 (
             WRB_Dst_15), .S0 (nx1304)) ;
    mux21_ni REG_FILE_ix263 (.Y (REG_FILE_Reg_Din_4__0), .A0 (WRB_Src_0), .A1 (
             WRB_Dst_0), .S0 (nx1278)) ;
    mux21_ni REG_FILE_ix271 (.Y (REG_FILE_Reg_Din_4__1), .A0 (WRB_Src_1), .A1 (
             WRB_Dst_1), .S0 (nx1278)) ;
    mux21_ni REG_FILE_ix279 (.Y (REG_FILE_Reg_Din_4__2), .A0 (WRB_Src_2), .A1 (
             WRB_Dst_2), .S0 (nx1278)) ;
    mux21_ni REG_FILE_ix287 (.Y (REG_FILE_Reg_Din_4__3), .A0 (WRB_Src_3), .A1 (
             WRB_Dst_3), .S0 (nx1278)) ;
    mux21_ni REG_FILE_ix295 (.Y (REG_FILE_Reg_Din_4__4), .A0 (WRB_Src_4), .A1 (
             WRB_Dst_4), .S0 (nx1278)) ;
    mux21_ni REG_FILE_ix303 (.Y (REG_FILE_Reg_Din_4__5), .A0 (WRB_Src_5), .A1 (
             WRB_Dst_5), .S0 (nx1278)) ;
    mux21_ni REG_FILE_ix311 (.Y (REG_FILE_Reg_Din_4__6), .A0 (WRB_Src_6), .A1 (
             WRB_Dst_6), .S0 (nx1278)) ;
    mux21_ni REG_FILE_ix319 (.Y (REG_FILE_Reg_Din_4__7), .A0 (WRB_Src_7), .A1 (
             WRB_Dst_7), .S0 (nx1280)) ;
    mux21_ni REG_FILE_ix327 (.Y (REG_FILE_Reg_Din_4__8), .A0 (WRB_Src_8), .A1 (
             WRB_Dst_8), .S0 (nx1280)) ;
    mux21_ni REG_FILE_ix335 (.Y (REG_FILE_Reg_Din_4__9), .A0 (WRB_Src_9), .A1 (
             WRB_Dst_9), .S0 (nx1280)) ;
    mux21_ni REG_FILE_ix343 (.Y (REG_FILE_Reg_Din_4__10), .A0 (WRB_Src_10), .A1 (
             WRB_Dst_10), .S0 (nx1280)) ;
    mux21_ni REG_FILE_ix351 (.Y (REG_FILE_Reg_Din_4__11), .A0 (WRB_Src_11), .A1 (
             WRB_Dst_11), .S0 (nx1280)) ;
    mux21_ni REG_FILE_ix359 (.Y (REG_FILE_Reg_Din_4__12), .A0 (WRB_Src_12), .A1 (
             WRB_Dst_12), .S0 (nx1280)) ;
    mux21_ni REG_FILE_ix367 (.Y (REG_FILE_Reg_Din_4__13), .A0 (WRB_Src_13), .A1 (
             WRB_Dst_13), .S0 (nx1280)) ;
    mux21_ni REG_FILE_ix375 (.Y (REG_FILE_Reg_Din_4__14), .A0 (WRB_Src_14), .A1 (
             WRB_Dst_14), .S0 (nx1282)) ;
    mux21_ni REG_FILE_ix383 (.Y (REG_FILE_Reg_Din_4__15), .A0 (WRB_Src_15), .A1 (
             WRB_Dst_15), .S0 (nx1282)) ;
    mux21_ni REG_FILE_ix391 (.Y (REG_FILE_Reg_Din_3__0), .A0 (WRB_Src_0), .A1 (
             WRB_Dst_0), .S0 (nx1284)) ;
    mux21_ni REG_FILE_ix399 (.Y (REG_FILE_Reg_Din_3__1), .A0 (WRB_Src_1), .A1 (
             WRB_Dst_1), .S0 (nx1284)) ;
    mux21_ni REG_FILE_ix407 (.Y (REG_FILE_Reg_Din_3__2), .A0 (WRB_Src_2), .A1 (
             WRB_Dst_2), .S0 (nx1284)) ;
    mux21_ni REG_FILE_ix415 (.Y (REG_FILE_Reg_Din_3__3), .A0 (WRB_Src_3), .A1 (
             WRB_Dst_3), .S0 (nx1284)) ;
    mux21_ni REG_FILE_ix423 (.Y (REG_FILE_Reg_Din_3__4), .A0 (WRB_Src_4), .A1 (
             WRB_Dst_4), .S0 (nx1284)) ;
    mux21_ni REG_FILE_ix431 (.Y (REG_FILE_Reg_Din_3__5), .A0 (WRB_Src_5), .A1 (
             WRB_Dst_5), .S0 (nx1284)) ;
    mux21_ni REG_FILE_ix439 (.Y (REG_FILE_Reg_Din_3__6), .A0 (WRB_Src_6), .A1 (
             WRB_Dst_6), .S0 (nx1284)) ;
    mux21_ni REG_FILE_ix447 (.Y (REG_FILE_Reg_Din_3__7), .A0 (WRB_Src_7), .A1 (
             WRB_Dst_7), .S0 (nx1286)) ;
    mux21_ni REG_FILE_ix455 (.Y (REG_FILE_Reg_Din_3__8), .A0 (WRB_Src_8), .A1 (
             WRB_Dst_8), .S0 (nx1286)) ;
    mux21_ni REG_FILE_ix463 (.Y (REG_FILE_Reg_Din_3__9), .A0 (WRB_Src_9), .A1 (
             WRB_Dst_9), .S0 (nx1286)) ;
    mux21_ni REG_FILE_ix471 (.Y (REG_FILE_Reg_Din_3__10), .A0 (WRB_Src_10), .A1 (
             WRB_Dst_10), .S0 (nx1286)) ;
    mux21_ni REG_FILE_ix479 (.Y (REG_FILE_Reg_Din_3__11), .A0 (WRB_Src_11), .A1 (
             WRB_Dst_11), .S0 (nx1286)) ;
    mux21_ni REG_FILE_ix487 (.Y (REG_FILE_Reg_Din_3__12), .A0 (WRB_Src_12), .A1 (
             WRB_Dst_12), .S0 (nx1286)) ;
    mux21_ni REG_FILE_ix495 (.Y (REG_FILE_Reg_Din_3__13), .A0 (WRB_Src_13), .A1 (
             WRB_Dst_13), .S0 (nx1286)) ;
    mux21_ni REG_FILE_ix503 (.Y (REG_FILE_Reg_Din_3__14), .A0 (WRB_Src_14), .A1 (
             WRB_Dst_14), .S0 (nx1288)) ;
    mux21_ni REG_FILE_ix511 (.Y (REG_FILE_Reg_Din_3__15), .A0 (WRB_Src_15), .A1 (
             WRB_Dst_15), .S0 (nx1288)) ;
    mux21_ni REG_FILE_ix519 (.Y (REG_FILE_Reg_Din_2__0), .A0 (WRB_Src_0), .A1 (
             WRB_Dst_0), .S0 (nx1308)) ;
    mux21_ni REG_FILE_ix527 (.Y (REG_FILE_Reg_Din_2__1), .A0 (WRB_Src_1), .A1 (
             WRB_Dst_1), .S0 (nx1308)) ;
    mux21_ni REG_FILE_ix535 (.Y (REG_FILE_Reg_Din_2__2), .A0 (WRB_Src_2), .A1 (
             WRB_Dst_2), .S0 (nx1308)) ;
    mux21_ni REG_FILE_ix543 (.Y (REG_FILE_Reg_Din_2__3), .A0 (WRB_Src_3), .A1 (
             WRB_Dst_3), .S0 (nx1308)) ;
    mux21_ni REG_FILE_ix551 (.Y (REG_FILE_Reg_Din_2__4), .A0 (WRB_Src_4), .A1 (
             WRB_Dst_4), .S0 (nx1308)) ;
    mux21_ni REG_FILE_ix559 (.Y (REG_FILE_Reg_Din_2__5), .A0 (WRB_Src_5), .A1 (
             WRB_Dst_5), .S0 (nx1308)) ;
    mux21_ni REG_FILE_ix567 (.Y (REG_FILE_Reg_Din_2__6), .A0 (WRB_Src_6), .A1 (
             WRB_Dst_6), .S0 (nx1310)) ;
    mux21_ni REG_FILE_ix575 (.Y (REG_FILE_Reg_Din_2__7), .A0 (WRB_Src_7), .A1 (
             WRB_Dst_7), .S0 (nx1310)) ;
    mux21_ni REG_FILE_ix583 (.Y (REG_FILE_Reg_Din_2__8), .A0 (WRB_Src_8), .A1 (
             WRB_Dst_8), .S0 (nx1310)) ;
    mux21_ni REG_FILE_ix591 (.Y (REG_FILE_Reg_Din_2__9), .A0 (WRB_Src_9), .A1 (
             WRB_Dst_9), .S0 (nx1310)) ;
    mux21_ni REG_FILE_ix599 (.Y (REG_FILE_Reg_Din_2__10), .A0 (WRB_Src_10), .A1 (
             WRB_Dst_10), .S0 (nx1310)) ;
    mux21_ni REG_FILE_ix607 (.Y (REG_FILE_Reg_Din_2__11), .A0 (WRB_Src_11), .A1 (
             WRB_Dst_11), .S0 (nx1310)) ;
    mux21_ni REG_FILE_ix615 (.Y (REG_FILE_Reg_Din_2__12), .A0 (WRB_Src_12), .A1 (
             WRB_Dst_12), .S0 (nx1310)) ;
    mux21_ni REG_FILE_ix623 (.Y (REG_FILE_Reg_Din_2__13), .A0 (WRB_Src_13), .A1 (
             WRB_Dst_13), .S0 (nx1312)) ;
    mux21_ni REG_FILE_ix631 (.Y (REG_FILE_Reg_Din_2__14), .A0 (WRB_Src_14), .A1 (
             WRB_Dst_14), .S0 (nx1312)) ;
    mux21_ni REG_FILE_ix639 (.Y (REG_FILE_Reg_Din_2__15), .A0 (WRB_Src_15), .A1 (
             WRB_Dst_15), .S0 (nx1312)) ;
    mux21_ni REG_FILE_ix647 (.Y (REG_FILE_Reg_Din_1__0), .A0 (WRB_Src_0), .A1 (
             WRB_Dst_0), .S0 (nx1316)) ;
    mux21_ni REG_FILE_ix655 (.Y (REG_FILE_Reg_Din_1__1), .A0 (WRB_Src_1), .A1 (
             WRB_Dst_1), .S0 (nx1316)) ;
    mux21_ni REG_FILE_ix663 (.Y (REG_FILE_Reg_Din_1__2), .A0 (WRB_Src_2), .A1 (
             WRB_Dst_2), .S0 (nx1316)) ;
    mux21_ni REG_FILE_ix671 (.Y (REG_FILE_Reg_Din_1__3), .A0 (WRB_Src_3), .A1 (
             WRB_Dst_3), .S0 (nx1316)) ;
    mux21_ni REG_FILE_ix679 (.Y (REG_FILE_Reg_Din_1__4), .A0 (WRB_Src_4), .A1 (
             WRB_Dst_4), .S0 (nx1316)) ;
    mux21_ni REG_FILE_ix687 (.Y (REG_FILE_Reg_Din_1__5), .A0 (WRB_Src_5), .A1 (
             WRB_Dst_5), .S0 (nx1316)) ;
    mux21_ni REG_FILE_ix695 (.Y (REG_FILE_Reg_Din_1__6), .A0 (WRB_Src_6), .A1 (
             WRB_Dst_6), .S0 (nx1318)) ;
    mux21_ni REG_FILE_ix703 (.Y (REG_FILE_Reg_Din_1__7), .A0 (WRB_Src_7), .A1 (
             WRB_Dst_7), .S0 (nx1318)) ;
    mux21_ni REG_FILE_ix711 (.Y (REG_FILE_Reg_Din_1__8), .A0 (WRB_Src_8), .A1 (
             WRB_Dst_8), .S0 (nx1318)) ;
    mux21_ni REG_FILE_ix719 (.Y (REG_FILE_Reg_Din_1__9), .A0 (WRB_Src_9), .A1 (
             WRB_Dst_9), .S0 (nx1318)) ;
    mux21_ni REG_FILE_ix727 (.Y (REG_FILE_Reg_Din_1__10), .A0 (WRB_Src_10), .A1 (
             WRB_Dst_10), .S0 (nx1318)) ;
    mux21_ni REG_FILE_ix735 (.Y (REG_FILE_Reg_Din_1__11), .A0 (WRB_Src_11), .A1 (
             WRB_Dst_11), .S0 (nx1318)) ;
    mux21_ni REG_FILE_ix743 (.Y (REG_FILE_Reg_Din_1__12), .A0 (WRB_Src_12), .A1 (
             WRB_Dst_12), .S0 (nx1318)) ;
    mux21_ni REG_FILE_ix751 (.Y (REG_FILE_Reg_Din_1__13), .A0 (WRB_Src_13), .A1 (
             WRB_Dst_13), .S0 (nx1320)) ;
    mux21_ni REG_FILE_ix759 (.Y (REG_FILE_Reg_Din_1__14), .A0 (WRB_Src_14), .A1 (
             WRB_Dst_14), .S0 (nx1320)) ;
    mux21_ni REG_FILE_ix767 (.Y (REG_FILE_Reg_Din_1__15), .A0 (WRB_Src_15), .A1 (
             WRB_Dst_15), .S0 (nx1320)) ;
    mux21_ni REG_FILE_ix775 (.Y (REG_FILE_Reg_Din_0__0), .A0 (WRB_Src_0), .A1 (
             WRB_Dst_0), .S0 (nx1324)) ;
    mux21_ni REG_FILE_ix783 (.Y (REG_FILE_Reg_Din_0__1), .A0 (WRB_Src_1), .A1 (
             WRB_Dst_1), .S0 (nx1324)) ;
    mux21_ni REG_FILE_ix791 (.Y (REG_FILE_Reg_Din_0__2), .A0 (WRB_Src_2), .A1 (
             WRB_Dst_2), .S0 (nx1324)) ;
    mux21_ni REG_FILE_ix799 (.Y (REG_FILE_Reg_Din_0__3), .A0 (WRB_Src_3), .A1 (
             WRB_Dst_3), .S0 (nx1324)) ;
    mux21_ni REG_FILE_ix807 (.Y (REG_FILE_Reg_Din_0__4), .A0 (WRB_Src_4), .A1 (
             WRB_Dst_4), .S0 (nx1324)) ;
    mux21_ni REG_FILE_ix815 (.Y (REG_FILE_Reg_Din_0__5), .A0 (WRB_Src_5), .A1 (
             WRB_Dst_5), .S0 (nx1324)) ;
    mux21_ni REG_FILE_ix823 (.Y (REG_FILE_Reg_Din_0__6), .A0 (WRB_Src_6), .A1 (
             WRB_Dst_6), .S0 (nx1326)) ;
    mux21_ni REG_FILE_ix831 (.Y (REG_FILE_Reg_Din_0__7), .A0 (WRB_Src_7), .A1 (
             WRB_Dst_7), .S0 (nx1326)) ;
    mux21_ni REG_FILE_ix839 (.Y (REG_FILE_Reg_Din_0__8), .A0 (WRB_Src_8), .A1 (
             WRB_Dst_8), .S0 (nx1326)) ;
    mux21_ni REG_FILE_ix847 (.Y (REG_FILE_Reg_Din_0__9), .A0 (WRB_Src_9), .A1 (
             WRB_Dst_9), .S0 (nx1326)) ;
    mux21_ni REG_FILE_ix855 (.Y (REG_FILE_Reg_Din_0__10), .A0 (WRB_Src_10), .A1 (
             WRB_Dst_10), .S0 (nx1326)) ;
    mux21_ni REG_FILE_ix863 (.Y (REG_FILE_Reg_Din_0__11), .A0 (WRB_Src_11), .A1 (
             WRB_Dst_11), .S0 (nx1326)) ;
    mux21_ni REG_FILE_ix871 (.Y (REG_FILE_Reg_Din_0__12), .A0 (WRB_Src_12), .A1 (
             WRB_Dst_12), .S0 (nx1326)) ;
    mux21_ni REG_FILE_ix879 (.Y (REG_FILE_Reg_Din_0__13), .A0 (WRB_Src_13), .A1 (
             WRB_Dst_13), .S0 (nx1328)) ;
    mux21_ni REG_FILE_ix887 (.Y (REG_FILE_Reg_Din_0__14), .A0 (WRB_Src_14), .A1 (
             WRB_Dst_14), .S0 (nx1328)) ;
    mux21_ni REG_FILE_ix895 (.Y (REG_FILE_Reg_Din_0__15), .A0 (WRB_Src_15), .A1 (
             WRB_Dst_15), .S0 (nx1328)) ;
    and02 HAZARD_UNIT_ix131 (.Y (HAZARD_UNIT_nx130), .A0 (nx1254), .A1 (nx1246)
          ) ;
    or03 HAZARD_UNIT_ix125 (.Y (HAZARD_UNIT_nx2220), .A0 (nx1246), .A1 (
         DEC_Shift_Load), .A2 (nx1242)) ;
    and03 HAZARD_UNIT_ix263 (.Y (HAZARD_UNIT_nx262), .A0 (nx1274), .A1 (
          DEC_Shift_Load), .A2 (nx1256)) ;
    inv01 ix1273 (.Y (nx1274), .A (nx1246)) ;
    nor02ii HAZARD_UNIT_ix1181 (.Y (HAZARD_UNIT_nx1180), .A0 (HAZARD_UNIT_nx1811
            ), .A1 (HAZARD_UNIT_nx1820)) ;
    or03 HAZARD_UNIT_ix1197 (.Y (HAZARD_UNIT_nx1868), .A0 (HAZARD_UNIT_nx1160), 
         .A1 (RESET), .A2 (nx1230)) ;
    ao22 HAZARD_UNIT_ix2009 (.Y (HAZARD_UNIT_nx1532), .A0 (DEC_IR_Dout_3), .A1 (
         nx1244), .B0 (PORT_IN[0]), .B1 (HAZARD_UNIT_nx2230)) ;
    ao22 HAZARD_UNIT_ix2014 (.Y (HAZARD_UNIT_nx1518), .A0 (DEC_IR_Dout_4), .A1 (
         nx1244), .B0 (PORT_IN[1]), .B1 (HAZARD_UNIT_nx2230)) ;
    and02 HAZARD_UNIT_ix499 (.Y (HAZARD_UNIT_nx498), .A0 (HAZARD_UNIT_nx1813), .A1 (
          DEC_PC_Flags_Save)) ;
    nor02ii HAZARD_UNIT_ix2271 (.Y (HAZARD_UNIT_nx2272), .A0 (HAZARD_UNIT_nx1811
            ), .A1 (HAZARD_UNIT_nx1820)) ;
    nand03 HAZARD_UNIT_ix527 (.Y (HAZARD_UNIT_nx2236), .A0 (HAZARD_UNIT_nx1813)
           , .A1 (nx1276), .A2 (DEC_Mem_Addr_Switch)) ;
    inv01 ix1275 (.Y (nx1276), .A (DEC_PC_Flags_Save)) ;
    mux21_ni ix75 (.Y (MEM_Din_0), .A0 (MEM_Src_0), .A1 (WRB_Src_0), .S0 (nx1340
             )) ;
    mux21_ni ix91 (.Y (MEM_Din_1), .A0 (MEM_Src_1), .A1 (WRB_Src_1), .S0 (nx1340
             )) ;
    mux21_ni ix107 (.Y (MEM_Din_2), .A0 (MEM_Src_2), .A1 (WRB_Src_2), .S0 (
             nx1340)) ;
    mux21_ni ix123 (.Y (MEM_Din_3), .A0 (MEM_Src_3), .A1 (WRB_Src_3), .S0 (
             nx1340)) ;
    mux21_ni ix139 (.Y (MEM_Din_4), .A0 (MEM_Src_4), .A1 (WRB_Src_4), .S0 (
             nx1340)) ;
    mux21_ni ix155 (.Y (MEM_Din_5), .A0 (MEM_Src_5), .A1 (WRB_Src_5), .S0 (
             nx1340)) ;
    mux21_ni ix171 (.Y (MEM_Din_6), .A0 (MEM_Src_6), .A1 (WRB_Src_6), .S0 (
             nx1340)) ;
    mux21_ni ix187 (.Y (MEM_Din_7), .A0 (MEM_Src_7), .A1 (WRB_Src_7), .S0 (
             nx1342)) ;
    mux21_ni ix203 (.Y (MEM_Din_8), .A0 (MEM_Src_8), .A1 (WRB_Src_8), .S0 (
             nx1342)) ;
    mux21_ni ix219 (.Y (MEM_Din_9), .A0 (MEM_Src_9), .A1 (WRB_Src_9), .S0 (
             nx1342)) ;
    mux21_ni ix235 (.Y (MEM_Din_10), .A0 (MEM_Src_10), .A1 (WRB_Src_10), .S0 (
             nx1342)) ;
    mux21_ni ix251 (.Y (MEM_Din_11), .A0 (MEM_Src_11), .A1 (WRB_Src_11), .S0 (
             nx1342)) ;
    mux21_ni ix267 (.Y (MEM_Din_12), .A0 (MEM_Src_12), .A1 (WRB_Src_12), .S0 (
             nx1342)) ;
    mux21_ni ix283 (.Y (MEM_Din_13), .A0 (MEM_Src_13), .A1 (WRB_Src_13), .S0 (
             nx1342)) ;
    mux21_ni ix299 (.Y (MEM_Din_14), .A0 (MEM_Src_14), .A1 (WRB_Src_14), .S0 (
             nx1344)) ;
    mux21_ni ix315 (.Y (MEM_Din_15), .A0 (MEM_Src_15), .A1 (WRB_Src_15), .S0 (
             nx1344)) ;
    nor02ii ix447 (.Y (DEC_PC_To_Store_EN), .A0 (Stall), .A1 (nx1332)) ;
    and02 ix17 (.Y (DEC_IR_Din_0), .A0 (nx1332), .A1 (Instr_0)) ;
    and02 ix21 (.Y (DEC_IR_Din_1), .A0 (nx1334), .A1 (Instr_1)) ;
    and02 ix25 (.Y (DEC_IR_Din_2), .A0 (nx1334), .A1 (Instr_2)) ;
    and02 ix29 (.Y (DEC_IR_Din_3), .A0 (nx1334), .A1 (Instr_3)) ;
    and02 ix33 (.Y (DEC_IR_Din_8), .A0 (nx1334), .A1 (Instr_8)) ;
    and02 ix37 (.Y (DEC_IR_Din_9), .A0 (nx1334), .A1 (Instr_9)) ;
    and02 ix41 (.Y (DEC_IR_Din_11), .A0 (nx1334), .A1 (Instr_11)) ;
    and02 ix45 (.Y (DEC_IR_Din_12), .A0 (nx1334), .A1 (Instr_12)) ;
    and02 ix49 (.Y (DEC_IR_Din_13), .A0 (nx1336), .A1 (Instr_13)) ;
    inv02 ix1277 (.Y (nx1278), .A (REG_FILE_nx1386)) ;
    inv02 ix1279 (.Y (nx1280), .A (REG_FILE_nx1386)) ;
    inv02 ix1281 (.Y (nx1282), .A (REG_FILE_nx1386)) ;
    inv02 ix1283 (.Y (nx1284), .A (REG_FILE_nx1392)) ;
    inv02 ix1285 (.Y (nx1286), .A (REG_FILE_nx1392)) ;
    inv02 ix1287 (.Y (nx1288), .A (REG_FILE_nx1392)) ;
    inv01 ix1289 (.Y (nx1290), .A (REG_FILE_nx1316)) ;
    inv02 ix1291 (.Y (nx1292), .A (nx1290)) ;
    inv02 ix1293 (.Y (nx1294), .A (nx1290)) ;
    inv02 ix1295 (.Y (nx1296), .A (nx1290)) ;
    inv01 ix1297 (.Y (nx1298), .A (REG_FILE_nx1324)) ;
    inv02 ix1299 (.Y (nx1300), .A (nx1298)) ;
    inv02 ix1301 (.Y (nx1302), .A (nx1298)) ;
    inv02 ix1303 (.Y (nx1304), .A (nx1298)) ;
    inv01 ix1305 (.Y (nx1306), .A (REG_FILE_nx1348)) ;
    inv02 ix1307 (.Y (nx1308), .A (nx1306)) ;
    inv02 ix1309 (.Y (nx1310), .A (nx1306)) ;
    inv02 ix1311 (.Y (nx1312), .A (nx1306)) ;
    inv01 ix1313 (.Y (nx1314), .A (REG_FILE_nx1356)) ;
    inv02 ix1315 (.Y (nx1316), .A (nx1314)) ;
    inv02 ix1317 (.Y (nx1318), .A (nx1314)) ;
    inv02 ix1319 (.Y (nx1320), .A (nx1314)) ;
    inv01 ix1321 (.Y (nx1322), .A (REG_FILE_nx1364)) ;
    inv02 ix1323 (.Y (nx1324), .A (nx1322)) ;
    inv02 ix1325 (.Y (nx1326), .A (nx1322)) ;
    inv02 ix1327 (.Y (nx1328), .A (nx1322)) ;
    buf02 ix1329 (.Y (nx1330), .A (HAZARD_UNIT_nx1180)) ;
    inv02 ix1331 (.Y (nx1332), .A (INTR)) ;
    inv02 ix1333 (.Y (nx1334), .A (INTR)) ;
    inv02 ix1335 (.Y (nx1336), .A (INTR)) ;
    buf02 ix1337 (.Y (nx1338), .A (HAZARD_UNIT_nx2272)) ;
    inv02 ix1339 (.Y (nx1340), .A (nx1159)) ;
    inv02 ix1341 (.Y (nx1342), .A (nx1159)) ;
    inv02 ix1343 (.Y (nx1344), .A (nx1159)) ;
endmodule


module tri_state_buffer_16 ( Din, S, Dout ) ;

    input [15:0]Din ;
    input S ;
    output [15:0]Dout ;




endmodule


module register_edge_rising_16 ( CLK, RST, EN, Din, Dout ) ;

    input CLK ;
    input RST ;
    input EN ;
    input [15:0]Din ;
    output [15:0]Dout ;




endmodule


module register_edge_rising_2 ( CLK, RST, EN, Din, Dout ) ;

    input CLK ;
    input RST ;
    input EN ;
    input [1:0]Din ;
    output [1:0]Dout ;




endmodule


module register_edge_rising_5 ( CLK, RST, EN, Din, Dout ) ;

    input CLK ;
    input RST ;
    input EN ;
    input [4:0]Din ;
    output [4:0]Dout ;




endmodule


module register_edge_rising_20 ( CLK, RST, EN, Din, Dout ) ;

    input CLK ;
    input RST ;
    input EN ;
    input [19:0]Din ;
    output [19:0]Dout ;




endmodule


module register_edge_rising_4 ( CLK, RST, EN, Din, Dout ) ;

    input CLK ;
    input RST ;
    input EN ;
    input [3:0]Din ;
    output [3:0]Dout ;




endmodule


module ALU_16 ( Opr, A, B, Cin, Res1, Res2, Flags ) ;

    input [3:0]Opr ;
    input [15:0]A ;
    input [15:0]B ;
    input Cin ;
    output [15:0]Res1 ;
    output [15:0]Res2 ;
    output [3:0]Flags ;




endmodule


module register_edge_falling_20 ( CLK, RST, EN, Din, Dout ) ;

    input CLK ;
    input RST ;
    input EN ;
    input [19:0]Din ;
    output [19:0]Dout ;




endmodule


module register_edge_falling_10 ( CLK, RST, EN, Din, Dout ) ;

    input CLK ;
    input RST ;
    input EN ;
    input [9:0]Din ;
    output [9:0]Dout ;




endmodule


module register_edge_falling_16 ( CLK, RST, EN, Din, Dout ) ;

    input CLK ;
    input RST ;
    input EN ;
    input [15:0]Din ;
    output [15:0]Dout ;




endmodule


module register_edge_rising_10 ( CLK, RST, EN, Din, Dout ) ;

    input CLK ;
    input RST ;
    input EN ;
    input [9:0]Din ;
    output [9:0]Dout ;




endmodule


module RAM_16_10 ( CLK, WR, Address, Din, Dout ) ;

    input CLK ;
    input WR ;
    input [9:0]Address ;
    input [15:0]Din ;
    output [15:0]Dout ;




endmodule

