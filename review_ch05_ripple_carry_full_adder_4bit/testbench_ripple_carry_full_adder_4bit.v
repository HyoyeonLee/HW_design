`timescale 1ns/1ps
module testbench_ripple_carry_full_adder_4bit;
reg [3:0] a = 4'b0001;
reg [3:0] b = 4'b0010;
reg cin=1;
wire cout;
wire [3:0] sum;
reg clock;
DUT_ripple_carry_full_adder_4bit DUT(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
always #5 clock=~clock;
initial begin
#10     $display("a=%b(%d), b=%b(%d), cin=%b(%d)",a,a,b,b,cin,cin);
#10     $display("sum=%b(%d), cout=%b(%d)",sum,sum,cout,cout);
#10     $finish;
end
endmodule
