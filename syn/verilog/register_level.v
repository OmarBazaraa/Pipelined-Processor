//
// Verilog description for cell register_level, 
// Sat May  5 04:03:58 2018
//
// LeonardoSpectrum Level 3, 2017a.2 
//


module register_level ( CLK, RST, EN, Din, Dout ) ;

    input CLK ;
    input RST ;
    input EN ;
    input [15:0]Din ;
    output [15:0]Dout ;

    wire nx0, nx5, nx378, nx381, nx384, nx387, nx390, nx393, nx396, nx399, nx402, 
         nx405, nx408, nx411, nx414, nx417, nx420, nx422, nx424, nx426, nx428;



    and02 ix1 (.Y (nx0), .A0 (CLK), .A1 (EN)) ;
    latchr lat_Dout_0__u1 (.QB (nx5), .D (Din[0]), .CLK (nx424), .R (RST)) ;
    inv01 lat_Dout_0__u2 (.Y (Dout[0]), .A (nx5)) ;
    latchr lat_Dout_1__u1 (.QB (nx378), .D (Din[1]), .CLK (nx424), .R (RST)) ;
    inv01 lat_Dout_1__u2 (.Y (Dout[1]), .A (nx378)) ;
    latchr lat_Dout_2__u1 (.QB (nx381), .D (Din[2]), .CLK (nx424), .R (RST)) ;
    inv01 lat_Dout_2__u2 (.Y (Dout[2]), .A (nx381)) ;
    latchr lat_Dout_3__u1 (.QB (nx384), .D (Din[3]), .CLK (nx424), .R (RST)) ;
    inv01 lat_Dout_3__u2 (.Y (Dout[3]), .A (nx384)) ;
    latchr lat_Dout_4__u1 (.QB (nx387), .D (Din[4]), .CLK (nx424), .R (RST)) ;
    inv01 lat_Dout_4__u2 (.Y (Dout[4]), .A (nx387)) ;
    latchr lat_Dout_5__u1 (.QB (nx390), .D (Din[5]), .CLK (nx424), .R (RST)) ;
    inv01 lat_Dout_5__u2 (.Y (Dout[5]), .A (nx390)) ;
    latchr lat_Dout_6__u1 (.QB (nx393), .D (Din[6]), .CLK (nx424), .R (RST)) ;
    inv01 lat_Dout_6__u2 (.Y (Dout[6]), .A (nx393)) ;
    latchr lat_Dout_7__u1 (.QB (nx396), .D (Din[7]), .CLK (nx426), .R (RST)) ;
    inv01 lat_Dout_7__u2 (.Y (Dout[7]), .A (nx396)) ;
    latchr lat_Dout_8__u1 (.QB (nx399), .D (Din[8]), .CLK (nx426), .R (RST)) ;
    inv01 lat_Dout_8__u2 (.Y (Dout[8]), .A (nx399)) ;
    latchr lat_Dout_9__u1 (.QB (nx402), .D (Din[9]), .CLK (nx426), .R (RST)) ;
    inv01 lat_Dout_9__u2 (.Y (Dout[9]), .A (nx402)) ;
    latchr lat_Dout_10__u1 (.QB (nx405), .D (Din[10]), .CLK (nx426), .R (RST)) ;
    inv01 lat_Dout_10__u2 (.Y (Dout[10]), .A (nx405)) ;
    latchr lat_Dout_11__u1 (.QB (nx408), .D (Din[11]), .CLK (nx426), .R (RST)) ;
    inv01 lat_Dout_11__u2 (.Y (Dout[11]), .A (nx408)) ;
    latchr lat_Dout_12__u1 (.QB (nx411), .D (Din[12]), .CLK (nx426), .R (RST)) ;
    inv01 lat_Dout_12__u2 (.Y (Dout[12]), .A (nx411)) ;
    latchr lat_Dout_13__u1 (.QB (nx414), .D (Din[13]), .CLK (nx426), .R (RST)) ;
    inv01 lat_Dout_13__u2 (.Y (Dout[13]), .A (nx414)) ;
    latchr lat_Dout_14__u1 (.QB (nx417), .D (Din[14]), .CLK (nx428), .R (RST)) ;
    inv01 lat_Dout_14__u2 (.Y (Dout[14]), .A (nx417)) ;
    latchr lat_Dout_15__u1 (.QB (nx420), .D (Din[15]), .CLK (nx428), .R (RST)) ;
    inv01 lat_Dout_15__u2 (.Y (Dout[15]), .A (nx420)) ;
    inv01 ix421 (.Y (nx422), .A (nx0)) ;
    inv02 ix423 (.Y (nx424), .A (nx422)) ;
    inv02 ix425 (.Y (nx426), .A (nx422)) ;
    inv02 ix427 (.Y (nx428), .A (nx422)) ;
endmodule

