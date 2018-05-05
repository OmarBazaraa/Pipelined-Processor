//
// Verilog description for cell register_edge_rising, 
// Sat May  5 04:03:33 2018
//
// LeonardoSpectrum Level 3, 2017a.2 
//


module register_edge_rising ( CLK, RST, EN, Din, Dout ) ;

    input CLK ;
    input RST ;
    input EN ;
    input [15:0]Din ;
    output [15:0]Dout ;

    wire nx382, nx392, nx402, nx412, nx422, nx432, nx442, nx452, nx462, nx472, 
         nx482, nx492, nx502, nx512, nx522, nx532, nx544, nx546, nx599, nx601, 
         nx603, nx605;
    wire [15:0] \$dummy ;




    dff reg_Dout_0 (.Q (Dout[0]), .QB (\$dummy [0]), .D (nx382), .CLK (CLK)) ;
    ao32 ix383 (.Y (nx382), .A0 (Din[0]), .A1 (nx599), .A2 (EN), .B0 (Dout[0]), 
         .B1 (nx603)) ;
    inv01 ix545 (.Y (nx544), .A (RST)) ;
    nor02_2x ix547 (.Y (nx546), .A0 (RST), .A1 (EN)) ;
    dff reg_Dout_1 (.Q (Dout[1]), .QB (\$dummy [1]), .D (nx392), .CLK (CLK)) ;
    ao32 ix393 (.Y (nx392), .A0 (Din[1]), .A1 (nx599), .A2 (EN), .B0 (Dout[1]), 
         .B1 (nx603)) ;
    dff reg_Dout_2 (.Q (Dout[2]), .QB (\$dummy [2]), .D (nx402), .CLK (CLK)) ;
    ao32 ix403 (.Y (nx402), .A0 (Din[2]), .A1 (nx599), .A2 (EN), .B0 (Dout[2]), 
         .B1 (nx603)) ;
    dff reg_Dout_3 (.Q (Dout[3]), .QB (\$dummy [3]), .D (nx412), .CLK (CLK)) ;
    ao32 ix413 (.Y (nx412), .A0 (Din[3]), .A1 (nx599), .A2 (EN), .B0 (Dout[3]), 
         .B1 (nx603)) ;
    dff reg_Dout_4 (.Q (Dout[4]), .QB (\$dummy [4]), .D (nx422), .CLK (CLK)) ;
    ao32 ix423 (.Y (nx422), .A0 (Din[4]), .A1 (nx599), .A2 (EN), .B0 (Dout[4]), 
         .B1 (nx603)) ;
    dff reg_Dout_5 (.Q (Dout[5]), .QB (\$dummy [5]), .D (nx432), .CLK (CLK)) ;
    ao32 ix433 (.Y (nx432), .A0 (Din[5]), .A1 (nx599), .A2 (EN), .B0 (Dout[5]), 
         .B1 (nx603)) ;
    dff reg_Dout_6 (.Q (Dout[6]), .QB (\$dummy [6]), .D (nx442), .CLK (CLK)) ;
    ao32 ix443 (.Y (nx442), .A0 (Din[6]), .A1 (nx601), .A2 (EN), .B0 (Dout[6]), 
         .B1 (nx603)) ;
    dff reg_Dout_7 (.Q (Dout[7]), .QB (\$dummy [7]), .D (nx452), .CLK (CLK)) ;
    ao32 ix453 (.Y (nx452), .A0 (Din[7]), .A1 (nx601), .A2 (EN), .B0 (Dout[7]), 
         .B1 (nx605)) ;
    dff reg_Dout_8 (.Q (Dout[8]), .QB (\$dummy [8]), .D (nx462), .CLK (CLK)) ;
    ao32 ix463 (.Y (nx462), .A0 (Din[8]), .A1 (nx601), .A2 (EN), .B0 (Dout[8]), 
         .B1 (nx605)) ;
    dff reg_Dout_9 (.Q (Dout[9]), .QB (\$dummy [9]), .D (nx472), .CLK (CLK)) ;
    ao32 ix473 (.Y (nx472), .A0 (Din[9]), .A1 (nx601), .A2 (EN), .B0 (Dout[9]), 
         .B1 (nx605)) ;
    dff reg_Dout_10 (.Q (Dout[10]), .QB (\$dummy [10]), .D (nx482), .CLK (CLK)
        ) ;
    ao32 ix483 (.Y (nx482), .A0 (Din[10]), .A1 (nx601), .A2 (EN), .B0 (Dout[10])
         , .B1 (nx605)) ;
    dff reg_Dout_11 (.Q (Dout[11]), .QB (\$dummy [11]), .D (nx492), .CLK (CLK)
        ) ;
    ao32 ix493 (.Y (nx492), .A0 (Din[11]), .A1 (nx601), .A2 (EN), .B0 (Dout[11])
         , .B1 (nx605)) ;
    dff reg_Dout_12 (.Q (Dout[12]), .QB (\$dummy [12]), .D (nx502), .CLK (CLK)
        ) ;
    ao32 ix503 (.Y (nx502), .A0 (Din[12]), .A1 (nx544), .A2 (EN), .B0 (Dout[12])
         , .B1 (nx605)) ;
    dff reg_Dout_13 (.Q (Dout[13]), .QB (\$dummy [13]), .D (nx512), .CLK (CLK)
        ) ;
    ao32 ix513 (.Y (nx512), .A0 (Din[13]), .A1 (nx544), .A2 (EN), .B0 (Dout[13])
         , .B1 (nx605)) ;
    dff reg_Dout_14 (.Q (Dout[14]), .QB (\$dummy [14]), .D (nx522), .CLK (CLK)
        ) ;
    ao32 ix523 (.Y (nx522), .A0 (Din[14]), .A1 (nx544), .A2 (EN), .B0 (Dout[14])
         , .B1 (nx546)) ;
    dff reg_Dout_15 (.Q (Dout[15]), .QB (\$dummy [15]), .D (nx532), .CLK (CLK)
        ) ;
    ao32 ix533 (.Y (nx532), .A0 (Din[15]), .A1 (nx544), .A2 (EN), .B0 (Dout[15])
         , .B1 (nx546)) ;
    inv01 ix598 (.Y (nx599), .A (RST)) ;
    inv01 ix600 (.Y (nx601), .A (RST)) ;
    nor02_2x ix602 (.Y (nx603), .A0 (RST), .A1 (EN)) ;
    nor02_2x ix604 (.Y (nx605), .A0 (RST), .A1 (EN)) ;
endmodule

