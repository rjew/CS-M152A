`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:55:31 01/26/2016 
// Design Name: 
// Module Name:    priority_encoder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module priority_encoder(
    POS,
    EXP
    );

input [10:0] POS;
output [3:0] EXP;

integer i;
integer a;

initial
begin
  for (i = 0; i <= 10 ; i = i + 1)
    begin
      if (POS[i] == 1)
        begin
          a = i;
        end
     end
end     

assign EXP = a[3:0];


endmodule
