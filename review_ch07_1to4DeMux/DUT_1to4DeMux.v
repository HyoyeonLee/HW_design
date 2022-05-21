timescale 1ns/1ps
module DUT_1to4DeMux(
        input clock,in
        output [3:0] out,
	input [1:0] select);
reg [3:0] Out;
        assign out=Out;
always @(select)  begin
        case(select)
                2'b00: Out<={3'bz,in     };
                2'b01: Out<={2'bz,in,1'bz};
                2'b10: Out<={1'bz,in,2'bz};
                2'b11: Out<={     in,3'bz};
                2'bx0, 2'bx1, 2'bxz, 2'bxx, 2'b0x,2'b1x, 2'bzx : 
		Out<=4'bxxxx;
                2'bz0, 2'bz1, 2'bzz, 2'b0z, 2'b1z: 
		Out<=4'bzzzz;
                default:
                        $display("Unspecified Control Signals");
        endcase
end
endmodule
