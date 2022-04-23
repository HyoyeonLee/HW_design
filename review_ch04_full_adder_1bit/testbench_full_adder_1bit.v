`timescale 1ns/1ps
module testbench_full_adder_1bit;
reg a,b,cin;
wire sum,cout;
reg clock;
DUT_full_adder_1bit d(clock,a,b,cin,sum,cout);
always #5 clock=~clock;



initial begin
        $display(" a,b,cin---sum,cout");
        for (integer i=0;i<2;i=i+1)begin
#10
                for(integer j=0;j<2;j=j+1)begin
#10
                        for (integer k=0;k<2;k=k+1)begin
                                a=i;
                                b=j;
                                cin=k;
#20                             $display("%d,%d,%d---%d,%d",a,b,cin,sum,cout);

                        end
                end
        end
        $finish;
end
endmodule
