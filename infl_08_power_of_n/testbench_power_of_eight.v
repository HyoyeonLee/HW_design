`timescale 1ns/1ps
module testbench_power_of_eight;
reg             i_clock;
reg             i_reset_async_n;
reg             i_status;
reg[3:0]        i_value;
wire            o_status;
wire[60:0]      o_value;
integer i,f;
always
        #5 i_clock=~i_clock;
initial begin
//------------------------------------------------Initialization
        $display("Start Initializing [%d]",$time);
        i_clock=0;
        i_reset_async_n=1;
        i_value=0;
        i_status=0;
        f = $fopen("HW_power_of_eight_result.txt","w");
//------------------------------------------------Reset
#100
        $display("Reset Everything! [%d]",$time);
        i_reset_async_n=0;
#10
        i_reset_async_n=1;
#10
//------------------------------------------------plug inputs
@(posedge i_clock);
        //f = $fopen("HW_power_of_eight_result.txt","w");
        for(i=0;i<10;i=i+1) begin
                @(negedge i_clock);
                i_status = 1;
                i_value  = i;
                @(posedge i_clock);
        end
        @(negedge i_clock);
        i_status = 0;
        i_value  = 0;
//*****************************************
//NEED SOME TIME TO CLOSE THE FILE????
//WIHTOUT #100 BELOW IT SIMPLY DEOSN'T WORK.
//*****************************************
#100//
        $fclose(f);
        $finish;
end
//------------------------------------------------write outputs
always@(posedge i_clock) begin
        if(o_status) begin
                $fwrite(f,"%d\n",o_value);
        end
end//------------------------------------------------wiring
DUT_power_of_eight DUT(
        .i_clock (i_clock),
        .i_reset_async_n (i_reset_async_n),
        .i_value (i_value),
        .i_status (i_status),
        .o_value (o_value),
        .o_status (o_status)
);
endmodule     
