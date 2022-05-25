`timescale 1ns/1ps
module DUT_data_buffer(input  data_start, input [15:0] data, 
		input  clock,    output [16*8-1:0] buffer);
parameter cycles=8;
reg [16*8-1:0] Buffer;
integer i;
assign buffer=Buffer;
always @(posedge clock) begin
        if(data_start==1)begin
	i=0;
                repeat(cycles)begin
                        @(posedge clock) begin
                                Buffer[i+:16]=data;
			i=i+16;
                        end
                end
	end
end
endmodule
