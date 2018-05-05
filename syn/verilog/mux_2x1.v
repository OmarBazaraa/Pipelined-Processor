//
// Verilog description for cell mux_2x1, 
// Sat May  5 04:01:46 2018
//
// LeonardoSpectrum Level 3, 2017a.2 
//


module mux_2x1 ( A, B, S, Dout ) ;

    input [15:0]A ;
    input [15:0]B ;
    input S ;
    output [15:0]Dout ;




    mux21_ni ix7 (.Y (Dout[0]), .A0 (A[0]), .A1 (B[0]), .S0 (S)) ;
    mux21_ni ix15 (.Y (Dout[1]), .A0 (A[1]), .A1 (B[1]), .S0 (S)) ;
    mux21_ni ix23 (.Y (Dout[2]), .A0 (A[2]), .A1 (B[2]), .S0 (S)) ;
    mux21_ni ix31 (.Y (Dout[3]), .A0 (A[3]), .A1 (B[3]), .S0 (S)) ;
    mux21_ni ix39 (.Y (Dout[4]), .A0 (A[4]), .A1 (B[4]), .S0 (S)) ;
    mux21_ni ix47 (.Y (Dout[5]), .A0 (A[5]), .A1 (B[5]), .S0 (S)) ;
    mux21_ni ix55 (.Y (Dout[6]), .A0 (A[6]), .A1 (B[6]), .S0 (S)) ;
    mux21_ni ix63 (.Y (Dout[7]), .A0 (A[7]), .A1 (B[7]), .S0 (S)) ;
    mux21_ni ix71 (.Y (Dout[8]), .A0 (A[8]), .A1 (B[8]), .S0 (S)) ;
    mux21_ni ix79 (.Y (Dout[9]), .A0 (A[9]), .A1 (B[9]), .S0 (S)) ;
    mux21_ni ix87 (.Y (Dout[10]), .A0 (A[10]), .A1 (B[10]), .S0 (S)) ;
    mux21_ni ix95 (.Y (Dout[11]), .A0 (A[11]), .A1 (B[11]), .S0 (S)) ;
    mux21_ni ix103 (.Y (Dout[12]), .A0 (A[12]), .A1 (B[12]), .S0 (S)) ;
    mux21_ni ix111 (.Y (Dout[13]), .A0 (A[13]), .A1 (B[13]), .S0 (S)) ;
    mux21_ni ix119 (.Y (Dout[14]), .A0 (A[14]), .A1 (B[14]), .S0 (S)) ;
    mux21_ni ix127 (.Y (Dout[15]), .A0 (A[15]), .A1 (B[15]), .S0 (S)) ;
endmodule

