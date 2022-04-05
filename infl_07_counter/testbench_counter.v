`timescale 1ns/1ps
module testbench_counter;
reg clock;
reg i_reset_async_n;
always
        #5 clock=~clock;
initial begin
        $display("Start Initializing [%d]",$time);
        clock=0;
        i_reset_async_n = 1;
#10
        $display("Reset(async_n) ON  [%d]",$time);
        i_reset_async_n = 0;
#10
        $display("Reset(async_n) OFF [%d]",$time);
        i_reset_async_n = 1;
#10
        $display("Start Counting [%d]",$time);
#1500
$display("FINISH!!! [%d]",$time);
$finish;
end
wire [6:0] r_lim;
wire [6:0] r_inf;
DUT_counter DUT(
        .i_clock (clock),
        .i_reset_async_n (i_reset_async_n),
        .o_value_lim (r_lim),
        .o_value_inf (r_inf)
);
endmodule
