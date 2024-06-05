`timescale 1ns / 1ps

module park_system(
    input clk,
    input rst,
    input car_out,
    input car_in,
    output [3:0] free_spots,
    output [1:0] current_floor,
    output parking_full
    );
    
    wire count_up;
    wire [3:0] car_count;
    
    
counter car_counter (
    .clk(clk),
    .rst(rst),
    .count_down(car_out),
    .count_up(count_up),
    .count(car_count)
    );
    
    wire sel = ~(car_count<12);

mux2 count_mux(
    .in0(car_in),
    .in1(0),
    .sel(sel),
    .out(count_up)
    );
    
    
park_fsm FSM(
    .clk(clk),
    .rst(rst),
    .count(car_count),
    .floor(current_floor),
    .full(parking_full)
    );
 
 assign free_spots = 12 - car_count;

endmodule
