`timescale 1ns/1ps
module testbench_1to4DeMux;
wire [3:0] out;
reg in=1'b1;
reg [1:0] select;
reg clock;
DUT_1to4DeMux DUT(.clock(clock),.in(in),.select(select),.out(out));
always #5 clock=~clock;
initial begin
        clock=0;
$monitor("%b: %b",select,out);
#50     select <=2'b00;
#50     select <=2'b01;
#50     select <=2'b10;
#50     select <=2'b11;
#50     select <=2'bx0;
#50     select <=2'bx1;
#50     select <=2'b0x;
#50     select <=2'b1x;
#50     select <=2'bxx;
#50     select <=2'bxz;
#50     select <=2'bzx;
#50     select <=2'bz0;
#50     select <=2'bz1;
#50     select <=2'b0z;
#50     select <=2'b1z;
#50     select <=2'bzz;
#50     $finish;
end
endmodule
