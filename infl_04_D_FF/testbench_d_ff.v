`timescale 1ns/1ps
module testbench_d_ff;
reg clock;
reg clock_en;
//wire o_clock;
reg reset_sync;
reg reset_async;
reg reset_async_n;
reg i_value;
wire o_reset_sync;
wire o_reset_async;
wire o_reset_async_n;
wire o_reset_mixed_s_a;
wire o_no_reset;

always
        #5 clock=~clock;
initial begin
        clock=0;
        clock_en=0;
        reset_sync=0;
        reset_async=0;
        reset_async_n=1;
        i_value=1;
        $display("START! no clock, no resets.[%d]",$time);
#50
        reset_sync=1;
        reset_async=1;
        reset_async_n=0;
        $display("\t[Async ON] [%d]",$time);
#10
        reset_sync=0;
        reset_async=0;
        reset_async_n=1;
        $display("\t[Async OFF] [%d]",$time);
#10
        clock_en=1;
        $display("\t[Clock ON] [%d]",$time);
#10
        reset_sync=1;
        $display("\t[Sync ON] [%d]",$time);
#10
        reset_sync=0;
        $display("\t[Sync OFF] [%d]",$time);
#50
        $display("FINISH! [%d]",$time);
        $finish;
end
//o_clock = clock&&clock_en;
wire o_clock = clock&&clock_en;
DUT_d_ff DUT(
        .i_gated_clock (o_clock),
        .i_reset_sync (reset_sync),
        .i_reset_async (reset_async),
        .i_reset_async_n (reset_async_n),
        .i_value (i_value),
        .o_reset_sync (o_reset_sync),
        .o_reset_async (o_reset_async),
        .o_reset_async_n (o_reset_async_n),
        .o_reset_mixed_s_a (o_reset_mixed_s_a),
        .o_no_reset (o_no_reset)
);
endmodule
