//
// Verilog description for cell register_file, 
// Sat May  5 07:41:23 2018
//
// LeonardoSpectrum Level 3, 2017a.2 
//


module register_file ( CLK, RST, PC_WR, PC_Din, Reg_A_WR, Reg_A_WR_Addr, 
                       Reg_A_Din, Reg_B_WR, Reg_B_WR_Addr, Reg_B_Din, PC_Dout, 
                       Reg_A_RD_Addr, Reg_A_Dout, Reg_B_RD_Addr, Reg_B_Dout ) ;

    input CLK ;
    input RST ;
    input PC_WR ;
    input [15:0]PC_Din ;
    input Reg_A_WR ;
    input [2:0]Reg_A_WR_Addr ;
    input [15:0]Reg_A_Din ;
    input Reg_B_WR ;
    input [2:0]Reg_B_WR_Addr ;
    input [15:0]Reg_B_Din ;
    output [15:0]PC_Dout ;
    input [2:0]Reg_A_RD_Addr ;
    output [15:0]Reg_A_Dout ;
    input [2:0]Reg_B_RD_Addr ;
    output [15:0]Reg_B_Dout ;

    wire Reg_Din_0__15, Reg_Din_0__14, Reg_Din_0__13, Reg_Din_0__12, 
         Reg_Din_0__11, Reg_Din_0__10, Reg_Din_0__9, Reg_Din_0__8, Reg_Din_0__7, 
         Reg_Din_0__6, Reg_Din_0__5, Reg_Din_0__4, Reg_Din_0__3, Reg_Din_0__2, 
         Reg_Din_0__1, Reg_Din_0__0, Reg_Din_1__15, Reg_Din_1__14, Reg_Din_1__13, 
         Reg_Din_1__12, Reg_Din_1__11, Reg_Din_1__10, Reg_Din_1__9, Reg_Din_1__8, 
         Reg_Din_1__7, Reg_Din_1__6, Reg_Din_1__5, Reg_Din_1__4, Reg_Din_1__3, 
         Reg_Din_1__2, Reg_Din_1__1, Reg_Din_1__0, Reg_Din_2__15, Reg_Din_2__14, 
         Reg_Din_2__13, Reg_Din_2__12, Reg_Din_2__11, Reg_Din_2__10, 
         Reg_Din_2__9, Reg_Din_2__8, Reg_Din_2__7, Reg_Din_2__6, Reg_Din_2__5, 
         Reg_Din_2__4, Reg_Din_2__3, Reg_Din_2__2, Reg_Din_2__1, Reg_Din_2__0, 
         Reg_Din_3__15, Reg_Din_3__14, Reg_Din_3__13, Reg_Din_3__12, 
         Reg_Din_3__11, Reg_Din_3__10, Reg_Din_3__9, Reg_Din_3__8, Reg_Din_3__7, 
         Reg_Din_3__6, Reg_Din_3__5, Reg_Din_3__4, Reg_Din_3__3, Reg_Din_3__2, 
         Reg_Din_3__1, Reg_Din_3__0, Reg_Din_4__15, Reg_Din_4__14, Reg_Din_4__13, 
         Reg_Din_4__12, Reg_Din_4__11, Reg_Din_4__10, Reg_Din_4__9, Reg_Din_4__8, 
         Reg_Din_4__7, Reg_Din_4__6, Reg_Din_4__5, Reg_Din_4__4, Reg_Din_4__3, 
         Reg_Din_4__2, Reg_Din_4__1, Reg_Din_4__0, Reg_Din_5__15, Reg_Din_5__14, 
         Reg_Din_5__13, Reg_Din_5__12, Reg_Din_5__11, Reg_Din_5__10, 
         Reg_Din_5__9, Reg_Din_5__8, Reg_Din_5__7, Reg_Din_5__6, Reg_Din_5__5, 
         Reg_Din_5__4, Reg_Din_5__3, Reg_Din_5__2, Reg_Din_5__1, Reg_Din_5__0, 
         Reg_Din_6__15, Reg_Din_6__14, Reg_Din_6__13, Reg_Din_6__12, 
         Reg_Din_6__11, Reg_Din_6__10, Reg_Din_6__9, Reg_Din_6__8, Reg_Din_6__7, 
         Reg_Din_6__6, Reg_Din_6__5, Reg_Din_6__4, Reg_Din_6__3, Reg_Din_6__2, 
         Reg_Din_6__1, Reg_Din_6__0, Reg_Dout_0__15, Reg_Dout_0__14, 
         Reg_Dout_0__13, Reg_Dout_0__12, Reg_Dout_0__11, Reg_Dout_0__10, 
         Reg_Dout_0__9, Reg_Dout_0__8, Reg_Dout_0__7, Reg_Dout_0__6, 
         Reg_Dout_0__5, Reg_Dout_0__4, Reg_Dout_0__3, Reg_Dout_0__2, 
         Reg_Dout_0__1, Reg_Dout_0__0, Reg_Dout_1__15, Reg_Dout_1__14, 
         Reg_Dout_1__13, Reg_Dout_1__12, Reg_Dout_1__11, Reg_Dout_1__10, 
         Reg_Dout_1__9, Reg_Dout_1__8, Reg_Dout_1__7, Reg_Dout_1__6, 
         Reg_Dout_1__5, Reg_Dout_1__4, Reg_Dout_1__3, Reg_Dout_1__2, 
         Reg_Dout_1__1, Reg_Dout_1__0, Reg_Dout_2__15, Reg_Dout_2__14, 
         Reg_Dout_2__13, Reg_Dout_2__12, Reg_Dout_2__11, Reg_Dout_2__10, 
         Reg_Dout_2__9, Reg_Dout_2__8, Reg_Dout_2__7, Reg_Dout_2__6, 
         Reg_Dout_2__5, Reg_Dout_2__4, Reg_Dout_2__3, Reg_Dout_2__2, 
         Reg_Dout_2__1, Reg_Dout_2__0, Reg_Dout_3__15, Reg_Dout_3__14, 
         Reg_Dout_3__13, Reg_Dout_3__12, Reg_Dout_3__11, Reg_Dout_3__10, 
         Reg_Dout_3__9, Reg_Dout_3__8, Reg_Dout_3__7, Reg_Dout_3__6, 
         Reg_Dout_3__5, Reg_Dout_3__4, Reg_Dout_3__3, Reg_Dout_3__2, 
         Reg_Dout_3__1, Reg_Dout_3__0, Reg_Dout_4__15, Reg_Dout_4__14, 
         Reg_Dout_4__13, Reg_Dout_4__12, Reg_Dout_4__11, Reg_Dout_4__10, 
         Reg_Dout_4__9, Reg_Dout_4__8, Reg_Dout_4__7, Reg_Dout_4__6, 
         Reg_Dout_4__5, Reg_Dout_4__4, Reg_Dout_4__3, Reg_Dout_4__2, 
         Reg_Dout_4__1, Reg_Dout_4__0, Reg_Dout_5__15, Reg_Dout_5__14, 
         Reg_Dout_5__13, Reg_Dout_5__12, Reg_Dout_5__11, Reg_Dout_5__10, 
         Reg_Dout_5__9, Reg_Dout_5__8, Reg_Dout_5__7, Reg_Dout_5__6, 
         Reg_Dout_5__5, Reg_Dout_5__4, Reg_Dout_5__3, Reg_Dout_5__2, 
         Reg_Dout_5__1, Reg_Dout_5__0, Reg_Dout_6__15, Reg_Dout_6__14, 
         Reg_Dout_6__13, Reg_Dout_6__12, Reg_Dout_6__11, Reg_Dout_6__10, 
         Reg_Dout_6__9, Reg_Dout_6__8, Reg_Dout_6__7, Reg_Dout_6__6, 
         Reg_Dout_6__5, Reg_Dout_6__4, Reg_Dout_6__3, Reg_Dout_6__2, 
         Reg_Dout_6__1, Reg_Dout_6__0, Reg_EN_6, Reg_EN_5, Reg_EN_4, Reg_EN_3, 
         Reg_EN_2, Reg_EN_1, Reg_EN_0, Reg_A_in_4, Reg_A_in_3, Reg_B_in_6, 
         Reg_B_in_5, Reg_B_in_4, Reg_B_in_3, Reg_B_in_2, Reg_B_in_1, Reg_B_in_0, 
         Reg_A_out_7, Reg_A_out_6, Reg_A_out_5, Reg_A_out_4, Reg_A_out_3, 
         Reg_A_out_2, Reg_A_out_1, Reg_A_out_0, Reg_B_out_7, Reg_B_out_6, 
         Reg_B_out_5, Reg_B_out_4, Reg_B_out_3, Reg_B_out_2, Reg_B_out_1, 
         Reg_B_out_0, DEC_A_IN_nx2, DEC_A_IN_nx179, DEC_A_IN_nx184, 
         DEC_A_IN_nx187, DEC_A_IN_nx192, DEC_B_IN_nx2, DEC_B_IN_nx179, 
         DEC_B_IN_nx184, DEC_B_IN_nx187, DEC_B_IN_nx192, DEC_A_OUT_nx2, 
         DEC_A_OUT_nx179, DEC_A_OUT_nx184, DEC_A_OUT_nx187, DEC_A_OUT_nx192, 
         DEC_B_OUT_nx2, DEC_B_OUT_nx179, DEC_B_OUT_nx184, DEC_B_OUT_nx187, 
         DEC_B_OUT_nx192, PWR, nx1314, nx1316, nx1322, nx1324, nx1332, nx1340, 
         nx1346, nx1348, nx1354, nx1356, nx1362, nx1364, nx1374, nx1376, nx1378, 
         nx1380, nx1382, nx1384, nx1386, nx1388, nx1390, nx1392, nx1394, nx1396, 
         nx1398, nx1400, nx1402, nx1404, nx1406, nx1408, nx1410, nx1412, nx1414;



    register_edge_rising_16 L1_0_Ri (.CLK (CLK), .RST (RST), .EN (Reg_EN_0), .Din (
                            {Reg_Din_0__15,Reg_Din_0__14,Reg_Din_0__13,
                            Reg_Din_0__12,Reg_Din_0__11,Reg_Din_0__10,
                            Reg_Din_0__9,Reg_Din_0__8,Reg_Din_0__7,Reg_Din_0__6,
                            Reg_Din_0__5,Reg_Din_0__4,Reg_Din_0__3,Reg_Din_0__2,
                            Reg_Din_0__1,Reg_Din_0__0}), .Dout ({Reg_Dout_0__15,
                            Reg_Dout_0__14,Reg_Dout_0__13,Reg_Dout_0__12,
                            Reg_Dout_0__11,Reg_Dout_0__10,Reg_Dout_0__9,
                            Reg_Dout_0__8,Reg_Dout_0__7,Reg_Dout_0__6,
                            Reg_Dout_0__5,Reg_Dout_0__4,Reg_Dout_0__3,
                            Reg_Dout_0__2,Reg_Dout_0__1,Reg_Dout_0__0})) ;
    register_edge_rising_16 L1_1_Ri (.CLK (CLK), .RST (RST), .EN (Reg_EN_1), .Din (
                            {Reg_Din_1__15,Reg_Din_1__14,Reg_Din_1__13,
                            Reg_Din_1__12,Reg_Din_1__11,Reg_Din_1__10,
                            Reg_Din_1__9,Reg_Din_1__8,Reg_Din_1__7,Reg_Din_1__6,
                            Reg_Din_1__5,Reg_Din_1__4,Reg_Din_1__3,Reg_Din_1__2,
                            Reg_Din_1__1,Reg_Din_1__0}), .Dout ({Reg_Dout_1__15,
                            Reg_Dout_1__14,Reg_Dout_1__13,Reg_Dout_1__12,
                            Reg_Dout_1__11,Reg_Dout_1__10,Reg_Dout_1__9,
                            Reg_Dout_1__8,Reg_Dout_1__7,Reg_Dout_1__6,
                            Reg_Dout_1__5,Reg_Dout_1__4,Reg_Dout_1__3,
                            Reg_Dout_1__2,Reg_Dout_1__1,Reg_Dout_1__0})) ;
    register_edge_rising_16 L1_2_Ri (.CLK (CLK), .RST (RST), .EN (Reg_EN_2), .Din (
                            {Reg_Din_2__15,Reg_Din_2__14,Reg_Din_2__13,
                            Reg_Din_2__12,Reg_Din_2__11,Reg_Din_2__10,
                            Reg_Din_2__9,Reg_Din_2__8,Reg_Din_2__7,Reg_Din_2__6,
                            Reg_Din_2__5,Reg_Din_2__4,Reg_Din_2__3,Reg_Din_2__2,
                            Reg_Din_2__1,Reg_Din_2__0}), .Dout ({Reg_Dout_2__15,
                            Reg_Dout_2__14,Reg_Dout_2__13,Reg_Dout_2__12,
                            Reg_Dout_2__11,Reg_Dout_2__10,Reg_Dout_2__9,
                            Reg_Dout_2__8,Reg_Dout_2__7,Reg_Dout_2__6,
                            Reg_Dout_2__5,Reg_Dout_2__4,Reg_Dout_2__3,
                            Reg_Dout_2__2,Reg_Dout_2__1,Reg_Dout_2__0})) ;
    register_edge_rising_16 L1_3_Ri (.CLK (CLK), .RST (RST), .EN (Reg_EN_3), .Din (
                            {Reg_Din_3__15,Reg_Din_3__14,Reg_Din_3__13,
                            Reg_Din_3__12,Reg_Din_3__11,Reg_Din_3__10,
                            Reg_Din_3__9,Reg_Din_3__8,Reg_Din_3__7,Reg_Din_3__6,
                            Reg_Din_3__5,Reg_Din_3__4,Reg_Din_3__3,Reg_Din_3__2,
                            Reg_Din_3__1,Reg_Din_3__0}), .Dout ({Reg_Dout_3__15,
                            Reg_Dout_3__14,Reg_Dout_3__13,Reg_Dout_3__12,
                            Reg_Dout_3__11,Reg_Dout_3__10,Reg_Dout_3__9,
                            Reg_Dout_3__8,Reg_Dout_3__7,Reg_Dout_3__6,
                            Reg_Dout_3__5,Reg_Dout_3__4,Reg_Dout_3__3,
                            Reg_Dout_3__2,Reg_Dout_3__1,Reg_Dout_3__0})) ;
    register_edge_rising_16 L1_4_Ri (.CLK (CLK), .RST (RST), .EN (Reg_EN_4), .Din (
                            {Reg_Din_4__15,Reg_Din_4__14,Reg_Din_4__13,
                            Reg_Din_4__12,Reg_Din_4__11,Reg_Din_4__10,
                            Reg_Din_4__9,Reg_Din_4__8,Reg_Din_4__7,Reg_Din_4__6,
                            Reg_Din_4__5,Reg_Din_4__4,Reg_Din_4__3,Reg_Din_4__2,
                            Reg_Din_4__1,Reg_Din_4__0}), .Dout ({Reg_Dout_4__15,
                            Reg_Dout_4__14,Reg_Dout_4__13,Reg_Dout_4__12,
                            Reg_Dout_4__11,Reg_Dout_4__10,Reg_Dout_4__9,
                            Reg_Dout_4__8,Reg_Dout_4__7,Reg_Dout_4__6,
                            Reg_Dout_4__5,Reg_Dout_4__4,Reg_Dout_4__3,
                            Reg_Dout_4__2,Reg_Dout_4__1,Reg_Dout_4__0})) ;
    register_edge_rising_16 L1_5_Ri (.CLK (CLK), .RST (RST), .EN (Reg_EN_5), .Din (
                            {Reg_Din_5__15,Reg_Din_5__14,Reg_Din_5__13,
                            Reg_Din_5__12,Reg_Din_5__11,Reg_Din_5__10,
                            Reg_Din_5__9,Reg_Din_5__8,Reg_Din_5__7,Reg_Din_5__6,
                            Reg_Din_5__5,Reg_Din_5__4,Reg_Din_5__3,Reg_Din_5__2,
                            Reg_Din_5__1,Reg_Din_5__0}), .Dout ({Reg_Dout_5__15,
                            Reg_Dout_5__14,Reg_Dout_5__13,Reg_Dout_5__12,
                            Reg_Dout_5__11,Reg_Dout_5__10,Reg_Dout_5__9,
                            Reg_Dout_5__8,Reg_Dout_5__7,Reg_Dout_5__6,
                            Reg_Dout_5__5,Reg_Dout_5__4,Reg_Dout_5__3,
                            Reg_Dout_5__2,Reg_Dout_5__1,Reg_Dout_5__0})) ;
    register_edge_rising_16 L1_6_Ri (.CLK (CLK), .RST (RST), .EN (Reg_EN_6), .Din (
                            {Reg_Din_6__15,Reg_Din_6__14,Reg_Din_6__13,
                            Reg_Din_6__12,Reg_Din_6__11,Reg_Din_6__10,
                            Reg_Din_6__9,Reg_Din_6__8,Reg_Din_6__7,Reg_Din_6__6,
                            Reg_Din_6__5,Reg_Din_6__4,Reg_Din_6__3,Reg_Din_6__2,
                            Reg_Din_6__1,Reg_Din_6__0}), .Dout ({Reg_Dout_6__15,
                            Reg_Dout_6__14,Reg_Dout_6__13,Reg_Dout_6__12,
                            Reg_Dout_6__11,Reg_Dout_6__10,Reg_Dout_6__9,
                            Reg_Dout_6__8,Reg_Dout_6__7,Reg_Dout_6__6,
                            Reg_Dout_6__5,Reg_Dout_6__4,Reg_Dout_6__3,
                            Reg_Dout_6__2,Reg_Dout_6__1,Reg_Dout_6__0})) ;
    register_edge_falling_16 PC (.CLK (CLK), .RST (RST), .EN (PC_WR), .Din ({
                             PC_Din[15],PC_Din[14],PC_Din[13],PC_Din[12],
                             PC_Din[11],PC_Din[10],PC_Din[9],PC_Din[8],PC_Din[7]
                             ,PC_Din[6],PC_Din[5],PC_Din[4],PC_Din[3],PC_Din[2],
                             PC_Din[1],PC_Din[0]}), .Dout ({PC_Dout[15],
                             PC_Dout[14],PC_Dout[13],PC_Dout[12],PC_Dout[11],
                             PC_Dout[10],PC_Dout[9],PC_Dout[8],PC_Dout[7],
                             PC_Dout[6],PC_Dout[5],PC_Dout[4],PC_Dout[3],
                             PC_Dout[2],PC_Dout[1],PC_Dout[0]})) ;
    tri_state_buffer_16 L2_0_TRI_A (.Din ({Reg_Dout_0__15,Reg_Dout_0__14,
                        Reg_Dout_0__13,Reg_Dout_0__12,Reg_Dout_0__11,
                        Reg_Dout_0__10,Reg_Dout_0__9,Reg_Dout_0__8,Reg_Dout_0__7
                        ,Reg_Dout_0__6,Reg_Dout_0__5,Reg_Dout_0__4,Reg_Dout_0__3
                        ,Reg_Dout_0__2,Reg_Dout_0__1,Reg_Dout_0__0}), .S (
                        Reg_A_out_0), .Dout ({Reg_A_Dout[15],Reg_A_Dout[14],
                        Reg_A_Dout[13],Reg_A_Dout[12],Reg_A_Dout[11],
                        Reg_A_Dout[10],Reg_A_Dout[9],Reg_A_Dout[8],Reg_A_Dout[7]
                        ,Reg_A_Dout[6],Reg_A_Dout[5],Reg_A_Dout[4],Reg_A_Dout[3]
                        ,Reg_A_Dout[2],Reg_A_Dout[1],Reg_A_Dout[0]})) ;
    tri_state_buffer_16 L2_0_TRI_B (.Din ({Reg_Dout_0__15,Reg_Dout_0__14,
                        Reg_Dout_0__13,Reg_Dout_0__12,Reg_Dout_0__11,
                        Reg_Dout_0__10,Reg_Dout_0__9,Reg_Dout_0__8,Reg_Dout_0__7
                        ,Reg_Dout_0__6,Reg_Dout_0__5,Reg_Dout_0__4,Reg_Dout_0__3
                        ,Reg_Dout_0__2,Reg_Dout_0__1,Reg_Dout_0__0}), .S (
                        Reg_B_out_0), .Dout ({Reg_B_Dout[15],Reg_B_Dout[14],
                        Reg_B_Dout[13],Reg_B_Dout[12],Reg_B_Dout[11],
                        Reg_B_Dout[10],Reg_B_Dout[9],Reg_B_Dout[8],Reg_B_Dout[7]
                        ,Reg_B_Dout[6],Reg_B_Dout[5],Reg_B_Dout[4],Reg_B_Dout[3]
                        ,Reg_B_Dout[2],Reg_B_Dout[1],Reg_B_Dout[0]})) ;
    tri_state_buffer_16 L2_1_TRI_A (.Din ({Reg_Dout_1__15,Reg_Dout_1__14,
                        Reg_Dout_1__13,Reg_Dout_1__12,Reg_Dout_1__11,
                        Reg_Dout_1__10,Reg_Dout_1__9,Reg_Dout_1__8,Reg_Dout_1__7
                        ,Reg_Dout_1__6,Reg_Dout_1__5,Reg_Dout_1__4,Reg_Dout_1__3
                        ,Reg_Dout_1__2,Reg_Dout_1__1,Reg_Dout_1__0}), .S (
                        Reg_A_out_1), .Dout ({Reg_A_Dout[15],Reg_A_Dout[14],
                        Reg_A_Dout[13],Reg_A_Dout[12],Reg_A_Dout[11],
                        Reg_A_Dout[10],Reg_A_Dout[9],Reg_A_Dout[8],Reg_A_Dout[7]
                        ,Reg_A_Dout[6],Reg_A_Dout[5],Reg_A_Dout[4],Reg_A_Dout[3]
                        ,Reg_A_Dout[2],Reg_A_Dout[1],Reg_A_Dout[0]})) ;
    tri_state_buffer_16 L2_1_TRI_B (.Din ({Reg_Dout_1__15,Reg_Dout_1__14,
                        Reg_Dout_1__13,Reg_Dout_1__12,Reg_Dout_1__11,
                        Reg_Dout_1__10,Reg_Dout_1__9,Reg_Dout_1__8,Reg_Dout_1__7
                        ,Reg_Dout_1__6,Reg_Dout_1__5,Reg_Dout_1__4,Reg_Dout_1__3
                        ,Reg_Dout_1__2,Reg_Dout_1__1,Reg_Dout_1__0}), .S (
                        Reg_B_out_1), .Dout ({Reg_B_Dout[15],Reg_B_Dout[14],
                        Reg_B_Dout[13],Reg_B_Dout[12],Reg_B_Dout[11],
                        Reg_B_Dout[10],Reg_B_Dout[9],Reg_B_Dout[8],Reg_B_Dout[7]
                        ,Reg_B_Dout[6],Reg_B_Dout[5],Reg_B_Dout[4],Reg_B_Dout[3]
                        ,Reg_B_Dout[2],Reg_B_Dout[1],Reg_B_Dout[0]})) ;
    tri_state_buffer_16 L2_2_TRI_A (.Din ({Reg_Dout_2__15,Reg_Dout_2__14,
                        Reg_Dout_2__13,Reg_Dout_2__12,Reg_Dout_2__11,
                        Reg_Dout_2__10,Reg_Dout_2__9,Reg_Dout_2__8,Reg_Dout_2__7
                        ,Reg_Dout_2__6,Reg_Dout_2__5,Reg_Dout_2__4,Reg_Dout_2__3
                        ,Reg_Dout_2__2,Reg_Dout_2__1,Reg_Dout_2__0}), .S (
                        Reg_A_out_2), .Dout ({Reg_A_Dout[15],Reg_A_Dout[14],
                        Reg_A_Dout[13],Reg_A_Dout[12],Reg_A_Dout[11],
                        Reg_A_Dout[10],Reg_A_Dout[9],Reg_A_Dout[8],Reg_A_Dout[7]
                        ,Reg_A_Dout[6],Reg_A_Dout[5],Reg_A_Dout[4],Reg_A_Dout[3]
                        ,Reg_A_Dout[2],Reg_A_Dout[1],Reg_A_Dout[0]})) ;
    tri_state_buffer_16 L2_2_TRI_B (.Din ({Reg_Dout_2__15,Reg_Dout_2__14,
                        Reg_Dout_2__13,Reg_Dout_2__12,Reg_Dout_2__11,
                        Reg_Dout_2__10,Reg_Dout_2__9,Reg_Dout_2__8,Reg_Dout_2__7
                        ,Reg_Dout_2__6,Reg_Dout_2__5,Reg_Dout_2__4,Reg_Dout_2__3
                        ,Reg_Dout_2__2,Reg_Dout_2__1,Reg_Dout_2__0}), .S (
                        Reg_B_out_2), .Dout ({Reg_B_Dout[15],Reg_B_Dout[14],
                        Reg_B_Dout[13],Reg_B_Dout[12],Reg_B_Dout[11],
                        Reg_B_Dout[10],Reg_B_Dout[9],Reg_B_Dout[8],Reg_B_Dout[7]
                        ,Reg_B_Dout[6],Reg_B_Dout[5],Reg_B_Dout[4],Reg_B_Dout[3]
                        ,Reg_B_Dout[2],Reg_B_Dout[1],Reg_B_Dout[0]})) ;
    tri_state_buffer_16 L2_3_TRI_A (.Din ({Reg_Dout_3__15,Reg_Dout_3__14,
                        Reg_Dout_3__13,Reg_Dout_3__12,Reg_Dout_3__11,
                        Reg_Dout_3__10,Reg_Dout_3__9,Reg_Dout_3__8,Reg_Dout_3__7
                        ,Reg_Dout_3__6,Reg_Dout_3__5,Reg_Dout_3__4,Reg_Dout_3__3
                        ,Reg_Dout_3__2,Reg_Dout_3__1,Reg_Dout_3__0}), .S (
                        Reg_A_out_3), .Dout ({Reg_A_Dout[15],Reg_A_Dout[14],
                        Reg_A_Dout[13],Reg_A_Dout[12],Reg_A_Dout[11],
                        Reg_A_Dout[10],Reg_A_Dout[9],Reg_A_Dout[8],Reg_A_Dout[7]
                        ,Reg_A_Dout[6],Reg_A_Dout[5],Reg_A_Dout[4],Reg_A_Dout[3]
                        ,Reg_A_Dout[2],Reg_A_Dout[1],Reg_A_Dout[0]})) ;
    tri_state_buffer_16 L2_3_TRI_B (.Din ({Reg_Dout_3__15,Reg_Dout_3__14,
                        Reg_Dout_3__13,Reg_Dout_3__12,Reg_Dout_3__11,
                        Reg_Dout_3__10,Reg_Dout_3__9,Reg_Dout_3__8,Reg_Dout_3__7
                        ,Reg_Dout_3__6,Reg_Dout_3__5,Reg_Dout_3__4,Reg_Dout_3__3
                        ,Reg_Dout_3__2,Reg_Dout_3__1,Reg_Dout_3__0}), .S (
                        Reg_B_out_3), .Dout ({Reg_B_Dout[15],Reg_B_Dout[14],
                        Reg_B_Dout[13],Reg_B_Dout[12],Reg_B_Dout[11],
                        Reg_B_Dout[10],Reg_B_Dout[9],Reg_B_Dout[8],Reg_B_Dout[7]
                        ,Reg_B_Dout[6],Reg_B_Dout[5],Reg_B_Dout[4],Reg_B_Dout[3]
                        ,Reg_B_Dout[2],Reg_B_Dout[1],Reg_B_Dout[0]})) ;
    tri_state_buffer_16 L2_4_TRI_A (.Din ({Reg_Dout_4__15,Reg_Dout_4__14,
                        Reg_Dout_4__13,Reg_Dout_4__12,Reg_Dout_4__11,
                        Reg_Dout_4__10,Reg_Dout_4__9,Reg_Dout_4__8,Reg_Dout_4__7
                        ,Reg_Dout_4__6,Reg_Dout_4__5,Reg_Dout_4__4,Reg_Dout_4__3
                        ,Reg_Dout_4__2,Reg_Dout_4__1,Reg_Dout_4__0}), .S (
                        Reg_A_out_4), .Dout ({Reg_A_Dout[15],Reg_A_Dout[14],
                        Reg_A_Dout[13],Reg_A_Dout[12],Reg_A_Dout[11],
                        Reg_A_Dout[10],Reg_A_Dout[9],Reg_A_Dout[8],Reg_A_Dout[7]
                        ,Reg_A_Dout[6],Reg_A_Dout[5],Reg_A_Dout[4],Reg_A_Dout[3]
                        ,Reg_A_Dout[2],Reg_A_Dout[1],Reg_A_Dout[0]})) ;
    tri_state_buffer_16 L2_4_TRI_B (.Din ({Reg_Dout_4__15,Reg_Dout_4__14,
                        Reg_Dout_4__13,Reg_Dout_4__12,Reg_Dout_4__11,
                        Reg_Dout_4__10,Reg_Dout_4__9,Reg_Dout_4__8,Reg_Dout_4__7
                        ,Reg_Dout_4__6,Reg_Dout_4__5,Reg_Dout_4__4,Reg_Dout_4__3
                        ,Reg_Dout_4__2,Reg_Dout_4__1,Reg_Dout_4__0}), .S (
                        Reg_B_out_4), .Dout ({Reg_B_Dout[15],Reg_B_Dout[14],
                        Reg_B_Dout[13],Reg_B_Dout[12],Reg_B_Dout[11],
                        Reg_B_Dout[10],Reg_B_Dout[9],Reg_B_Dout[8],Reg_B_Dout[7]
                        ,Reg_B_Dout[6],Reg_B_Dout[5],Reg_B_Dout[4],Reg_B_Dout[3]
                        ,Reg_B_Dout[2],Reg_B_Dout[1],Reg_B_Dout[0]})) ;
    tri_state_buffer_16 L2_5_TRI_A (.Din ({Reg_Dout_5__15,Reg_Dout_5__14,
                        Reg_Dout_5__13,Reg_Dout_5__12,Reg_Dout_5__11,
                        Reg_Dout_5__10,Reg_Dout_5__9,Reg_Dout_5__8,Reg_Dout_5__7
                        ,Reg_Dout_5__6,Reg_Dout_5__5,Reg_Dout_5__4,Reg_Dout_5__3
                        ,Reg_Dout_5__2,Reg_Dout_5__1,Reg_Dout_5__0}), .S (
                        Reg_A_out_5), .Dout ({Reg_A_Dout[15],Reg_A_Dout[14],
                        Reg_A_Dout[13],Reg_A_Dout[12],Reg_A_Dout[11],
                        Reg_A_Dout[10],Reg_A_Dout[9],Reg_A_Dout[8],Reg_A_Dout[7]
                        ,Reg_A_Dout[6],Reg_A_Dout[5],Reg_A_Dout[4],Reg_A_Dout[3]
                        ,Reg_A_Dout[2],Reg_A_Dout[1],Reg_A_Dout[0]})) ;
    tri_state_buffer_16 L2_5_TRI_B (.Din ({Reg_Dout_5__15,Reg_Dout_5__14,
                        Reg_Dout_5__13,Reg_Dout_5__12,Reg_Dout_5__11,
                        Reg_Dout_5__10,Reg_Dout_5__9,Reg_Dout_5__8,Reg_Dout_5__7
                        ,Reg_Dout_5__6,Reg_Dout_5__5,Reg_Dout_5__4,Reg_Dout_5__3
                        ,Reg_Dout_5__2,Reg_Dout_5__1,Reg_Dout_5__0}), .S (
                        Reg_B_out_5), .Dout ({Reg_B_Dout[15],Reg_B_Dout[14],
                        Reg_B_Dout[13],Reg_B_Dout[12],Reg_B_Dout[11],
                        Reg_B_Dout[10],Reg_B_Dout[9],Reg_B_Dout[8],Reg_B_Dout[7]
                        ,Reg_B_Dout[6],Reg_B_Dout[5],Reg_B_Dout[4],Reg_B_Dout[3]
                        ,Reg_B_Dout[2],Reg_B_Dout[1],Reg_B_Dout[0]})) ;
    tri_state_buffer_16 L2_6_TRI_A (.Din ({Reg_Dout_6__15,Reg_Dout_6__14,
                        Reg_Dout_6__13,Reg_Dout_6__12,Reg_Dout_6__11,
                        Reg_Dout_6__10,Reg_Dout_6__9,Reg_Dout_6__8,Reg_Dout_6__7
                        ,Reg_Dout_6__6,Reg_Dout_6__5,Reg_Dout_6__4,Reg_Dout_6__3
                        ,Reg_Dout_6__2,Reg_Dout_6__1,Reg_Dout_6__0}), .S (
                        Reg_A_out_6), .Dout ({Reg_A_Dout[15],Reg_A_Dout[14],
                        Reg_A_Dout[13],Reg_A_Dout[12],Reg_A_Dout[11],
                        Reg_A_Dout[10],Reg_A_Dout[9],Reg_A_Dout[8],Reg_A_Dout[7]
                        ,Reg_A_Dout[6],Reg_A_Dout[5],Reg_A_Dout[4],Reg_A_Dout[3]
                        ,Reg_A_Dout[2],Reg_A_Dout[1],Reg_A_Dout[0]})) ;
    tri_state_buffer_16 L2_6_TRI_B (.Din ({Reg_Dout_6__15,Reg_Dout_6__14,
                        Reg_Dout_6__13,Reg_Dout_6__12,Reg_Dout_6__11,
                        Reg_Dout_6__10,Reg_Dout_6__9,Reg_Dout_6__8,Reg_Dout_6__7
                        ,Reg_Dout_6__6,Reg_Dout_6__5,Reg_Dout_6__4,Reg_Dout_6__3
                        ,Reg_Dout_6__2,Reg_Dout_6__1,Reg_Dout_6__0}), .S (
                        Reg_B_out_6), .Dout ({Reg_B_Dout[15],Reg_B_Dout[14],
                        Reg_B_Dout[13],Reg_B_Dout[12],Reg_B_Dout[11],
                        Reg_B_Dout[10],Reg_B_Dout[9],Reg_B_Dout[8],Reg_B_Dout[7]
                        ,Reg_B_Dout[6],Reg_B_Dout[5],Reg_B_Dout[4],Reg_B_Dout[3]
                        ,Reg_B_Dout[2],Reg_B_Dout[1],Reg_B_Dout[0]})) ;
    tri_state_buffer_16 L2_7_TRI_A (.Din ({PC_Dout[15],PC_Dout[14],PC_Dout[13],
                        PC_Dout[12],PC_Dout[11],PC_Dout[10],PC_Dout[9],
                        PC_Dout[8],PC_Dout[7],PC_Dout[6],PC_Dout[5],PC_Dout[4],
                        PC_Dout[3],PC_Dout[2],PC_Dout[1],PC_Dout[0]}), .S (
                        Reg_A_out_7), .Dout ({Reg_A_Dout[15],Reg_A_Dout[14],
                        Reg_A_Dout[13],Reg_A_Dout[12],Reg_A_Dout[11],
                        Reg_A_Dout[10],Reg_A_Dout[9],Reg_A_Dout[8],Reg_A_Dout[7]
                        ,Reg_A_Dout[6],Reg_A_Dout[5],Reg_A_Dout[4],Reg_A_Dout[3]
                        ,Reg_A_Dout[2],Reg_A_Dout[1],Reg_A_Dout[0]})) ;
    tri_state_buffer_16 L2_7_TRI_B (.Din ({PC_Dout[15],PC_Dout[14],PC_Dout[13],
                        PC_Dout[12],PC_Dout[11],PC_Dout[10],PC_Dout[9],
                        PC_Dout[8],PC_Dout[7],PC_Dout[6],PC_Dout[5],PC_Dout[4],
                        PC_Dout[3],PC_Dout[2],PC_Dout[1],PC_Dout[0]}), .S (
                        Reg_B_out_7), .Dout ({Reg_B_Dout[15],Reg_B_Dout[14],
                        Reg_B_Dout[13],Reg_B_Dout[12],Reg_B_Dout[11],
                        Reg_B_Dout[10],Reg_B_Dout[9],Reg_B_Dout[8],Reg_B_Dout[7]
                        ,Reg_B_Dout[6],Reg_B_Dout[5],Reg_B_Dout[4],Reg_B_Dout[3]
                        ,Reg_B_Dout[2],Reg_B_Dout[1],Reg_B_Dout[0]})) ;
    inv01 DEC_A_IN_ix185 (.Y (DEC_A_IN_nx184), .A (Reg_A_WR_Addr[0])) ;
    inv01 DEC_A_IN_ix188 (.Y (DEC_A_IN_nx187), .A (Reg_A_WR_Addr[1])) ;
    and03 DEC_A_IN_ix27 (.Y (Reg_A_in_3), .A0 (DEC_A_IN_nx2), .A1 (
          Reg_A_WR_Addr[1]), .A2 (Reg_A_WR_Addr[0])) ;
    nor02ii DEC_A_IN_ix3 (.Y (DEC_A_IN_nx2), .A0 (Reg_A_WR_Addr[2]), .A1 (
            Reg_A_WR)) ;
    nor03_2x DEC_A_IN_ix37 (.Y (Reg_A_in_4), .A0 (DEC_A_IN_nx192), .A1 (
             Reg_A_WR_Addr[1]), .A2 (Reg_A_WR_Addr[0])) ;
    nand02 DEC_A_IN_ix193 (.Y (DEC_A_IN_nx192), .A0 (Reg_A_WR_Addr[2]), .A1 (
           Reg_A_WR)) ;
    inv01 DEC_A_IN_ix180 (.Y (DEC_A_IN_nx179), .A (DEC_A_IN_nx2)) ;
    nor03_2x DEC_B_IN_ix11 (.Y (Reg_B_in_0), .A0 (DEC_B_IN_nx179), .A1 (
             Reg_B_WR_Addr[1]), .A2 (Reg_B_WR_Addr[0])) ;
    nor03_2x DEC_B_IN_ix17 (.Y (Reg_B_in_1), .A0 (DEC_B_IN_nx179), .A1 (
             Reg_B_WR_Addr[1]), .A2 (DEC_B_IN_nx184)) ;
    inv01 DEC_B_IN_ix185 (.Y (DEC_B_IN_nx184), .A (Reg_B_WR_Addr[0])) ;
    nor03_2x DEC_B_IN_ix23 (.Y (Reg_B_in_2), .A0 (DEC_B_IN_nx179), .A1 (
             DEC_B_IN_nx187), .A2 (Reg_B_WR_Addr[0])) ;
    inv01 DEC_B_IN_ix188 (.Y (DEC_B_IN_nx187), .A (Reg_B_WR_Addr[1])) ;
    and03 DEC_B_IN_ix27 (.Y (Reg_B_in_3), .A0 (DEC_B_IN_nx2), .A1 (
          Reg_B_WR_Addr[1]), .A2 (Reg_B_WR_Addr[0])) ;
    nor02ii DEC_B_IN_ix3 (.Y (DEC_B_IN_nx2), .A0 (Reg_B_WR_Addr[2]), .A1 (
            Reg_B_WR)) ;
    nor03_2x DEC_B_IN_ix37 (.Y (Reg_B_in_4), .A0 (DEC_B_IN_nx192), .A1 (
             Reg_B_WR_Addr[1]), .A2 (Reg_B_WR_Addr[0])) ;
    nand02 DEC_B_IN_ix193 (.Y (DEC_B_IN_nx192), .A0 (Reg_B_WR_Addr[2]), .A1 (
           Reg_B_WR)) ;
    nor03_2x DEC_B_IN_ix43 (.Y (Reg_B_in_5), .A0 (DEC_B_IN_nx192), .A1 (
             Reg_B_WR_Addr[1]), .A2 (DEC_B_IN_nx184)) ;
    nor03_2x DEC_B_IN_ix49 (.Y (Reg_B_in_6), .A0 (DEC_B_IN_nx192), .A1 (
             DEC_B_IN_nx187), .A2 (Reg_B_WR_Addr[0])) ;
    inv01 DEC_B_IN_ix180 (.Y (DEC_B_IN_nx179), .A (DEC_B_IN_nx2)) ;
    nor03_2x DEC_A_OUT_ix11 (.Y (Reg_A_out_0), .A0 (DEC_A_OUT_nx179), .A1 (
             Reg_A_RD_Addr[1]), .A2 (Reg_A_RD_Addr[0])) ;
    nor03_2x DEC_A_OUT_ix17 (.Y (Reg_A_out_1), .A0 (DEC_A_OUT_nx179), .A1 (
             Reg_A_RD_Addr[1]), .A2 (DEC_A_OUT_nx184)) ;
    inv01 DEC_A_OUT_ix185 (.Y (DEC_A_OUT_nx184), .A (Reg_A_RD_Addr[0])) ;
    nor03_2x DEC_A_OUT_ix23 (.Y (Reg_A_out_2), .A0 (DEC_A_OUT_nx179), .A1 (
             DEC_A_OUT_nx187), .A2 (Reg_A_RD_Addr[0])) ;
    inv01 DEC_A_OUT_ix188 (.Y (DEC_A_OUT_nx187), .A (Reg_A_RD_Addr[1])) ;
    and03 DEC_A_OUT_ix27 (.Y (Reg_A_out_3), .A0 (DEC_A_OUT_nx2), .A1 (
          Reg_A_RD_Addr[1]), .A2 (Reg_A_RD_Addr[0])) ;
    nor02ii DEC_A_OUT_ix3 (.Y (DEC_A_OUT_nx2), .A0 (Reg_A_RD_Addr[2]), .A1 (PWR)
            ) ;
    nor03_2x DEC_A_OUT_ix37 (.Y (Reg_A_out_4), .A0 (DEC_A_OUT_nx192), .A1 (
             Reg_A_RD_Addr[1]), .A2 (Reg_A_RD_Addr[0])) ;
    nand02 DEC_A_OUT_ix193 (.Y (DEC_A_OUT_nx192), .A0 (Reg_A_RD_Addr[2]), .A1 (
           PWR)) ;
    nor03_2x DEC_A_OUT_ix43 (.Y (Reg_A_out_5), .A0 (DEC_A_OUT_nx192), .A1 (
             Reg_A_RD_Addr[1]), .A2 (DEC_A_OUT_nx184)) ;
    nor03_2x DEC_A_OUT_ix49 (.Y (Reg_A_out_6), .A0 (DEC_A_OUT_nx192), .A1 (
             DEC_A_OUT_nx187), .A2 (Reg_A_RD_Addr[0])) ;
    nor03_2x DEC_A_OUT_ix53 (.Y (Reg_A_out_7), .A0 (DEC_A_OUT_nx192), .A1 (
             DEC_A_OUT_nx187), .A2 (DEC_A_OUT_nx184)) ;
    inv01 DEC_A_OUT_ix180 (.Y (DEC_A_OUT_nx179), .A (DEC_A_OUT_nx2)) ;
    nor03_2x DEC_B_OUT_ix11 (.Y (Reg_B_out_0), .A0 (DEC_B_OUT_nx179), .A1 (
             Reg_B_RD_Addr[1]), .A2 (Reg_B_RD_Addr[0])) ;
    nor03_2x DEC_B_OUT_ix17 (.Y (Reg_B_out_1), .A0 (DEC_B_OUT_nx179), .A1 (
             Reg_B_RD_Addr[1]), .A2 (DEC_B_OUT_nx184)) ;
    inv01 DEC_B_OUT_ix185 (.Y (DEC_B_OUT_nx184), .A (Reg_B_RD_Addr[0])) ;
    nor03_2x DEC_B_OUT_ix23 (.Y (Reg_B_out_2), .A0 (DEC_B_OUT_nx179), .A1 (
             DEC_B_OUT_nx187), .A2 (Reg_B_RD_Addr[0])) ;
    inv01 DEC_B_OUT_ix188 (.Y (DEC_B_OUT_nx187), .A (Reg_B_RD_Addr[1])) ;
    and03 DEC_B_OUT_ix27 (.Y (Reg_B_out_3), .A0 (DEC_B_OUT_nx2), .A1 (
          Reg_B_RD_Addr[1]), .A2 (Reg_B_RD_Addr[0])) ;
    nor02ii DEC_B_OUT_ix3 (.Y (DEC_B_OUT_nx2), .A0 (Reg_B_RD_Addr[2]), .A1 (PWR)
            ) ;
    nor03_2x DEC_B_OUT_ix37 (.Y (Reg_B_out_4), .A0 (DEC_B_OUT_nx192), .A1 (
             Reg_B_RD_Addr[1]), .A2 (Reg_B_RD_Addr[0])) ;
    nand02 DEC_B_OUT_ix193 (.Y (DEC_B_OUT_nx192), .A0 (Reg_B_RD_Addr[2]), .A1 (
           PWR)) ;
    nor03_2x DEC_B_OUT_ix43 (.Y (Reg_B_out_5), .A0 (DEC_B_OUT_nx192), .A1 (
             Reg_B_RD_Addr[1]), .A2 (DEC_B_OUT_nx184)) ;
    nor03_2x DEC_B_OUT_ix49 (.Y (Reg_B_out_6), .A0 (DEC_B_OUT_nx192), .A1 (
             DEC_B_OUT_nx187), .A2 (Reg_B_RD_Addr[0])) ;
    nor03_2x DEC_B_OUT_ix53 (.Y (Reg_B_out_7), .A0 (DEC_B_OUT_nx192), .A1 (
             DEC_B_OUT_nx187), .A2 (DEC_B_OUT_nx184)) ;
    inv01 DEC_B_OUT_ix180 (.Y (DEC_B_OUT_nx179), .A (DEC_B_OUT_nx2)) ;
    fake_vcc ix1137 (.Y (PWR)) ;
    or02 ix897 (.Y (Reg_EN_0), .A0 (nx1364), .A1 (Reg_B_in_0)) ;
    or02 ix899 (.Y (Reg_EN_1), .A0 (nx1356), .A1 (Reg_B_in_1)) ;
    or02 ix901 (.Y (Reg_EN_2), .A0 (nx1348), .A1 (Reg_B_in_2)) ;
    or02 ix903 (.Y (Reg_EN_3), .A0 (nx1340), .A1 (Reg_B_in_3)) ;
    or02 ix905 (.Y (Reg_EN_4), .A0 (nx1332), .A1 (Reg_B_in_4)) ;
    or02 ix907 (.Y (Reg_EN_5), .A0 (nx1324), .A1 (Reg_B_in_5)) ;
    or02 ix909 (.Y (Reg_EN_6), .A0 (nx1316), .A1 (Reg_B_in_6)) ;
    inv02 ix1315 (.Y (nx1316), .A (nx1314)) ;
    inv02 ix1323 (.Y (nx1324), .A (nx1322)) ;
    inv02 ix1331 (.Y (nx1332), .A (nx1386)) ;
    inv02 ix1339 (.Y (nx1340), .A (nx1392)) ;
    inv02 ix1347 (.Y (nx1348), .A (nx1346)) ;
    inv02 ix1355 (.Y (nx1356), .A (nx1354)) ;
    inv02 ix1363 (.Y (nx1364), .A (nx1362)) ;
    or03 DEC_A_IN_ix11 (.Y (nx1362), .A0 (DEC_A_IN_nx179), .A1 (Reg_A_WR_Addr[1]
         ), .A2 (Reg_A_WR_Addr[0])) ;
    nand03 DEC_A_IN_ix17 (.Y (nx1354), .A0 (DEC_A_IN_nx2), .A1 (DEC_A_IN_nx187)
           , .A2 (Reg_A_WR_Addr[0])) ;
    nand03 DEC_A_IN_ix23 (.Y (nx1346), .A0 (DEC_A_IN_nx2), .A1 (Reg_A_WR_Addr[1]
           ), .A2 (DEC_A_IN_nx184)) ;
    or03 DEC_A_IN_ix43 (.Y (nx1322), .A0 (DEC_A_IN_nx192), .A1 (Reg_A_WR_Addr[1]
         ), .A2 (DEC_A_IN_nx184)) ;
    or03 DEC_A_IN_ix49 (.Y (nx1314), .A0 (DEC_A_IN_nx192), .A1 (DEC_A_IN_nx187)
         , .A2 (Reg_A_WR_Addr[0])) ;
    mux21_ni ix7 (.Y (Reg_Din_6__0), .A0 (Reg_A_Din[0]), .A1 (Reg_B_Din[0]), .S0 (
             nx1374)) ;
    mux21_ni ix15 (.Y (Reg_Din_6__1), .A0 (Reg_A_Din[1]), .A1 (Reg_B_Din[1]), .S0 (
             nx1374)) ;
    mux21_ni ix23 (.Y (Reg_Din_6__2), .A0 (Reg_A_Din[2]), .A1 (Reg_B_Din[2]), .S0 (
             nx1374)) ;
    mux21_ni ix31 (.Y (Reg_Din_6__3), .A0 (Reg_A_Din[3]), .A1 (Reg_B_Din[3]), .S0 (
             nx1374)) ;
    mux21_ni ix39 (.Y (Reg_Din_6__4), .A0 (Reg_A_Din[4]), .A1 (Reg_B_Din[4]), .S0 (
             nx1374)) ;
    mux21_ni ix47 (.Y (Reg_Din_6__5), .A0 (Reg_A_Din[5]), .A1 (Reg_B_Din[5]), .S0 (
             nx1374)) ;
    mux21_ni ix55 (.Y (Reg_Din_6__6), .A0 (Reg_A_Din[6]), .A1 (Reg_B_Din[6]), .S0 (
             nx1374)) ;
    mux21_ni ix63 (.Y (Reg_Din_6__7), .A0 (Reg_A_Din[7]), .A1 (Reg_B_Din[7]), .S0 (
             nx1376)) ;
    mux21_ni ix71 (.Y (Reg_Din_6__8), .A0 (Reg_A_Din[8]), .A1 (Reg_B_Din[8]), .S0 (
             nx1376)) ;
    mux21_ni ix79 (.Y (Reg_Din_6__9), .A0 (Reg_A_Din[9]), .A1 (Reg_B_Din[9]), .S0 (
             nx1376)) ;
    mux21_ni ix87 (.Y (Reg_Din_6__10), .A0 (Reg_A_Din[10]), .A1 (Reg_B_Din[10])
             , .S0 (nx1376)) ;
    mux21_ni ix95 (.Y (Reg_Din_6__11), .A0 (Reg_A_Din[11]), .A1 (Reg_B_Din[11])
             , .S0 (nx1376)) ;
    mux21_ni ix103 (.Y (Reg_Din_6__12), .A0 (Reg_A_Din[12]), .A1 (Reg_B_Din[12])
             , .S0 (nx1376)) ;
    mux21_ni ix111 (.Y (Reg_Din_6__13), .A0 (Reg_A_Din[13]), .A1 (Reg_B_Din[13])
             , .S0 (nx1376)) ;
    mux21_ni ix119 (.Y (Reg_Din_6__14), .A0 (Reg_A_Din[14]), .A1 (Reg_B_Din[14])
             , .S0 (nx1378)) ;
    mux21_ni ix127 (.Y (Reg_Din_6__15), .A0 (Reg_A_Din[15]), .A1 (Reg_B_Din[15])
             , .S0 (nx1378)) ;
    mux21_ni ix135 (.Y (Reg_Din_5__0), .A0 (Reg_A_Din[0]), .A1 (Reg_B_Din[0]), .S0 (
             nx1380)) ;
    mux21_ni ix143 (.Y (Reg_Din_5__1), .A0 (Reg_A_Din[1]), .A1 (Reg_B_Din[1]), .S0 (
             nx1380)) ;
    mux21_ni ix151 (.Y (Reg_Din_5__2), .A0 (Reg_A_Din[2]), .A1 (Reg_B_Din[2]), .S0 (
             nx1380)) ;
    mux21_ni ix159 (.Y (Reg_Din_5__3), .A0 (Reg_A_Din[3]), .A1 (Reg_B_Din[3]), .S0 (
             nx1380)) ;
    mux21_ni ix167 (.Y (Reg_Din_5__4), .A0 (Reg_A_Din[4]), .A1 (Reg_B_Din[4]), .S0 (
             nx1380)) ;
    mux21_ni ix175 (.Y (Reg_Din_5__5), .A0 (Reg_A_Din[5]), .A1 (Reg_B_Din[5]), .S0 (
             nx1380)) ;
    mux21_ni ix183 (.Y (Reg_Din_5__6), .A0 (Reg_A_Din[6]), .A1 (Reg_B_Din[6]), .S0 (
             nx1380)) ;
    mux21_ni ix191 (.Y (Reg_Din_5__7), .A0 (Reg_A_Din[7]), .A1 (Reg_B_Din[7]), .S0 (
             nx1382)) ;
    mux21_ni ix199 (.Y (Reg_Din_5__8), .A0 (Reg_A_Din[8]), .A1 (Reg_B_Din[8]), .S0 (
             nx1382)) ;
    mux21_ni ix207 (.Y (Reg_Din_5__9), .A0 (Reg_A_Din[9]), .A1 (Reg_B_Din[9]), .S0 (
             nx1382)) ;
    mux21_ni ix215 (.Y (Reg_Din_5__10), .A0 (Reg_A_Din[10]), .A1 (Reg_B_Din[10])
             , .S0 (nx1382)) ;
    mux21_ni ix223 (.Y (Reg_Din_5__11), .A0 (Reg_A_Din[11]), .A1 (Reg_B_Din[11])
             , .S0 (nx1382)) ;
    mux21_ni ix231 (.Y (Reg_Din_5__12), .A0 (Reg_A_Din[12]), .A1 (Reg_B_Din[12])
             , .S0 (nx1382)) ;
    mux21_ni ix239 (.Y (Reg_Din_5__13), .A0 (Reg_A_Din[13]), .A1 (Reg_B_Din[13])
             , .S0 (nx1382)) ;
    mux21_ni ix247 (.Y (Reg_Din_5__14), .A0 (Reg_A_Din[14]), .A1 (Reg_B_Din[14])
             , .S0 (nx1384)) ;
    mux21_ni ix255 (.Y (Reg_Din_5__15), .A0 (Reg_A_Din[15]), .A1 (Reg_B_Din[15])
             , .S0 (nx1384)) ;
    mux21_ni ix263 (.Y (Reg_Din_4__0), .A0 (Reg_A_Din[0]), .A1 (Reg_B_Din[0]), .S0 (
             nx1386)) ;
    mux21_ni ix271 (.Y (Reg_Din_4__1), .A0 (Reg_A_Din[1]), .A1 (Reg_B_Din[1]), .S0 (
             nx1386)) ;
    mux21_ni ix279 (.Y (Reg_Din_4__2), .A0 (Reg_A_Din[2]), .A1 (Reg_B_Din[2]), .S0 (
             nx1386)) ;
    mux21_ni ix287 (.Y (Reg_Din_4__3), .A0 (Reg_A_Din[3]), .A1 (Reg_B_Din[3]), .S0 (
             nx1386)) ;
    mux21_ni ix295 (.Y (Reg_Din_4__4), .A0 (Reg_A_Din[4]), .A1 (Reg_B_Din[4]), .S0 (
             nx1386)) ;
    mux21_ni ix303 (.Y (Reg_Din_4__5), .A0 (Reg_A_Din[5]), .A1 (Reg_B_Din[5]), .S0 (
             nx1386)) ;
    mux21_ni ix311 (.Y (Reg_Din_4__6), .A0 (Reg_A_Din[6]), .A1 (Reg_B_Din[6]), .S0 (
             nx1388)) ;
    mux21_ni ix319 (.Y (Reg_Din_4__7), .A0 (Reg_A_Din[7]), .A1 (Reg_B_Din[7]), .S0 (
             nx1388)) ;
    mux21_ni ix327 (.Y (Reg_Din_4__8), .A0 (Reg_A_Din[8]), .A1 (Reg_B_Din[8]), .S0 (
             nx1388)) ;
    mux21_ni ix335 (.Y (Reg_Din_4__9), .A0 (Reg_A_Din[9]), .A1 (Reg_B_Din[9]), .S0 (
             nx1388)) ;
    mux21_ni ix343 (.Y (Reg_Din_4__10), .A0 (Reg_A_Din[10]), .A1 (Reg_B_Din[10])
             , .S0 (nx1388)) ;
    mux21_ni ix351 (.Y (Reg_Din_4__11), .A0 (Reg_A_Din[11]), .A1 (Reg_B_Din[11])
             , .S0 (nx1388)) ;
    mux21_ni ix359 (.Y (Reg_Din_4__12), .A0 (Reg_A_Din[12]), .A1 (Reg_B_Din[12])
             , .S0 (nx1388)) ;
    mux21_ni ix367 (.Y (Reg_Din_4__13), .A0 (Reg_A_Din[13]), .A1 (Reg_B_Din[13])
             , .S0 (nx1390)) ;
    mux21_ni ix375 (.Y (Reg_Din_4__14), .A0 (Reg_A_Din[14]), .A1 (Reg_B_Din[14])
             , .S0 (nx1390)) ;
    mux21_ni ix383 (.Y (Reg_Din_4__15), .A0 (Reg_A_Din[15]), .A1 (Reg_B_Din[15])
             , .S0 (nx1390)) ;
    mux21_ni ix391 (.Y (Reg_Din_3__0), .A0 (Reg_A_Din[0]), .A1 (Reg_B_Din[0]), .S0 (
             nx1392)) ;
    mux21_ni ix399 (.Y (Reg_Din_3__1), .A0 (Reg_A_Din[1]), .A1 (Reg_B_Din[1]), .S0 (
             nx1392)) ;
    mux21_ni ix407 (.Y (Reg_Din_3__2), .A0 (Reg_A_Din[2]), .A1 (Reg_B_Din[2]), .S0 (
             nx1392)) ;
    mux21_ni ix415 (.Y (Reg_Din_3__3), .A0 (Reg_A_Din[3]), .A1 (Reg_B_Din[3]), .S0 (
             nx1392)) ;
    mux21_ni ix423 (.Y (Reg_Din_3__4), .A0 (Reg_A_Din[4]), .A1 (Reg_B_Din[4]), .S0 (
             nx1392)) ;
    mux21_ni ix431 (.Y (Reg_Din_3__5), .A0 (Reg_A_Din[5]), .A1 (Reg_B_Din[5]), .S0 (
             nx1392)) ;
    mux21_ni ix439 (.Y (Reg_Din_3__6), .A0 (Reg_A_Din[6]), .A1 (Reg_B_Din[6]), .S0 (
             nx1394)) ;
    mux21_ni ix447 (.Y (Reg_Din_3__7), .A0 (Reg_A_Din[7]), .A1 (Reg_B_Din[7]), .S0 (
             nx1394)) ;
    mux21_ni ix455 (.Y (Reg_Din_3__8), .A0 (Reg_A_Din[8]), .A1 (Reg_B_Din[8]), .S0 (
             nx1394)) ;
    mux21_ni ix463 (.Y (Reg_Din_3__9), .A0 (Reg_A_Din[9]), .A1 (Reg_B_Din[9]), .S0 (
             nx1394)) ;
    mux21_ni ix471 (.Y (Reg_Din_3__10), .A0 (Reg_A_Din[10]), .A1 (Reg_B_Din[10])
             , .S0 (nx1394)) ;
    mux21_ni ix479 (.Y (Reg_Din_3__11), .A0 (Reg_A_Din[11]), .A1 (Reg_B_Din[11])
             , .S0 (nx1394)) ;
    mux21_ni ix487 (.Y (Reg_Din_3__12), .A0 (Reg_A_Din[12]), .A1 (Reg_B_Din[12])
             , .S0 (nx1394)) ;
    mux21_ni ix495 (.Y (Reg_Din_3__13), .A0 (Reg_A_Din[13]), .A1 (Reg_B_Din[13])
             , .S0 (nx1396)) ;
    mux21_ni ix503 (.Y (Reg_Din_3__14), .A0 (Reg_A_Din[14]), .A1 (Reg_B_Din[14])
             , .S0 (nx1396)) ;
    mux21_ni ix511 (.Y (Reg_Din_3__15), .A0 (Reg_A_Din[15]), .A1 (Reg_B_Din[15])
             , .S0 (nx1396)) ;
    mux21_ni ix519 (.Y (Reg_Din_2__0), .A0 (Reg_A_Din[0]), .A1 (Reg_B_Din[0]), .S0 (
             nx1398)) ;
    mux21_ni ix527 (.Y (Reg_Din_2__1), .A0 (Reg_A_Din[1]), .A1 (Reg_B_Din[1]), .S0 (
             nx1398)) ;
    mux21_ni ix535 (.Y (Reg_Din_2__2), .A0 (Reg_A_Din[2]), .A1 (Reg_B_Din[2]), .S0 (
             nx1398)) ;
    mux21_ni ix543 (.Y (Reg_Din_2__3), .A0 (Reg_A_Din[3]), .A1 (Reg_B_Din[3]), .S0 (
             nx1398)) ;
    mux21_ni ix551 (.Y (Reg_Din_2__4), .A0 (Reg_A_Din[4]), .A1 (Reg_B_Din[4]), .S0 (
             nx1398)) ;
    mux21_ni ix559 (.Y (Reg_Din_2__5), .A0 (Reg_A_Din[5]), .A1 (Reg_B_Din[5]), .S0 (
             nx1398)) ;
    mux21_ni ix567 (.Y (Reg_Din_2__6), .A0 (Reg_A_Din[6]), .A1 (Reg_B_Din[6]), .S0 (
             nx1398)) ;
    mux21_ni ix575 (.Y (Reg_Din_2__7), .A0 (Reg_A_Din[7]), .A1 (Reg_B_Din[7]), .S0 (
             nx1400)) ;
    mux21_ni ix583 (.Y (Reg_Din_2__8), .A0 (Reg_A_Din[8]), .A1 (Reg_B_Din[8]), .S0 (
             nx1400)) ;
    mux21_ni ix591 (.Y (Reg_Din_2__9), .A0 (Reg_A_Din[9]), .A1 (Reg_B_Din[9]), .S0 (
             nx1400)) ;
    mux21_ni ix599 (.Y (Reg_Din_2__10), .A0 (Reg_A_Din[10]), .A1 (Reg_B_Din[10])
             , .S0 (nx1400)) ;
    mux21_ni ix607 (.Y (Reg_Din_2__11), .A0 (Reg_A_Din[11]), .A1 (Reg_B_Din[11])
             , .S0 (nx1400)) ;
    mux21_ni ix615 (.Y (Reg_Din_2__12), .A0 (Reg_A_Din[12]), .A1 (Reg_B_Din[12])
             , .S0 (nx1400)) ;
    mux21_ni ix623 (.Y (Reg_Din_2__13), .A0 (Reg_A_Din[13]), .A1 (Reg_B_Din[13])
             , .S0 (nx1400)) ;
    mux21_ni ix631 (.Y (Reg_Din_2__14), .A0 (Reg_A_Din[14]), .A1 (Reg_B_Din[14])
             , .S0 (nx1402)) ;
    mux21_ni ix639 (.Y (Reg_Din_2__15), .A0 (Reg_A_Din[15]), .A1 (Reg_B_Din[15])
             , .S0 (nx1402)) ;
    mux21_ni ix647 (.Y (Reg_Din_1__0), .A0 (Reg_A_Din[0]), .A1 (Reg_B_Din[0]), .S0 (
             nx1404)) ;
    mux21_ni ix655 (.Y (Reg_Din_1__1), .A0 (Reg_A_Din[1]), .A1 (Reg_B_Din[1]), .S0 (
             nx1404)) ;
    mux21_ni ix663 (.Y (Reg_Din_1__2), .A0 (Reg_A_Din[2]), .A1 (Reg_B_Din[2]), .S0 (
             nx1404)) ;
    mux21_ni ix671 (.Y (Reg_Din_1__3), .A0 (Reg_A_Din[3]), .A1 (Reg_B_Din[3]), .S0 (
             nx1404)) ;
    mux21_ni ix679 (.Y (Reg_Din_1__4), .A0 (Reg_A_Din[4]), .A1 (Reg_B_Din[4]), .S0 (
             nx1404)) ;
    mux21_ni ix687 (.Y (Reg_Din_1__5), .A0 (Reg_A_Din[5]), .A1 (Reg_B_Din[5]), .S0 (
             nx1404)) ;
    mux21_ni ix695 (.Y (Reg_Din_1__6), .A0 (Reg_A_Din[6]), .A1 (Reg_B_Din[6]), .S0 (
             nx1404)) ;
    mux21_ni ix703 (.Y (Reg_Din_1__7), .A0 (Reg_A_Din[7]), .A1 (Reg_B_Din[7]), .S0 (
             nx1406)) ;
    mux21_ni ix711 (.Y (Reg_Din_1__8), .A0 (Reg_A_Din[8]), .A1 (Reg_B_Din[8]), .S0 (
             nx1406)) ;
    mux21_ni ix719 (.Y (Reg_Din_1__9), .A0 (Reg_A_Din[9]), .A1 (Reg_B_Din[9]), .S0 (
             nx1406)) ;
    mux21_ni ix727 (.Y (Reg_Din_1__10), .A0 (Reg_A_Din[10]), .A1 (Reg_B_Din[10])
             , .S0 (nx1406)) ;
    mux21_ni ix735 (.Y (Reg_Din_1__11), .A0 (Reg_A_Din[11]), .A1 (Reg_B_Din[11])
             , .S0 (nx1406)) ;
    mux21_ni ix743 (.Y (Reg_Din_1__12), .A0 (Reg_A_Din[12]), .A1 (Reg_B_Din[12])
             , .S0 (nx1406)) ;
    mux21_ni ix751 (.Y (Reg_Din_1__13), .A0 (Reg_A_Din[13]), .A1 (Reg_B_Din[13])
             , .S0 (nx1406)) ;
    mux21_ni ix759 (.Y (Reg_Din_1__14), .A0 (Reg_A_Din[14]), .A1 (Reg_B_Din[14])
             , .S0 (nx1408)) ;
    mux21_ni ix767 (.Y (Reg_Din_1__15), .A0 (Reg_A_Din[15]), .A1 (Reg_B_Din[15])
             , .S0 (nx1408)) ;
    mux21_ni ix775 (.Y (Reg_Din_0__0), .A0 (Reg_A_Din[0]), .A1 (Reg_B_Din[0]), .S0 (
             nx1410)) ;
    mux21_ni ix783 (.Y (Reg_Din_0__1), .A0 (Reg_A_Din[1]), .A1 (Reg_B_Din[1]), .S0 (
             nx1410)) ;
    mux21_ni ix791 (.Y (Reg_Din_0__2), .A0 (Reg_A_Din[2]), .A1 (Reg_B_Din[2]), .S0 (
             nx1410)) ;
    mux21_ni ix799 (.Y (Reg_Din_0__3), .A0 (Reg_A_Din[3]), .A1 (Reg_B_Din[3]), .S0 (
             nx1410)) ;
    mux21_ni ix807 (.Y (Reg_Din_0__4), .A0 (Reg_A_Din[4]), .A1 (Reg_B_Din[4]), .S0 (
             nx1410)) ;
    mux21_ni ix815 (.Y (Reg_Din_0__5), .A0 (Reg_A_Din[5]), .A1 (Reg_B_Din[5]), .S0 (
             nx1410)) ;
    mux21_ni ix823 (.Y (Reg_Din_0__6), .A0 (Reg_A_Din[6]), .A1 (Reg_B_Din[6]), .S0 (
             nx1410)) ;
    mux21_ni ix831 (.Y (Reg_Din_0__7), .A0 (Reg_A_Din[7]), .A1 (Reg_B_Din[7]), .S0 (
             nx1412)) ;
    mux21_ni ix839 (.Y (Reg_Din_0__8), .A0 (Reg_A_Din[8]), .A1 (Reg_B_Din[8]), .S0 (
             nx1412)) ;
    mux21_ni ix847 (.Y (Reg_Din_0__9), .A0 (Reg_A_Din[9]), .A1 (Reg_B_Din[9]), .S0 (
             nx1412)) ;
    mux21_ni ix855 (.Y (Reg_Din_0__10), .A0 (Reg_A_Din[10]), .A1 (Reg_B_Din[10])
             , .S0 (nx1412)) ;
    mux21_ni ix863 (.Y (Reg_Din_0__11), .A0 (Reg_A_Din[11]), .A1 (Reg_B_Din[11])
             , .S0 (nx1412)) ;
    mux21_ni ix871 (.Y (Reg_Din_0__12), .A0 (Reg_A_Din[12]), .A1 (Reg_B_Din[12])
             , .S0 (nx1412)) ;
    mux21_ni ix879 (.Y (Reg_Din_0__13), .A0 (Reg_A_Din[13]), .A1 (Reg_B_Din[13])
             , .S0 (nx1412)) ;
    mux21_ni ix887 (.Y (Reg_Din_0__14), .A0 (Reg_A_Din[14]), .A1 (Reg_B_Din[14])
             , .S0 (nx1414)) ;
    mux21_ni ix895 (.Y (Reg_Din_0__15), .A0 (Reg_A_Din[15]), .A1 (Reg_B_Din[15])
             , .S0 (nx1414)) ;
    inv02 ix1373 (.Y (nx1374), .A (nx1316)) ;
    inv02 ix1375 (.Y (nx1376), .A (nx1316)) ;
    inv02 ix1377 (.Y (nx1378), .A (nx1316)) ;
    inv02 ix1379 (.Y (nx1380), .A (nx1324)) ;
    inv02 ix1381 (.Y (nx1382), .A (nx1324)) ;
    inv02 ix1383 (.Y (nx1384), .A (nx1324)) ;
    inv02 ix1385 (.Y (nx1386), .A (Reg_A_in_4)) ;
    inv02 ix1387 (.Y (nx1388), .A (Reg_A_in_4)) ;
    inv02 ix1389 (.Y (nx1390), .A (Reg_A_in_4)) ;
    inv02 ix1391 (.Y (nx1392), .A (Reg_A_in_3)) ;
    inv02 ix1393 (.Y (nx1394), .A (Reg_A_in_3)) ;
    inv02 ix1395 (.Y (nx1396), .A (Reg_A_in_3)) ;
    inv02 ix1397 (.Y (nx1398), .A (nx1348)) ;
    inv02 ix1399 (.Y (nx1400), .A (nx1348)) ;
    inv02 ix1401 (.Y (nx1402), .A (nx1348)) ;
    inv02 ix1403 (.Y (nx1404), .A (nx1356)) ;
    inv02 ix1405 (.Y (nx1406), .A (nx1356)) ;
    inv02 ix1407 (.Y (nx1408), .A (nx1356)) ;
    inv02 ix1409 (.Y (nx1410), .A (nx1364)) ;
    inv02 ix1411 (.Y (nx1412), .A (nx1364)) ;
    inv02 ix1413 (.Y (nx1414), .A (nx1364)) ;
endmodule


module tri_state_buffer_16 ( Din, S, Dout ) ;

    input [15:0]Din ;
    input S ;
    output [15:0]Dout ;




endmodule


module register_edge_falling_16 ( CLK, RST, EN, Din, Dout ) ;

    input CLK ;
    input RST ;
    input EN ;
    input [15:0]Din ;
    output [15:0]Dout ;




endmodule


module register_edge_rising_16 ( CLK, RST, EN, Din, Dout ) ;

    input CLK ;
    input RST ;
    input EN ;
    input [15:0]Din ;
    output [15:0]Dout ;




endmodule

