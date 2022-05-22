`timescale 1ns/1ps
module DUT_finiteStateMachine(
        input [3:0] encoding,
        output [1:0] next_state
);


reg [1:0] nstate;
assign next_state=nstate;
always @(encoding)begin
        casex(encoding)
                4'b1xxx:nstate<=2'b11;
                4'bx1xx:nstate<=2'b10;
                4'bxx1x:nstate<=2'b01;
                4'bxxx1:nstate<=2'b00;
                default:nstate<=2'b00;
        endcase
end
endmodule
