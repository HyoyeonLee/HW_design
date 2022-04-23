/*
1bit-fullAdder

        a-----.---|   |
              |   |XOR|------.---|   |
        b--.--|---|   |      |   |XOR|----------------Sum
           |  |          |---|---|   |
      cin--|--|----------.   |
           |  |          |   |
           |  |          |   .---|   |
           |  |          |       |AND|--------|   |
           |  |          .-------|   |        |OR |---Cout
           |  |                           .---|   |
           |  .------------------|   |    |
           |                     |AND|----.
           .---------------------|   |

*/





`timescale 1ns/1ps
module DUT_full_adder_1bit(
        input clock,
        input a,
        input b,
        input cin,
        output sum,
        output cout
);

wire xorAB, and_xorAB_cin, andAB;
wire Sum,Cout;
        xor     gxor1(xorAB,a,b);
        xor     gxor2(Sum,xorAB,cin);
        and     gand1(and_xorAB_cin,xorAB,cin);
        and     gand2(andAB,a,b);
        or      gor(Cout,and_xorAB_cin,andAB);
assign  sum=Sum;
assign  cout=Cout;
endmodule



