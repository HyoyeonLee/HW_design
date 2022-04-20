`timescale 1ns/1ps
module iterate;
reg clock;
reg [63:0] data;
reg [ 7:0] byte;
integer j;
initial begin
        data = 'h00_aa_11_bb_33_cc_44_dd;
        for (j=0;j<64;j=j+8) begin
                byte = data[j+:8];
                $display("%d %h %h ",j,data[j+:8],byte);
        end

$finish;

end
endmodule
