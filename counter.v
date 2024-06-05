`timescale 1ns / 1ps

module counter(
    input clk,
    input rst,
    input count_down,
    input count_up,
    output reg [3:0] count
    );
    
    
    
always@(posedge clk)
    begin
    if(rst==1)
       count <= 0;
    else begin
       if(count_down == 1 && count!=0)
            count<= count-1;
       else if (count_up==1)
            count<= count+1;
    end
    end
    
    
    
endmodule
