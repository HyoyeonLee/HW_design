`timescale 1ns/1ps
module system_tasks;
reg clock;
reg [4:0] port_id='b10101;
reg [8*30:1] str;
time t;
initial
        str = "I am 100%% human.";
always
        #5 clock=~clock;

initial begin
        $display("Hello Verilog World.");
        $display("%s",str);
        $display("Time Stamp 1 : %d",$time);
#10     $display("port ID = %b",port_id);
        $display("This is Displayed from\n %m level of hierarchy.");
#20     $monitor("time:%t",t);
        for (integer i=0;i<20;i=i+1)begin
                if(i>10&&i<15) begin
                        $monitoroff;
                end else begin
                        $monitoron;
                end
#10             t=$time;
        end
#100    $finish;
end
endmodule
