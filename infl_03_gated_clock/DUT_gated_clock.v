`timescale 1ns/1ps
module clock_gating_model(
	input i_clock,
	input i_clock_en,
	output o_clock
);
assign o_clock=i_clock&i_clock_en;
endmodule
