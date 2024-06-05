`timescale 1ns / 1ps


module mux2(
    input in0,
    input in1,
    input sel,
    output reg out
    );
    
    always@(*)
    begin
    case(sel)
        0: out=in0;
        1: out=in1;
    endcase
    end
endmodule
