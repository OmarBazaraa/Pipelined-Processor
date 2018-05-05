//
// Verilog description for cell full_adder, 
// Sat May  5 03:59:06 2018
//
// LeonardoSpectrum Level 3, 2017a.2 
//


module full_adder ( A, B, Cin, Sum, Cout ) ;

    input A ;
    input B ;
    input Cin ;
    output Sum ;
    output Cout ;

    wire nx111;



    mux21_ni ix9 (.Y (Cout), .A0 (Cin), .A1 (A), .S0 (nx111)) ;
    xnor2 ix112 (.Y (nx111), .A0 (A), .A1 (B)) ;
    xnor2 ix11 (.Y (Sum), .A0 (nx111), .A1 (Cin)) ;
endmodule

