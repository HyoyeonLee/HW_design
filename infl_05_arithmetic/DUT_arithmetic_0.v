`timescale 1ns/1ps
module DUT_arithmetic_0(
        input  [7:0] i_value_a,
        input  [7:0] i_value_b,
        output [7:0] o_result_add,
        output [7:0] o_result_sub,
        output [7:0] o_result_mul,
        output [7:0] o_result_div
);

assign o_result_add = i_value_a + i_value_b;
assign o_result_sub = i_value_a - i_value_b;
assign o_result_mul = i_value_a * i_value_b;
assign o_result_div = i_value_a / i_value_b;

endmodule
