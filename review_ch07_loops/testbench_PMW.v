`timescale 1ns/1ps
module testbench_PMW;
reg clock,pmw;
integer clock_period=10;
integer pmw_period=20;
always #(clock_period/2) clock=~clock;
initial begin
        clock=0;
        pmw=0;
        forever #(pmw_period/2) pmw=~pmw;
end


initial begin
        $display("start pmw");
        #((pmw_period*5) $display("end");
$finish;
end
endmodule
