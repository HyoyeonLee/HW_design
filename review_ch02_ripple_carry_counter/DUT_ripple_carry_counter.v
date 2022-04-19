`timescale 1ns/1ps
module DUT_ripple_carry_counter(
        output [3:0] q,
        input clock_n,
        input reset);
        DUT_T_FF t_ff0(q[0],clock_n,reset);
        DUT_T_FF t_ff1(q[1],   q[0],reset);
        DUT_T_FF t_ff2(q[2],   q[1],reset);
        DUT_T_FF t_ff3(q[3],   q[2],reset);
endmodule
module DUT_T_FF(
        output q,
        input clock_n,
        input reset);
        wire d;
        DUT_D_FF d_ff(q,d,clock_n,reset);
        not n(d,q);
endmodule
module DUT_D_FF(
        output q,
        input d,
        input clock_n,
        input reset);
        reg r_q;
        always @(negedge clock_n or posedge reset)
                if(reset)     r_q <= 1'b0;
                else        r_q <= d;
        assign q=r_q;
endmodule
