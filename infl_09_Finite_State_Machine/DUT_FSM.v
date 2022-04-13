`timescale 1ns/1ps
module DUT_FSM(
        input i_clock,
        input i_reset_async_n,
        input i_isRun,
        output reg o_done
);

localparam  STATE_IDLE = 2b'00;
localparam  STATE_RUN  = 2b'01;
localparam  STATE_DONE = 2b'10;
reg [1:0] state_cur;
reg [1:0] state_next;

wire isDone = 1'b1;
// reset On     :state_cur=STATE_IDEL
// clock Rising :state_cur=state_next
always @(posedge i_clock or negedge i_reset_async_n) begin
        if(!i_reset_async_n)begin
                state_cur <= STATE_IDLE;
        end else begin
                state_cur <= state_next;
        end
end
// changes in {i_isRun, isDone, state_cur}
always @(*) begin
        state_next = STATE_IDLE;//to prevent latch(???)
        case(state_cur)
                STATE_IDLE:
                        if(i_isRun)
                                state_next = STATE_RUN;
                STATE_RUN:
                        if(isDone)
                                state_next = STATE_DONE;
                STATE_DONE:
                        state_next = STATE_IDLE;
        endcase
end

// change in {state_cur}
always @(*)begin
        o_done=0;//to prevent latch(???)
        case(state_cur)
                STATE_DONE:
                        o_done=0;
        endcase
end
endmodule
