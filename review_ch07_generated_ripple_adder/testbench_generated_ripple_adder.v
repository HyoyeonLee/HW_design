`timescale 1ns/1ps
module testbench_generated_ripple_adder;
parameter N=4;
reg [N-1:0] a,b;
reg cin;
wire [N-1:0] sum;
wire cout;
DUT_generated_ripple_adder DUT(
        .a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
initial begin
        a=4'b1111;
        b=4'b0011;
        cin=1'b1;
#5      $display("%d+%d+%d=%d",a,b,cin,{cout,sum});
#5      $finish;
end
endmodule
~
~
~
~
