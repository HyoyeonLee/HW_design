`timescale 1ns/1ps
module DUT_full_adder_1bit(
        input a,b,cin,
        output sum,cout);
wire oxor1,oand1,oand2;
xor gxor1(oxor1,a,b);
and gand1(oand1,a,b);
xor gxor2(  sum,oxor1,cin);
and gand2(oand2,oxor1,cin);
xor gxor3( cout,oand1,oand2);
endmodule

module DUT_ripple_carry_full_adder_4bit(
        input [3:0] a,
        input [3:0] b,
        input cin,
        output cout,
        output [3:0] sum);
wire [2:0] c;
DUT_full_adder_1bit DUT0(.a(a[0]),.b(b[0]),.cin( cin),.sum(sum[0]),.cout(c[0]));
DUT_full_adder_1bit DUT1(.a(a[1]),.b(b[1]),.cin(c[0]),.sum(sum[1]),.cout(c[1]));
DUT_full_adder_1bit DUT2(.a(a[2]),.b(b[2]),.cin(c[1]),.sum(sum[2]),.cout(c[2]));
DUT_full_adder_1bit DUT3(.a(a[3]),.b(b[3]),.cin(c[2]),.sum(sum[3]),.cout(cout));
endmodule
