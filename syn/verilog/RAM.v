//
// Verilog description for cell RAM, 
// Sat May  5 04:00:24 2018
//
// LeonardoSpectrum Level 3, 2017a.2 
//


module RAM ( CLK, WR, Address, Din, Dout ) ;

    input CLK ;
    input WR ;
    input [9:0]Address ;
    input [15:0]Din ;
    output [15:0]Dout ;

    wire [3:0] \$dummy ;




    ram_dq_inclock_inclock2_16_10_1024 modgen_ram_ix42 (.data ({Din[15],Din[14],
                                       Din[13],Din[12],Din[11],Din[10],Din[9],
                                       Din[8],Din[7],Din[6],Din[5],Din[4],Din[3]
                                       ,Din[2],Din[1],Din[0]}), .address ({
                                       Address[9],Address[8],Address[7],
                                       Address[6],Address[5],Address[4],
                                       Address[3],Address[2],Address[1],
                                       Address[0]}), .we (WR), .inclock (CLK), .inclock2 (
                                       CLK), .outclock (\$dummy [0]), .outclock2 (
                                       \$dummy [1]), .outenable (\$dummy [2]), .outreset (
                                       \$dummy [3]), .q ({Dout[15],Dout[14],
                                       Dout[13],Dout[12],Dout[11],Dout[10],
                                       Dout[9],Dout[8],Dout[7],Dout[6],Dout[5],
                                       Dout[4],Dout[3],Dout[2],Dout[1],Dout[0]})
                                       ) ;
endmodule


module ram_dq_inclock_inclock2_16_10_1024 ( data, address, we, inclock, inclock2, 
                                            outclock, outclock2, outenable, 
                                            outreset, q ) ;

    input [15:0]data ;
    input [9:0]address ;
    input we ;
    input inclock ;
    input inclock2 ;
    input outclock ;
    input outclock2 ;
    input outenable ;
    input outreset ;
    output [15:0]q ;




endmodule

