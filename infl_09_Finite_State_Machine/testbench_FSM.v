`timescale 1ns/1ps
module testbench_FSM;

reg  i_clock;
reg  i_reset_async_n;
reg  i_isRun;
wire o_done;

always
        #5 i_clock=~i_clock;

initial begin
        $display($time, "START initializing.");
        i_clock=0;
        i_reset_async_n=1;
        i_isRun=0;


#100
        $display($time,"Reset ON");
        i_reset_async_n=0;
#10
        $display($time,"Reset OFF");
        i_reset_async_n=1;
#10

@(posedge i_clock);
        $display($time,"Start the Machine!");
        $display($time,"\t is_run=1");
        i_isRun = 1;
@(posedge i_clock);
        $display($time,"\tis_run=0");
        i_isRun = 0;

#100
        $display($time,"Finish!");
        $finish;
end



DUT_FSM DUT(
        .i_clock (i_clock),
        .i_reset_async_n (i_reset_async_n),
        .i_isRun (i_isRun),
        .o_done (o_done)
);
endmodule
~
~
~
~
~
~
~
