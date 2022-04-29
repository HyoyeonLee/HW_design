//-----------------------------------Gate-Level Modeling
/*
`timescale 1ns/1ps
module DUT_multiplexer(
        input [3:0] i,
        input [1:0] s,
        output out);

wire [1:0] ns;
wire [3:0] y;

not gnot0(ns[0],s[0]);
not gnot1(ns[1],s[1]);
and gand0(y[0],i[0],ns[1],ns[0]);
and gand1(y[1],i[1],ns[1], s[0]);
and gand2(y[2],i[2], s[1],ns[0]);
and gand3(y[3],i[3], s[1], s[0]);
or   gor1(out,y[0],y[1],y[2],y[3]);
endmodule
*/

//-----------------------------------DataFlow Modeling
`timescale 1ns/1ps
module DUT_multiplexer(
        input [3:0] i,
        input [1:0] s,
        output out);
assign out =    ((s==2'b00) &i[0]) |
                ((s==2'b01) &i[1]) |
                ((s==2'b10) &i[2]) |
                ((s==2'b11) &i[3]) ;
endmodule
~
