`timescale 1ns/1ps
module DUT_power_of_eight(
        input           i_clock,
        input           i_reset_async_n,
        input  [ 3:0]   i_value,
        input           i_status,
        output [60:0]   o_value,
        output          o_status
);
/*  DATA(d)--IN--> [DFF]--OUT--> Q(r)
*<< i_value >>
*   sqared== d2->r2
*                  sqared== d4->r4
*                                 sqared== d8->r8
*                                          << o_value >>
* input Data(wire), Output Qs(reg)
*/
wire [60:0] d2;
wire [60:0] d4;
wire [60:0] d8;
reg [60:0] r2;
reg [60:0] r4;
reg [60:0] r8;
reg [ 2:0] r_status;
always @(posedge i_clock or negedge i_reset_async_n) begin
        if(!i_reset_async_n)begin
                r_status <= 3'd0;
        end else begin
                r_status = {r_status[1:0],i_status};
        end
end
always @(posedge i_clock or negedge i_reset_async_n) begin
        if(!i_reset_async_n)begin
                r2 <= 61'd0;
                r4 <= 61'd0;
                r8 <= 61'd0;
        end else begin
                r2 <= d2;
                r4 <= d4;
                r8 <= d8;
        end
end
assign d2 = i_value * i_value;
assign d4 = r2 * r2;
assign d8 = r4 * r4;
assign o_status = r_status[2];
assign o_value = r8;
endmodule
