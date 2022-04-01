`timescale 1ns/1ps//time unit for numbers / precision
module testbench_clock_generator ; 
reg clk; //data type = register
always //loop
	#5 clk =~clk;// invert every 5ns (T=10ns, f=100MHz)
initial begin
	clk=0; //start @ Low
	$display(“start [%d]”,$time);
#100 // operate for 100ns
	$display(“End [%d]”,$time);
	$finish;
end 
endmodule
