`timescale 1ns/1ps
module testbench_finiteStateMachine;
wire [1:0] next_state;
reg [3:0] encoding;
DUT_finiteStateMachine DUT(.encoding(encoding), .next_state(next_state));
reg clock;
always
        #5 clock=~clock;
initial begin

        $monitor("encoding=%b, state=%d",encoding,next_state);
        #50     encoding=4'b10xz;
        #50     encoding=4'b01xz;
        #50     encoding=4'b0010;
        #50     encoding=4'b0001;
        #50     encoding=4'b0000;
        #50 $finish;
end

endmodule
