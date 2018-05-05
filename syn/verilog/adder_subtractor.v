//
// Verilog description for cell adder_subtractor, 
// Sat May  5 03:59:07 2018
//
// LeonardoSpectrum Level 3, 2017a.2 
//


module adder_subtractor ( A, B, Cin, Subtract, Sum, Cout ) ;

    input [15:0]A ;
    input [15:0]B ;
    input Cin ;
    input Subtract ;
    output [15:0]Sum ;
    output Cout ;

    wire Carry_15, Carry_14, Carry_13, Carry_12, Carry_11, Carry_10, Carry_9, 
         Carry_8, Carry_7, Carry_6, Carry_5, Carry_4, Carry_3, Carry_2, Carry_1, 
         Carry_0, TmpB_15, TmpB_14, TmpB_13, TmpB_12, TmpB_11, TmpB_10, TmpB_9, 
         TmpB_8, TmpB_7, TmpB_6, TmpB_5, TmpB_4, TmpB_3, TmpB_2, TmpB_1, TmpB_0, 
         L0_0_FAi_nx111, L0_1_FAi_nx111, L0_2_FAi_nx111, L0_3_FAi_nx111, 
         L0_4_FAi_nx111, L0_5_FAi_nx111, L0_6_FAi_nx111, L0_7_FAi_nx111, 
         L0_8_FAi_nx111, L0_9_FAi_nx111, L0_10_FAi_nx111, L0_11_FAi_nx111, 
         L0_12_FAi_nx111, L0_13_FAi_nx111, L0_14_FAi_nx111, L0_15_FAi_nx111;



    mux21_ni L0_0_FAi_ix9 (.Y (Carry_1), .A0 (Carry_0), .A1 (A[0]), .S0 (
             L0_0_FAi_nx111)) ;
    xnor2 L0_0_FAi_ix112 (.Y (L0_0_FAi_nx111), .A0 (A[0]), .A1 (TmpB_0)) ;
    xnor2 L0_0_FAi_ix11 (.Y (Sum[0]), .A0 (L0_0_FAi_nx111), .A1 (Carry_0)) ;
    mux21_ni L0_1_FAi_ix9 (.Y (Carry_2), .A0 (Carry_1), .A1 (A[1]), .S0 (
             L0_1_FAi_nx111)) ;
    xnor2 L0_1_FAi_ix112 (.Y (L0_1_FAi_nx111), .A0 (A[1]), .A1 (TmpB_1)) ;
    xnor2 L0_1_FAi_ix11 (.Y (Sum[1]), .A0 (L0_1_FAi_nx111), .A1 (Carry_1)) ;
    mux21_ni L0_2_FAi_ix9 (.Y (Carry_3), .A0 (Carry_2), .A1 (A[2]), .S0 (
             L0_2_FAi_nx111)) ;
    xnor2 L0_2_FAi_ix112 (.Y (L0_2_FAi_nx111), .A0 (A[2]), .A1 (TmpB_2)) ;
    xnor2 L0_2_FAi_ix11 (.Y (Sum[2]), .A0 (L0_2_FAi_nx111), .A1 (Carry_2)) ;
    mux21_ni L0_3_FAi_ix9 (.Y (Carry_4), .A0 (Carry_3), .A1 (A[3]), .S0 (
             L0_3_FAi_nx111)) ;
    xnor2 L0_3_FAi_ix112 (.Y (L0_3_FAi_nx111), .A0 (A[3]), .A1 (TmpB_3)) ;
    xnor2 L0_3_FAi_ix11 (.Y (Sum[3]), .A0 (L0_3_FAi_nx111), .A1 (Carry_3)) ;
    mux21_ni L0_4_FAi_ix9 (.Y (Carry_5), .A0 (Carry_4), .A1 (A[4]), .S0 (
             L0_4_FAi_nx111)) ;
    xnor2 L0_4_FAi_ix112 (.Y (L0_4_FAi_nx111), .A0 (A[4]), .A1 (TmpB_4)) ;
    xnor2 L0_4_FAi_ix11 (.Y (Sum[4]), .A0 (L0_4_FAi_nx111), .A1 (Carry_4)) ;
    mux21_ni L0_5_FAi_ix9 (.Y (Carry_6), .A0 (Carry_5), .A1 (A[5]), .S0 (
             L0_5_FAi_nx111)) ;
    xnor2 L0_5_FAi_ix112 (.Y (L0_5_FAi_nx111), .A0 (A[5]), .A1 (TmpB_5)) ;
    xnor2 L0_5_FAi_ix11 (.Y (Sum[5]), .A0 (L0_5_FAi_nx111), .A1 (Carry_5)) ;
    mux21_ni L0_6_FAi_ix9 (.Y (Carry_7), .A0 (Carry_6), .A1 (A[6]), .S0 (
             L0_6_FAi_nx111)) ;
    xnor2 L0_6_FAi_ix112 (.Y (L0_6_FAi_nx111), .A0 (A[6]), .A1 (TmpB_6)) ;
    xnor2 L0_6_FAi_ix11 (.Y (Sum[6]), .A0 (L0_6_FAi_nx111), .A1 (Carry_6)) ;
    mux21_ni L0_7_FAi_ix9 (.Y (Carry_8), .A0 (Carry_7), .A1 (A[7]), .S0 (
             L0_7_FAi_nx111)) ;
    xnor2 L0_7_FAi_ix112 (.Y (L0_7_FAi_nx111), .A0 (A[7]), .A1 (TmpB_7)) ;
    xnor2 L0_7_FAi_ix11 (.Y (Sum[7]), .A0 (L0_7_FAi_nx111), .A1 (Carry_7)) ;
    mux21_ni L0_8_FAi_ix9 (.Y (Carry_9), .A0 (Carry_8), .A1 (A[8]), .S0 (
             L0_8_FAi_nx111)) ;
    xnor2 L0_8_FAi_ix112 (.Y (L0_8_FAi_nx111), .A0 (A[8]), .A1 (TmpB_8)) ;
    xnor2 L0_8_FAi_ix11 (.Y (Sum[8]), .A0 (L0_8_FAi_nx111), .A1 (Carry_8)) ;
    mux21_ni L0_9_FAi_ix9 (.Y (Carry_10), .A0 (Carry_9), .A1 (A[9]), .S0 (
             L0_9_FAi_nx111)) ;
    xnor2 L0_9_FAi_ix112 (.Y (L0_9_FAi_nx111), .A0 (A[9]), .A1 (TmpB_9)) ;
    xnor2 L0_9_FAi_ix11 (.Y (Sum[9]), .A0 (L0_9_FAi_nx111), .A1 (Carry_9)) ;
    mux21_ni L0_10_FAi_ix9 (.Y (Carry_11), .A0 (Carry_10), .A1 (A[10]), .S0 (
             L0_10_FAi_nx111)) ;
    xnor2 L0_10_FAi_ix112 (.Y (L0_10_FAi_nx111), .A0 (A[10]), .A1 (TmpB_10)) ;
    xnor2 L0_10_FAi_ix11 (.Y (Sum[10]), .A0 (L0_10_FAi_nx111), .A1 (Carry_10)) ;
    mux21_ni L0_11_FAi_ix9 (.Y (Carry_12), .A0 (Carry_11), .A1 (A[11]), .S0 (
             L0_11_FAi_nx111)) ;
    xnor2 L0_11_FAi_ix112 (.Y (L0_11_FAi_nx111), .A0 (A[11]), .A1 (TmpB_11)) ;
    xnor2 L0_11_FAi_ix11 (.Y (Sum[11]), .A0 (L0_11_FAi_nx111), .A1 (Carry_11)) ;
    mux21_ni L0_12_FAi_ix9 (.Y (Carry_13), .A0 (Carry_12), .A1 (A[12]), .S0 (
             L0_12_FAi_nx111)) ;
    xnor2 L0_12_FAi_ix112 (.Y (L0_12_FAi_nx111), .A0 (A[12]), .A1 (TmpB_12)) ;
    xnor2 L0_12_FAi_ix11 (.Y (Sum[12]), .A0 (L0_12_FAi_nx111), .A1 (Carry_12)) ;
    mux21_ni L0_13_FAi_ix9 (.Y (Carry_14), .A0 (Carry_13), .A1 (A[13]), .S0 (
             L0_13_FAi_nx111)) ;
    xnor2 L0_13_FAi_ix112 (.Y (L0_13_FAi_nx111), .A0 (A[13]), .A1 (TmpB_13)) ;
    xnor2 L0_13_FAi_ix11 (.Y (Sum[13]), .A0 (L0_13_FAi_nx111), .A1 (Carry_13)) ;
    mux21_ni L0_14_FAi_ix9 (.Y (Carry_15), .A0 (Carry_14), .A1 (A[14]), .S0 (
             L0_14_FAi_nx111)) ;
    xnor2 L0_14_FAi_ix112 (.Y (L0_14_FAi_nx111), .A0 (A[14]), .A1 (TmpB_14)) ;
    xnor2 L0_14_FAi_ix11 (.Y (Sum[14]), .A0 (L0_14_FAi_nx111), .A1 (Carry_14)) ;
    mux21_ni L0_15_FAi_ix9 (.Y (Cout), .A0 (Carry_15), .A1 (A[15]), .S0 (
             L0_15_FAi_nx111)) ;
    xnor2 L0_15_FAi_ix112 (.Y (L0_15_FAi_nx111), .A0 (A[15]), .A1 (TmpB_15)) ;
    xnor2 L0_15_FAi_ix11 (.Y (Sum[15]), .A0 (L0_15_FAi_nx111), .A1 (Carry_15)) ;
    xor2 ix31 (.Y (TmpB_0), .A0 (B[0]), .A1 (Subtract)) ;
    xor2 ix29 (.Y (TmpB_1), .A0 (B[1]), .A1 (Subtract)) ;
    xor2 ix27 (.Y (TmpB_2), .A0 (B[2]), .A1 (Subtract)) ;
    xor2 ix25 (.Y (TmpB_3), .A0 (B[3]), .A1 (Subtract)) ;
    xor2 ix23 (.Y (TmpB_4), .A0 (B[4]), .A1 (Subtract)) ;
    xor2 ix21 (.Y (TmpB_5), .A0 (B[5]), .A1 (Subtract)) ;
    xor2 ix19 (.Y (TmpB_6), .A0 (B[6]), .A1 (Subtract)) ;
    xor2 ix17 (.Y (TmpB_7), .A0 (B[7]), .A1 (Subtract)) ;
    xor2 ix15 (.Y (TmpB_8), .A0 (B[8]), .A1 (Subtract)) ;
    xor2 ix13 (.Y (TmpB_9), .A0 (B[9]), .A1 (Subtract)) ;
    xor2 ix11 (.Y (TmpB_10), .A0 (B[10]), .A1 (Subtract)) ;
    xor2 ix9 (.Y (TmpB_11), .A0 (B[11]), .A1 (Subtract)) ;
    xor2 ix7 (.Y (TmpB_12), .A0 (B[12]), .A1 (Subtract)) ;
    xor2 ix5 (.Y (TmpB_13), .A0 (B[13]), .A1 (Subtract)) ;
    xor2 ix3 (.Y (TmpB_14), .A0 (B[14]), .A1 (Subtract)) ;
    xor2 ix1 (.Y (TmpB_15), .A0 (B[15]), .A1 (Subtract)) ;
    xor2 ix33 (.Y (Carry_0), .A0 (Cin), .A1 (Subtract)) ;
endmodule

