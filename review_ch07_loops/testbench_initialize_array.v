`timescale 1ns/1ps
`define MAX_STATES 32
module testbench_initialize_array;
integer state[0:`MAX_STATES-1];
integer i;
reg [8*`MAX_STATES:1] str;

initial begin
        $display("%s",str);
        for(i=0;i<32;i=i+2)
                state[i]=0;
        for(i=1;i<32;i=i+2)
                state[i]=1;
        for(i=0;i<32;i=i+1)
                str=(state[i]==1)? {str,"1"} : {str,"0"} ;
        $display("array=%s",str);
        $finish;

end
endmodule
