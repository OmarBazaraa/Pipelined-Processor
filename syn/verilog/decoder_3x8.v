//
// Verilog description for cell decoder_3x8, 
// Sat May  5 03:59:09 2018
//
// LeonardoSpectrum Level 3, 2017a.2 
//


module decoder_3x8 ( EN, S, Dout ) ;

    input EN ;
    input [2:0]S ;
    output [7:0]Dout ;

    wire nx2, nx179, nx184, nx187, nx192;



    nor03_2x ix11 (.Y (Dout[0]), .A0 (nx179), .A1 (S[1]), .A2 (S[0])) ;
    nor03_2x ix17 (.Y (Dout[1]), .A0 (nx179), .A1 (S[1]), .A2 (nx184)) ;
    inv01 ix185 (.Y (nx184), .A (S[0])) ;
    nor03_2x ix23 (.Y (Dout[2]), .A0 (nx179), .A1 (nx187), .A2 (S[0])) ;
    inv01 ix188 (.Y (nx187), .A (S[1])) ;
    and03 ix27 (.Y (Dout[3]), .A0 (nx2), .A1 (S[1]), .A2 (S[0])) ;
    nor02ii ix3 (.Y (nx2), .A0 (S[2]), .A1 (EN)) ;
    nor03_2x ix37 (.Y (Dout[4]), .A0 (nx192), .A1 (S[1]), .A2 (S[0])) ;
    nand02 ix193 (.Y (nx192), .A0 (S[2]), .A1 (EN)) ;
    nor03_2x ix43 (.Y (Dout[5]), .A0 (nx192), .A1 (S[1]), .A2 (nx184)) ;
    nor03_2x ix49 (.Y (Dout[6]), .A0 (nx192), .A1 (nx187), .A2 (S[0])) ;
    nor03_2x ix53 (.Y (Dout[7]), .A0 (nx192), .A1 (nx187), .A2 (nx184)) ;
    inv01 ix180 (.Y (nx179), .A (nx2)) ;
endmodule

