`timescale 1ns/1ps
module testbench_signed;
reg          [0:3] a0;
reg signed   [0:4] a1;
reg signed   [0:3] b;
reg signed   [0:4] r0_noTypeCast;
reg signed   [0:4] r0_typeCast;
reg signed   [0:4] r1_typeMatched;
initial begin
        $display("Start Initializing [%d]",$time);
        a0 =  15;
        a1 =  15;
        b  =  -8;
        r0_noTypeCast = a0+b;
        r0_typeCast = $signed({1'b0,a0})+b;
        r1_typeMatched = a1+b;
        $display("( no typecast) 15 + -8 = %d", r0_noTypeCast);
        $display("(   typecast ) 15 + -8 = %d",r0_typeCast);
        $display("(type matched)15 + -8 = %d",r1_typeMatched);
        $finish;
end
endmodule
