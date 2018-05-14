//
// Verilog description for cell flip_flop, 
// Sat May  5 07:41:02 2018
//
// LeonardoSpectrum Level 3, 2017a.2 
//


module flip_flop ( CLK, RST, Din, Dout ) ;

    input CLK ;
    input RST ;
    input Din ;
    output Dout ;

    wire [0:0] \$dummy ;




    dffr reg_Dout (.Q (Dout), .QB (\$dummy [0]), .D (Din), .CLK (CLK), .R (RST)
         ) ;
endmodule

