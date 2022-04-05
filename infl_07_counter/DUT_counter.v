`timescale 1ns/1ps
module DUT_counter(
        input i_clock,
        input i_reset_async_n,
        output [6:0] o_value_lim,
        output [6:0] o_value_inf
);
reg [6:0] r_value_lim;
reg [6:0] r_value_inf;
//async_n-falling && !async_n (reset)
//clock-rising    && async_n  (counting)
//---------------[CASE1] Count 100 Only Once
always@(posedge i_clock or negedge i_reset_async_n )begin
//reset_async_n ON
        if(!i_reset_async_n)begin
                r_value_lim <=0;
        end
//count : 1x[1,100]
	else begin
                if(r_value_lim<100)begin
                        r_value_lim <= r_value_lim+1;
	end
        end
end
//---------------[CASE2] Count 100 continuously
always@(posedge i_clock or negedge i_reset_async_n) begin
//reset_async_n ON
        if(!i_reset_async_n)begin
                r_value_inf<=0;
        end
//count : [1.99], [0,99], [0,99],…
        else begin
                if(r_value_inf ==99)begin
                        r_value_inf<=0;
                end else begin
                        r_value_inf<=r_value_inf+1;
                end
        end
end
assign o_value_lim = r_value_lim;
assign o_value_inf = r_value_inf;
endmodule
