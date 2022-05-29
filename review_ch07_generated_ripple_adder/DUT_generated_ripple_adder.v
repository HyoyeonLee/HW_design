/*

{a,b}-[xor1]-(o_xor1)--{cin,o_xor1}-[xor2]-(sum)
                    |--{cin,o_xor1}-[and2]-(o_and2)

{a,b}-[and1]-(o_and1)
                    |--{o_and1,o_and2}-[xor3]-(cout)

temp:o_xor1, o_and1, o_and2

*/
`timescale 1ns/1ps
module DUT_generated_ripple_adder(a,b,cin,sum,cout);
parameter N=4;
input [N-1:0]   a,b;
input           cin;
output [N-1:0]  sum;
output          cout;
wire [N:0]      cins;

assign cins[0]=cin;

//--------------------a

genvar i;
generate
        for (i=0;i<N;i=i+1) begin: genLoop
                wire oXOR1,oAND1,oAND2;
                xor gxor1(    oXOR1,   a[i],   b[i]);
                and gand1(    oAND1,   a[i],   b[i]);
                xor gxor2(   sum[i],cins[i],  oXOR1);
                and gand2(    oAND2,cins[i],  oXOR1);
                xor gxor3(cins[i+1],  oAND1,  oAND2);
        end
endgenerate
assign cout=cins[N];
endmodule


