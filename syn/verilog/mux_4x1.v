//
// Verilog description for cell mux_4x1, 
// Sat May  5 04:02:07 2018
//
// LeonardoSpectrum Level 3, 2017a.2 
//


module mux_4x1 ( A, B, C, D, S, Dout ) ;

    input [15:0]A ;
    input [15:0]B ;
    input [15:0]C ;
    input [15:0]D ;
    input [1:0]S ;
    output [15:0]Dout ;

    wire nx2, nx8, nx18, nx22, nx161, nx167, nx179, nx181, nx185, nx187, nx191, 
         nx193, nx197, nx199, nx203, nx205, nx209, nx211, nx215, nx217, nx221, 
         nx223, nx227, nx229, nx233, nx235, nx239, nx241, nx244, nx246, nx249, 
         nx251, nx254, nx256, nx259, nx261, nx268, nx270, nx272, nx274, nx276, 
         nx278, nx280, nx282, nx284, nx286, nx292, nx294, nx296, nx298;



    nand02 ix29 (.Y (Dout[0]), .A0 (nx161), .A1 (nx167)) ;
    aoi22 ix162 (.Y (nx161), .A0 (A[0]), .A1 (nx276), .B0 (D[0]), .B1 (nx282)) ;
    nor02_2x ix19 (.Y (nx18), .A0 (S[1]), .A1 (S[0])) ;
    and02 ix23 (.Y (nx22), .A0 (S[1]), .A1 (S[0])) ;
    aoi22 ix168 (.Y (nx167), .A0 (B[0]), .A1 (nx296), .B0 (C[0]), .B1 (nx292)) ;
    nand02 ix43 (.Y (Dout[1]), .A0 (nx179), .A1 (nx181)) ;
    aoi22 ix180 (.Y (nx179), .A0 (A[1]), .A1 (nx276), .B0 (D[1]), .B1 (nx282)) ;
    aoi22 ix182 (.Y (nx181), .A0 (B[1]), .A1 (nx296), .B0 (C[1]), .B1 (nx292)) ;
    nand02 ix57 (.Y (Dout[2]), .A0 (nx185), .A1 (nx187)) ;
    aoi22 ix186 (.Y (nx185), .A0 (A[2]), .A1 (nx276), .B0 (D[2]), .B1 (nx282)) ;
    aoi22 ix188 (.Y (nx187), .A0 (B[2]), .A1 (nx296), .B0 (C[2]), .B1 (nx292)) ;
    nand02 ix71 (.Y (Dout[3]), .A0 (nx191), .A1 (nx193)) ;
    aoi22 ix192 (.Y (nx191), .A0 (A[3]), .A1 (nx276), .B0 (D[3]), .B1 (nx282)) ;
    aoi22 ix194 (.Y (nx193), .A0 (B[3]), .A1 (nx296), .B0 (C[3]), .B1 (nx292)) ;
    nand02 ix85 (.Y (Dout[4]), .A0 (nx197), .A1 (nx199)) ;
    aoi22 ix198 (.Y (nx197), .A0 (A[4]), .A1 (nx276), .B0 (D[4]), .B1 (nx282)) ;
    aoi22 ix200 (.Y (nx199), .A0 (B[4]), .A1 (nx296), .B0 (C[4]), .B1 (nx292)) ;
    nand02 ix99 (.Y (Dout[5]), .A0 (nx203), .A1 (nx205)) ;
    aoi22 ix204 (.Y (nx203), .A0 (A[5]), .A1 (nx276), .B0 (D[5]), .B1 (nx282)) ;
    aoi22 ix206 (.Y (nx205), .A0 (B[5]), .A1 (nx296), .B0 (C[5]), .B1 (nx292)) ;
    nand02 ix113 (.Y (Dout[6]), .A0 (nx209), .A1 (nx211)) ;
    aoi22 ix210 (.Y (nx209), .A0 (A[6]), .A1 (nx276), .B0 (D[6]), .B1 (nx282)) ;
    aoi22 ix212 (.Y (nx211), .A0 (B[6]), .A1 (nx296), .B0 (C[6]), .B1 (nx292)) ;
    nand02 ix127 (.Y (Dout[7]), .A0 (nx215), .A1 (nx217)) ;
    aoi22 ix216 (.Y (nx215), .A0 (A[7]), .A1 (nx278), .B0 (D[7]), .B1 (nx284)) ;
    aoi22 ix218 (.Y (nx217), .A0 (B[7]), .A1 (nx298), .B0 (C[7]), .B1 (nx294)) ;
    nand02 ix141 (.Y (Dout[8]), .A0 (nx221), .A1 (nx223)) ;
    aoi22 ix222 (.Y (nx221), .A0 (A[8]), .A1 (nx278), .B0 (D[8]), .B1 (nx284)) ;
    aoi22 ix224 (.Y (nx223), .A0 (B[8]), .A1 (nx298), .B0 (C[8]), .B1 (nx294)) ;
    nand02 ix155 (.Y (Dout[9]), .A0 (nx227), .A1 (nx229)) ;
    aoi22 ix228 (.Y (nx227), .A0 (A[9]), .A1 (nx278), .B0 (D[9]), .B1 (nx284)) ;
    aoi22 ix230 (.Y (nx229), .A0 (B[9]), .A1 (nx298), .B0 (C[9]), .B1 (nx294)) ;
    nand02 ix169 (.Y (Dout[10]), .A0 (nx233), .A1 (nx235)) ;
    aoi22 ix234 (.Y (nx233), .A0 (A[10]), .A1 (nx278), .B0 (D[10]), .B1 (nx284)
          ) ;
    aoi22 ix236 (.Y (nx235), .A0 (B[10]), .A1 (nx298), .B0 (C[10]), .B1 (nx294)
          ) ;
    nand02 ix183 (.Y (Dout[11]), .A0 (nx239), .A1 (nx241)) ;
    aoi22 ix240 (.Y (nx239), .A0 (A[11]), .A1 (nx278), .B0 (D[11]), .B1 (nx284)
          ) ;
    aoi22 ix242 (.Y (nx241), .A0 (B[11]), .A1 (nx298), .B0 (C[11]), .B1 (nx294)
          ) ;
    nand02 ix197 (.Y (Dout[12]), .A0 (nx244), .A1 (nx246)) ;
    aoi22 ix245 (.Y (nx244), .A0 (A[12]), .A1 (nx278), .B0 (D[12]), .B1 (nx284)
          ) ;
    aoi22 ix247 (.Y (nx246), .A0 (B[12]), .A1 (nx298), .B0 (C[12]), .B1 (nx294)
          ) ;
    nand02 ix211 (.Y (Dout[13]), .A0 (nx249), .A1 (nx251)) ;
    aoi22 ix250 (.Y (nx249), .A0 (A[13]), .A1 (nx278), .B0 (D[13]), .B1 (nx284)
          ) ;
    aoi22 ix252 (.Y (nx251), .A0 (B[13]), .A1 (nx298), .B0 (C[13]), .B1 (nx294)
          ) ;
    nand02 ix225 (.Y (Dout[14]), .A0 (nx254), .A1 (nx256)) ;
    aoi22 ix255 (.Y (nx254), .A0 (A[14]), .A1 (nx18), .B0 (D[14]), .B1 (nx286)
          ) ;
    aoi22 ix257 (.Y (nx256), .A0 (B[14]), .A1 (nx8), .B0 (C[14]), .B1 (nx2)) ;
    nand02 ix239 (.Y (Dout[15]), .A0 (nx259), .A1 (nx261)) ;
    aoi22 ix260 (.Y (nx259), .A0 (A[15]), .A1 (nx18), .B0 (D[15]), .B1 (nx286)
          ) ;
    aoi22 ix262 (.Y (nx261), .A0 (B[15]), .A1 (nx8), .B0 (C[15]), .B1 (nx2)) ;
    nor02_2x ix275 (.Y (nx276), .A0 (S[1]), .A1 (S[0])) ;
    nor02_2x ix277 (.Y (nx278), .A0 (S[1]), .A1 (S[0])) ;
    inv01 ix279 (.Y (nx280), .A (nx22)) ;
    inv02 ix281 (.Y (nx282), .A (nx280)) ;
    inv02 ix283 (.Y (nx284), .A (nx280)) ;
    inv02 ix285 (.Y (nx286), .A (nx280)) ;
    nor02ii ix9 (.Y (nx8), .A0 (S[1]), .A1 (S[0])) ;
    nor02ii ix3 (.Y (nx2), .A0 (S[0]), .A1 (S[1])) ;
    nor02ii ix267 (.Y (nx268), .A0 (S[0]), .A1 (S[1])) ;
    nor02ii ix269 (.Y (nx270), .A0 (S[0]), .A1 (S[1])) ;
    nor02ii ix271 (.Y (nx272), .A0 (S[1]), .A1 (S[0])) ;
    nor02ii ix273 (.Y (nx274), .A0 (S[1]), .A1 (S[0])) ;
    buf02 ix291 (.Y (nx292), .A (nx268)) ;
    buf02 ix293 (.Y (nx294), .A (nx270)) ;
    buf02 ix295 (.Y (nx296), .A (nx272)) ;
    buf02 ix297 (.Y (nx298), .A (nx274)) ;
endmodule

