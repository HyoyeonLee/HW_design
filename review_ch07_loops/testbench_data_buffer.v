`timescale 1ns/1ps
module testbench_data_buffer;
reg clock,data_start;
reg [15:0] data;
wire flag;
wire [16*8-1:0] buffer;
DUT_data_buffer DUT( .clock(clock),        .data_start(data_start),        
		.data(data),         .buffer(buffer));
always #5 clock=~clock;
integer i, count;
initial begin
        count=0;
        clock=0;
#5      data_start=1;
        repeat(8) begin
                @(negedge clock)data<=count;
                count<=count+1;
        end
        data_start=0;
#10     count=0;
        i=0;
#10     repeat(8) begin
                $display("buffer[%d]=%b",i,buffer[count+:16]);
                count=count+16;
                i=i+1;
        end
#10     $finish;
end
endmodule
