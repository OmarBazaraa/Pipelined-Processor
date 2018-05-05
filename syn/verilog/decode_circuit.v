//
// Verilog description for cell decode_circuit, 
// Sat May  5 04:07:04 2018
//
// LeonardoSpectrum Level 3, 2017a.2 
//


module decode_circuit ( Instr, Flags, Rsrc, Rsrc_WB, Rsrc_Load, Rdst, Rdst_WB, 
                        Rdst_Load, Immediate_Load, Shift_Load, Shift_Val, 
                        ALU_Opr, Flags_EN, Flags_Restore, Mem_EA, Mem_EA_Load, 
                        Mem_Addr_Switch, Mem_RD, Mem_WR, Port_In_RD, Port_Out_WR, 
                        PC_Flags_Save, Branch_Taken, Intr_Ack ) ;

    input [15:0]Instr ;
    input [3:0]Flags ;
    output [2:0]Rsrc ;
    output Rsrc_WB ;
    output Rsrc_Load ;
    output [2:0]Rdst ;
    output Rdst_WB ;
    output Rdst_Load ;
    output Immediate_Load ;
    output Shift_Load ;
    output [3:0]Shift_Val ;
    output [3:0]ALU_Opr ;
    output Flags_EN ;
    output Flags_Restore ;
    output [9:0]Mem_EA ;
    output Mem_EA_Load ;
    output Mem_Addr_Switch ;
    output Mem_RD ;
    output Mem_WR ;
    output Port_In_RD ;
    output Port_Out_WR ;
    output PC_Flags_Save ;
    output Branch_Taken ;
    output Intr_Ack ;

    wire nx26, nx86, nx166, nx176, nx182, nx186, nx188, nx192, nx196, nx202, 
         nx204, nx206, nx212, nx215, nx218, nx227;



    assign Rsrc[2] = Instr[2] ;
    assign Rsrc[1] = Instr[1] ;
    assign Rsrc[0] = Instr[0] ;
    assign Rdst[2] = Instr[5] ;
    assign Rdst[1] = Instr[4] ;
    assign Rdst[0] = Instr[3] ;
    assign Shift_Val[3] = Instr[9] ;
    assign Shift_Val[2] = Instr[8] ;
    assign Shift_Val[1] = Instr[7] ;
    assign Shift_Val[0] = Instr[6] ;
    assign Mem_EA[9] = Instr[12] ;
    assign Mem_EA[8] = Instr[11] ;
    assign Mem_EA[7] = Instr[10] ;
    assign Mem_EA[6] = Instr[9] ;
    assign Mem_EA[5] = Instr[8] ;
    assign Mem_EA[4] = Instr[7] ;
    assign Mem_EA[3] = Instr[6] ;
    assign Mem_EA[2] = Instr[5] ;
    assign Mem_EA[1] = Instr[4] ;
    assign Mem_EA[0] = Instr[3] ;
    and03 ix125 (.Y (Shift_Load), .A0 (ALU_Opr[3]), .A1 (Instr[11]), .A2 (
          Instr[12])) ;
    and02 ix53 (.Y (ALU_Opr[3]), .A0 (Instr[13]), .A1 (nx227)) ;
    inv01 ix177 (.Y (nx176), .A (Instr[15])) ;
    nor02ii ix65 (.Y (Intr_Ack), .A0 (nx26), .A1 (Instr[6])) ;
    nand02 ix27 (.Y (nx26), .A0 (Instr[14]), .A1 (Instr[15])) ;
    and04 ix93 (.Y (Branch_Taken), .A0 (nx86), .A1 (Instr[11]), .A2 (Instr[14])
          , .A3 (Instr[15])) ;
    oai221 ix87 (.Y (nx86), .A0 (Instr[12]), .A1 (nx182), .B0 (nx186), .B1 (
           Instr[13]), .C0 (nx188)) ;
    inv01 ix187 (.Y (nx186), .A (Flags[0])) ;
    nand03 ix189 (.Y (nx188), .A0 (Instr[13]), .A1 (Flags[2]), .A2 (Instr[12])
           ) ;
    nor02ii ix57 (.Y (PC_Flags_Save), .A0 (nx26), .A1 (Instr[7])) ;
    and02 ix113 (.Y (Port_Out_WR), .A0 (Instr[9]), .A1 (nx192)) ;
    nor02_2x ix193 (.Y (nx192), .A0 (Instr[14]), .A1 (Instr[15])) ;
    and02 ix117 (.Y (Port_In_RD), .A0 (Instr[10]), .A1 (nx192)) ;
    oai32 ix107 (.Y (Mem_WR), .A0 (Instr[13]), .A1 (nx176), .A2 (Instr[14]), .B0 (
          Instr[9]), .B1 (nx196)) ;
    nand03 ix197 (.Y (nx196), .A0 (Instr[10]), .A1 (Instr[14]), .A2 (Instr[15])
           ) ;
    ao21 ix155 (.Y (Mem_RD), .A0 (Instr[13]), .A1 (Mem_EA_Load), .B0 (
         Mem_Addr_Switch)) ;
    nor02ii ix109 (.Y (Mem_Addr_Switch), .A0 (nx196), .A1 (Instr[9])) ;
    nor02ii ix61 (.Y (Flags_Restore), .A0 (nx26), .A1 (Instr[8])) ;
    oai221 ix43 (.Y (ALU_Opr[0]), .A0 (Instr[9]), .A1 (nx202), .B0 (nx227), .B1 (
           nx204), .C0 (nx206)) ;
    nand03 ix203 (.Y (nx202), .A0 (Instr[10]), .A1 (Instr[14]), .A2 (Instr[15])
           ) ;
    oai21 ix205 (.Y (nx204), .A0 (Instr[12]), .A1 (Instr[11]), .B0 (nx192)) ;
    nand02 ix207 (.Y (nx206), .A0 (Instr[10]), .A1 (nx227)) ;
    ao32 ix47 (.Y (ALU_Opr[1]), .A0 (Instr[10]), .A1 (Instr[14]), .A2 (Instr[15]
         ), .B0 (Instr[11]), .B1 (nx227)) ;
    ao32 ix51 (.Y (ALU_Opr[2]), .A0 (Instr[10]), .A1 (Instr[14]), .A2 (Instr[15]
         ), .B0 (Instr[12]), .B1 (nx227)) ;
    and02 ix11 (.Y (Immediate_Load), .A0 (Instr[11]), .A1 (nx192)) ;
    oai21 ix131 (.Y (Rdst_Load), .A0 (nx212), .A1 (Shift_Load), .B0 (nx196)) ;
    oai21 ix213 (.Y (nx212), .A0 (Instr[12]), .A1 (Instr[13]), .B0 (nx227)) ;
    nand02 ix142 (.Y (Rdst_WB), .A0 (nx215), .A1 (nx196)) ;
    aoi22 ix216 (.Y (nx215), .A0 (Instr[13]), .A1 (nx176), .B0 (Instr[12]), .B1 (
          nx227)) ;
    ao221 ix151 (.Y (Rsrc_Load), .A0 (Instr[12]), .A1 (nx176), .B0 (Instr[11]), 
          .B1 (nx218), .C0 (ALU_Opr[3])) ;
    or02 ix169 (.Y (Rsrc_WB), .A0 (nx166), .A1 (Mem_RD)) ;
    nor04 ix167 (.Y (nx166), .A0 (Instr[10]), .A1 (Instr[11]), .A2 (Instr[12]), 
          .A3 (nx212)) ;
    inv01 ix219 (.Y (nx218), .A (nx26)) ;
    nor02ii ix3 (.Y (Flags_EN), .A0 (Instr[15]), .A1 (Instr[14])) ;
    nor02ii ix97 (.Y (Mem_EA_Load), .A0 (Instr[14]), .A1 (Instr[15])) ;
    nor02ii ix183 (.Y (nx182), .A0 (Flags[1]), .A1 (Instr[13])) ;
    buf02 ix226 (.Y (nx227), .A (Flags_EN)) ;
endmodule

