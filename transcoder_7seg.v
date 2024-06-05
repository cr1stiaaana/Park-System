`timescale 1ns / 1ps

module transcoder_7seg(
    input [3:0] in,
    output reg [6:0] out
    );
    

always@(in) begin

case(in)
0: out = 7'b011_1111;
1: out = 7'b000_0110;
2: out = 7'b010_0100;
3: out = 7'b011_0000;
4: out = 7'b001_1001;
5: out = 7'b001_0010;
6: out = 7'b000_0010;
7: out = 7'b111_1000;
8: out = 7'b000_0000;
9: out = 7'b001_0000;
10: out = 7'b000_1000;
11: out = 7'b100_0110;
default: out = 7'b111_1111;
endcase
end    



endmodule
