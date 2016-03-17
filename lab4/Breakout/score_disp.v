`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:13:06 03/03/2016 
// Design Name: 
// Module Name:    score_disp 
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
module score_disp(
  //outputs
  an, seg, 
  //inputs
  disp, clk
    );
    
  output [3:0] an;
  output [6:0] seg;
  
  input [3:0][3:0] disp;
  input clk;
  
  reg [3:0] an;
  reg [6:0] seg;
  reg [1:0] i;

  initial
  begin
    i = 0;
  end

  // 7-segment display setting. 
  always @ (posedge clk)
  begin
    case(i)
    0: an[3:0] = 4'b1110;
    1: an[3:0] = 4'b1101;
    2: an[3:0] = 4'b1011;
    3: an[3:0] = 4'b0111;
    endcase
    case(disp[i])
    0: seg[6:0] = 7'b1000000;
    1: seg[6:0] = 7'b1111001;
    2: seg[6:0] = 7'b0100100;
    3: seg[6:0] = 7'b0110000;
    4: seg[6:0] = 7'b0011001;
    5: seg[6:0] = 7'b0010010;
    6: seg[6:0] = 7'b0000010;
    7: seg[6:0] = 7'b1111000;
    8: seg[6:0] = 7'b0000000;
    9: seg[6:0] = 7'b0010000;
    endcase
    i = i + 1;
  end
endmodule
