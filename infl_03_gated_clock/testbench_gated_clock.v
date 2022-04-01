timescale 1ns/1ps
module testbench_gated_clock;
reg clock;
reg clock_en;
wire o_clock;
always 
	$5 clock=~clock;
initial begin
	clock=0;
	clock_en=0;
#100
	$display(“clock ON [%d]”,$time);
	clock_en=1;
#100
	$display(“OFF [%d]”,$time);
	clock_en=0;
#100
	$display(“Finish!”);
$finish;
end
  //connect DUT's i/o ports (DUT : instance of the module "gated_clock"
DUT_gated_clock DUT(
.i_clock (clock),
.i_clock_en (clock_en),
.o_clock (o_clock)
);
endmodule
