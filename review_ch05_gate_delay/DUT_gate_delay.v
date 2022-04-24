`timescale 1ns/1ps
module DUT_gate_delay(
        input a,b,c,
        output out);
wire e;
and #(5)gand1(e,a,b);
or #(4) gor1(out,e,c);
endmodule
