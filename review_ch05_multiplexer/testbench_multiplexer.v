`timescale 1ns/1ps
module testbench_multiplexer;
reg [3:0] i=4'b1010;
reg [1:0] s=2'b00;
wire out;
reg clock;
DUT_multiplexer DUT(.i(i),.s(s),.out(out));

always #5 clock=~clock;
initial begin
#10     $display("selection=%b, out=%b",s,out);
        s<=2'b01;
#10     $display("selection=%b, out=%b",s,out);
        s<=2'b10;
#10     $display("selection=%b, out=%b",s,out);
        s<=2'b11;
#10     $display("selection=%b, out=%b",s,out);
        $finish;
end
endmodule
