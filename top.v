`timescale 1ns / 1ps


module top(
    input clk,
    input rst_clk,
    input rst_park,
    input car_out,
    input car_in,
    output clk_delay,
    output [6:0] spots_7seg,
    output [2:0] floor_decoded,
    output full_garage,
    output spots_available
    );


clk_delay clk_delay0(
    .clk(clk),
    .rst(rst),
    .clk_delay (clk_delay)
    );

wire [3:0] free_spots;
wire [1:0] floor;
wire full;

park_system park_system0(
    .clk(clk),
    .rst(rst),
    .car_out(car_out),
    .car_in(car_in),
    .free_spots(free_spots),
    .current_floor(floor),
    .parking_full(full)
    ); 


floor_decoder decoder0(
    .floor(floor),
    .full(full),
    .floor_decoded(floor_decoded)
    );
    
    
    
transcoder_7seg transcodor0(
    .in(free_spots),
    .out(spots_7seg)
    );
    
 assign full_garage = full;
 assign spots_available = ~full;
    
endmodule
