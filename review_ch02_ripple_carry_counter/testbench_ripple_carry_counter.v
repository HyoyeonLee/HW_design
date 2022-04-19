`timescale 1ns/1ps
module testbench_ripple_carry_counter;
reg clock_n, reset;
wire [3:0] q;
DUT_ripple_carry_counter rippleCC(q,clock_n,reset);
initial
        clock_n = 1'b0;
always
        #5 clock_n=~clock_n;
initial begin
        reset = 1'b1;
#15
        reset = 1'b0;
#180
        reset = 1'b1;
#10
        reset = 1'b0;
#20
        $finish;
end
initial
        $monitor($time," Output (Q) = %d",q);
endmodule
