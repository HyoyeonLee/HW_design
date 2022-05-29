`timescale 1ns/1ps

module DUT_bitwise_XOR(i0,i1,out);
parameter N=32;
input [N-1:0] i0,i1;
output [N-1:0] out;
//----------------------
genvar j;
generate
        for(j=0;j<N;j=j+1) begin : gLOOP_xor
                xor gxor1(out[j],i0[j],i1[j]);
        end
endgenerate
endmodule
