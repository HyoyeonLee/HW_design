`timescale 1ns/1ps
module testbench_gate_delay;
reg a,b,c;
wire out;
reg clock;
DUT_gate_delay DUT(.a(a),.b(b),.c(c),.out(out));
initial begin
        a=1'b0;
        b=1'b0;
        c=1'b0;
#10
        a=1'b1;
        b=1'b1;
        c=1'b1;
#10
        a=1'b1;
        b=1'b0;
        c=1'b0;
#20
        $finish;
end
endmodule
