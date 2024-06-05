`timescale 1ns / 1ps

module park_fsm(
    input clk,
    input rst,
    input [3:0] count,
    output reg [1:0] floor,
    output full
    );

localparam FLOOR0 = 2'b00;
localparam FLOOR1 = 2'b01;
localparam FLOOR2 = 2'b10;
localparam FULL = 2'b11;

reg [1:0] state, state_next;

always@(posedge clk) begin
    if(rst==1)
       state<=FLOOR0;
    else 
       state<=state_next;
    end 

always@(*)
begin
state_next=state;
case(state)
FLOOR0:
if(count > 4) state_next = FLOOR1;  

FLOOR1:
if(count > 8) state_next = FLOOR2;
else if(count<=4) state_next = FLOOR0;
    else if (count<=8) state_next= FLOOR1;
    
FLOOR2:
if(count == 12) state_next = FULL;
else if(count<=8) state_next = FLOOR1;
    else if (count< 12) state_next= FLOOR2;
    
FULL:
if(count==12) state_next = FULL;
    else if (count<12) state_next= FLOOR2;

endcase

end

always@(*)
begin
case(state)
FLOOR0:
    floor=0;
FLOOR1:
    floor=1;
FLOOR2:
    floor=2;
FULL:
    floor=2;
endcase

end
assign full= (state == FULL);


endmodule
