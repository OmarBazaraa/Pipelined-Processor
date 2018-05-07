//
// Verilog description for cell tri_state_buffer, 
// Sat May  5 07:04:27 2018
//
// LeonardoSpectrum Level 3, 2017a.2 
//


module tri_state_buffer ( Din, S, Dout ) ;

    input [15:0]Din ;
    input S ;
    output [15:0]Dout ;

    wire nx227, nx230, nx233, nx236, nx239, nx242, nx245, nx248, nx251, nx254, 
         nx257, nx260, nx263, nx266, nx269, nx272;



    tri01 tri_Dout_0 (.Y (Dout[0]), .A (nx227), .E (S)) ;
    inv01 ix228 (.Y (nx227), .A (Din[0])) ;
    tri01 tri_Dout_1 (.Y (Dout[1]), .A (nx230), .E (S)) ;
    inv01 ix231 (.Y (nx230), .A (Din[1])) ;
    tri01 tri_Dout_2 (.Y (Dout[2]), .A (nx233), .E (S)) ;
    inv01 ix234 (.Y (nx233), .A (Din[2])) ;
    tri01 tri_Dout_3 (.Y (Dout[3]), .A (nx236), .E (S)) ;
    inv01 ix237 (.Y (nx236), .A (Din[3])) ;
    tri01 tri_Dout_4 (.Y (Dout[4]), .A (nx239), .E (S)) ;
    inv01 ix240 (.Y (nx239), .A (Din[4])) ;
    tri01 tri_Dout_5 (.Y (Dout[5]), .A (nx242), .E (S)) ;
    inv01 ix243 (.Y (nx242), .A (Din[5])) ;
    tri01 tri_Dout_6 (.Y (Dout[6]), .A (nx245), .E (S)) ;
    inv01 ix246 (.Y (nx245), .A (Din[6])) ;
    tri01 tri_Dout_7 (.Y (Dout[7]), .A (nx248), .E (S)) ;
    inv01 ix249 (.Y (nx248), .A (Din[7])) ;
    tri01 tri_Dout_8 (.Y (Dout[8]), .A (nx251), .E (S)) ;
    inv01 ix252 (.Y (nx251), .A (Din[8])) ;
    tri01 tri_Dout_9 (.Y (Dout[9]), .A (nx254), .E (S)) ;
    inv01 ix255 (.Y (nx254), .A (Din[9])) ;
    tri01 tri_Dout_10 (.Y (Dout[10]), .A (nx257), .E (S)) ;
    inv01 ix258 (.Y (nx257), .A (Din[10])) ;
    tri01 tri_Dout_11 (.Y (Dout[11]), .A (nx260), .E (S)) ;
    inv01 ix261 (.Y (nx260), .A (Din[11])) ;
    tri01 tri_Dout_12 (.Y (Dout[12]), .A (nx263), .E (S)) ;
    inv01 ix264 (.Y (nx263), .A (Din[12])) ;
    tri01 tri_Dout_13 (.Y (Dout[13]), .A (nx266), .E (S)) ;
    inv01 ix267 (.Y (nx266), .A (Din[13])) ;
    tri01 tri_Dout_14 (.Y (Dout[14]), .A (nx269), .E (S)) ;
    inv01 ix270 (.Y (nx269), .A (Din[14])) ;
    tri01 tri_Dout_15 (.Y (Dout[15]), .A (nx272), .E (S)) ;
    inv01 ix273 (.Y (nx272), .A (Din[15])) ;
endmodule

