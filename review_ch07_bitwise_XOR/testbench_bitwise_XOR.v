`timescale 1ns/1ps
module testbench_bitwise_XOR;
parameter N=32;
reg [N-1:0] i0,i1;
wire [N-1:0] out;

DUT_bitwise_XOR DUT(.i0(i0),.i1(i1),.out(out));
initial begin
        i0='b0101_1111_0000_1001_1111_0000_1010_0011;
        i1='b1001_0000_0000_1110_1010_0101_1001_0011;
#5      $display("i0=%b",i0);
#5      $display("i1=%b",i1);
#5      $display("out=i0^i1=%b",out);
        $finish;
end
endmodule


~
~
~
