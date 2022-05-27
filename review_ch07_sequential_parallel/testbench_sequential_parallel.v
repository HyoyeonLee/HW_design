`timescale 1ns/1ps
module testbench_sequential_parallel;
reg clock,a,b;
reg [1:0] x,y;
always #5 clock=~clock;
initial begin
        a=1'b0;
#10     b=1'b1;
#20     x={a,b};
#30     y={b,a};
#40     $finish;
end
/*
initial fork
        a=1'b0;
#10     b=1'b1;
#20     x={a,b};
#30     y={b,a};
#40     $finish;
join
*/
endmodule
