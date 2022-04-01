`timescale 1ns/1ps
module DUT_d_ff(
        input i_gated_clock,
        input i_reset_sync,
        input i_reset_async,
        input i_reset_async_n,
        input i_value,//D (data or delay)
        output o_reset_sync,
        output o_reset_async,
        output o_reset_async_n,
        output o_reset_mixed_s_a,
        output o_no_reset
);

reg r_ff_reset_sync;
reg r_ff_reset_async;
reg r_ff_reset_async_n;
reg r_ff_reset_mixed_s_a;
reg r_ff_no_reset;

//---------------[CASE1] SYNC
//clock-rising &&  sync (0)
//clock-rising && !sync (D)
always@(posedge i_gated_clock) begin
        if(i_reset_sync) begin
                r_ff_reset_sync<=1'b0;
        end else begin
                r_ff_reset_sync<=i_value;
        end
end
//---------------[CASE2] ASYNC
//async-rising &&  async (0)
//clock-rising && !async (D)
always@(posedge i_gated_clock or posedge i_reset_async) begin
        if(i_reset_async) begin
                r_ff_reset_async<=1'b0;
        end else begin
                r_ff_reset_async<=i_value;
        end
end
//---------------[CASE3] ASYNC-Negate
//async_n-falling && !async_n (0)
//clock_rising    &&  async_n (D)
always@(posedge i_gated_clock or negedge i_reset_async_n) begin
        if(!i_reset_async_n) begin
                r_ff_reset_async_n<=1'b0;
        end else begin
                r_ff_reset_async_n<=i_value;
        end
end
//---------------[CASE4] MIXED sync+async
//async-rising && async (0)
//clock-rising &&  sync (0)
//clock-rising && !sync (D)
always@(posedge i_gated_clock or posedge i_reset_async) begin
        if(i_reset_async) begin
                r_ff_reset_mixed_s_a<=1'b0;
        end else if(i_reset_sync) begin
                r_ff_reset_mixed_s_a<=1'b0;
        end else begin
                r_ff_reset_mixed_s_a<=i_value;
        end
end
//---------------[CASE5] No Reset
//clock-rising (D)
always@(i_gated_clock)begin
        r_ff_no_reset<=i_value;
end

assign o_reset_sync     =r_ff_reset_sync;
assign o_reset_async    =r_ff_reset_async;
assign o_reset_async_n  =r_ff_reset_async_n;
assign o_reset_mixed_s_a=r_ff_reset_mixed_s_a;
assign o_no_reset       =r_ff_no_reset;

endmodule
