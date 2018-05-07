//
// Verilog description for cell decoder_2x4, 
// Sat May  5 07:04:28 2018
//
// LeonardoSpectrum Level 3, 2017a.2 
//


module decoder_2x4 ( EN, S, Dout ) ;

    input EN ;
    input [1:0]S ;
    output [3:0]Dout ;

    wire nx132, nx138;



    nor03_2x ix7 (.Y (Dout[0]), .A0 (nx132), .A1 (S[1]), .A2 (S[0])) ;
    inv01 ix133 (.Y (nx132), .A (EN)) ;
    nor03_2x ix19 (.Y (Dout[2]), .A0 (nx132), .A1 (nx138), .A2 (S[0])) ;
    inv01 ix139 (.Y (nx138), .A (S[1])) ;
    and03 ix23 (.Y (Dout[3]), .A0 (EN), .A1 (S[1]), .A2 (S[0])) ;
    and03 ix13 (.Y (Dout[1]), .A0 (EN), .A1 (nx138), .A2 (S[0])) ;
endmodule

