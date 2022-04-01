`timescale 1ns/1ps

module testbench_arithmetic;

reg clock;
reg  [7:0] i_value_a;
reg  [7:0] i_value_b;
wire [7:0] o_result_add_0;
wire [7:0] o_result_sub_0;
wire [7:0] o_result_mul_0;
wire [7:0] o_result_div_0;
wire [7:0] o_result_add_1;
wire [7:0] o_result_sub_1;
wire [7:0] o_result_mul_1;
wire [7:0] o_result_div_1;

//always
//      #5 clock=~clock;


initial begin
#10
        //--------------------[1] Initialize Input numbers
        i_value_a = 8'd20;
        i_value_b = 8'd10;
#50
        $display("Start with a = %d, b = %d [%d]",i_value_a,i_value_b,$time);
#100
        //--------------------[2] Show Results from two DUTs
        $display("[c0] add,sub,mul,div = %d,%d,%d,%d [%d]",
                  o_result_add_0,o_result_sub_0,
                  o_result_mul_0,o_result_div_0,$time);
        $display("[c1] add,sub,mul,div = %d,%d,%d,%d [%d]",
                  o_result_add_1,o_result_sub_1,
                  o_result_mul_1,o_result_div_1,$time);

        //--------------------[3] Check if both are agreable
        if(o_result_add_0!==o_result_add_1) begin
                $display("FAILED ADDITION [%d]",$time);
        end
        if(o_result_sub_0!==o_result_sub_1) begin
                $display("FAILED SUBTRACTION [%d]",$time);
        end
        if(o_result_mul_0!==o_result_mul_1) begin
                $display("FAILED MULTIPLICATION [%d]",$time);
        end
        if(o_result_div_0!==o_result_div_1) begin
                $display("FAILED DIVISION [%d]",$time);
        end
        $display("FINISH! [%d]",$time);
        $finish;
end
DUT_arithmetic_0 DUT_0(
        .i_value_a (i_value_a),
        .i_value_b (i_value_b),
        .o_result_add (o_result_add_0),
        .o_result_sub (o_result_sub_0),
        .o_result_mul (o_result_mul_0),
        .o_result_div (o_result_div_0)
);

DUT_arithmetic_1 DUT_1(
        .i_value_a (i_value_a),
        .i_value_b (i_value_b),
        .o_result_add (o_result_add_1),
        .o_result_sub (o_result_sub_1),
        .o_result_mul (o_result_mul_1),
        .o_result_div (o_result_div_1)
);

endmodule
