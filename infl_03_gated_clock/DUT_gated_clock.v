`timescale 1ns/1ps
module DUT_gated_clock(
	input i_clock,
	input i_clock_en,
	output o_clock
);
assign o_clock=i_clock&i_clock_en;
endmodule
