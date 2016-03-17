`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:32:35 03/01/2016 
// Design Name: 
// Module Name:    bricks 
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
module bricks(
  //outputs
  bricks, 
  //inputs
  clk, reset, cnt_x, cnt_y, brk_num, row_num, brk_en
    );

  output bricks;
  input clk, reset, brk_en;
  input [2:0] brk_num;
  input [9:0] cnt_x; 
  input [8:0] cnt_y;
  input [2:0] row_num;
  
  reg bricks;
  
  always @ (posedge clk)
  begin
    if (brk_en)
      bricks <= (cnt_x>=160+74*brk_num) && (cnt_x<=160+74*(brk_num+1)) && (cnt_y[8:3]==(row_num + 1));
    else
      bricks <= 0;
  end

endmodule
