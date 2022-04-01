`timescale 1ns/1ps

module DUT_arithmetic_1(
        input  [7:0] i_value_a,
        input  [7:0] i_value_b,
        output [7:0] o_result_add,
        output [7:0] o_result_sub,
        output [7:0] o_result_mul,
        output [7:0] o_result_div
);
//use reg <-> sequential
reg [7:0] r_result_add;
reg [7:0] r_result_sub;
reg [7:0] r_result_mul;
reg [7:0] r_result_div;
  //whenever (*:all symbol)changes made <->combinational
always @(*) begin
        r_result_add = i_value_a + i_value_b;
        r_result_sub = i_value_a - i_value_b;
        r_result_mul = i_value_a * i_value_b;
        r_result_div = i_value_a / i_value_b;
end

assign o_result_add  = r_result_add;
assign o_result_sub  = r_result_sub;
assign o_result_mul  = r_result_mul;
assign o_result_div  = r_result_div;

endmodule
