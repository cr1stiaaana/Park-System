`timescale 1ns / 1ps


module floor_decoder(
    input [1:0] floor,
    input full,
    output reg [2:0] floor_decoded
    );
    
    
always@(*)
begin
if(full==1) floor_decoded = 3'b000;
else begin
case(floor)
0: floor_decoded = 3'b001;
1: floor_decoded = 3'b010;
2: floor_decoded = 3'b100;
default: floor_decoded = 3'b111; 
endcase

end
end



endmodule
