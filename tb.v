`timescale 1ns / 1ps


module tb();

    reg clk;
    reg rst;
    reg car_out;
    reg car_in;
    wire [3:0] free_spots;
    wire [1:0] current_floor;
    wire parking_full;


park_system dut(
    .clk(clk),
    .rst(rst),
    .car_out(car_out),
    .car_in(car_in),
    .free_spots(free_spots),
    .current_floor(current_floor),
    .parking_full (parking_full)
    );
    
 
initial
begin
clk=0;
forever #5 clk=~clk;
end


initial
begin
rst=1;
@(negedge clk) rst = 0;
end

initial
begin
car_in=0;
repeat(13) begin
@(posedge clk) 
@(negedge clk) car_in = 1;
end
#30 car_in = 1;
#10 car_in = 0;
#40 $stop;
end


initial
begin
car_out = 0;
@(negedge car_in) @(negedge clk) car_out=1;
#20 car_out = 0;
end

endmodule
