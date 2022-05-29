`timescale 1ns/1ps
`define TRUE 1'b1;
`define FALSE 1'b0;
module testbench_find_a_flag_disable;
reg clock;
always #5 clock=~clock;
reg [15:0] flag;
integer i;
reg isContinue;
initial begin
        flag=16'b0010_0000_0000_0000;
        i=0;
        //isContinue =`TRUE;
        begin: BLOCK1
                while (i<16) begin//&& isContinue)begin
                        if(flag[i]) begin
                                $display("Encountered a TRUE bit @%dth",i);
                                //isContinue=`FALSE;
                                disable BLOCK1;
                        end
                i=i+1;
                end
        end
        $finish;
end
endmodule

~
