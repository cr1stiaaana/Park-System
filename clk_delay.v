`timescale 1ns / 1ps


module clk_delay(
    input clk,
    input rst,
    output clk_delay
    );
    
reg [31:0] counter;
    always@(posedge clk)
    begin
    if(rst==1)
       counter<=0;
    else 
        counter<=counter+1;
    end
    
 assign clk_delay = counter[27];
 
endmodule
