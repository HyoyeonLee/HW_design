//WHILE
`timescale 1ns/1ps
`define TRUE 1'b1;
`define FALSE 1'b0;
module testbench_find_a_flag;
reg clock;
always #5 clock=~clock;
reg [15:0] flag;
integer i;
reg isContinue;
initial begin
        flag=16'b0010_0000_0000_0000;
        i=0;
        isContinue =`TRUE;
        while ((i<16) && isContinue)begin
                if(flag[i]) begin
                        $display("Encountered a TRUE bit @%dth",i);
                        isContinue=`FALSE;
                end
                i=i+1;
        end
        $finish;
end
endmodule
