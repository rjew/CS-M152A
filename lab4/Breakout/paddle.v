`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:12:33 02/25/2016 
// Design Name: 
// Module Name:    paddle 
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
module paddle(
  //outputs
  paddle, l_pdl, m_pdl, r_pdl, 
  //inputs
  clk, cnt_x, cnt_y, left, right, pause, gameover, rst
    );
  output paddle, l_pdl, m_pdl, r_pdl;
  
  input clk, left, right, pause, gameover, rst;
  input [9:0] cnt_x;
  input [8:0] cnt_y;

  reg pdl_dir; // 0 is left. 1 is right. 
  reg pdl_stop;
  reg [9:0] pdl_pos;
  
  initial
  begin
    pdl_dir = 1;
    pdl_stop = 0;
    pdl_pos = 425;
  end
  
  always @(posedge clk)
  begin
    if (left)
      pdl_dir <= 0;
    if (right | rst)
      pdl_dir <= 1;
  end
  
  always @(posedge clk)
  begin
    if (pdl_pos >= 630)
    begin
      if (left | ~pdl_dir | rst)
        pdl_stop <= 0;
      else
        pdl_stop <= 1;
    end
    if (pdl_pos <= 160)
    begin
    if (right | pdl_dir | rst)
        pdl_stop <= 0;
      else
        pdl_stop <= 1;
    end
  end

  always @(posedge clk)
  begin
    if (rst)
    begin
      pdl_pos <= 425;
    end
    else
      pdl_pos <= (pdl_stop | pause | gameover) ? pdl_pos : (pdl_pos + ((pdl_dir)? 1: -1));
  end

  wire paddle = (cnt_x>=pdl_pos) && (cnt_x<=pdl_pos+120) && (cnt_y[8:3]==54);
  wire l_pdl = (cnt_x>=pdl_pos) && (cnt_x<=pdl_pos+40) && (cnt_y[8:3]==54);
  wire m_pdl = (cnt_x>=pdl_pos+41) && (cnt_x<=pdl_pos+80) && (cnt_y[8:3]==54);
  wire r_pdl = (cnt_x>=pdl_pos+81) && (cnt_x<=pdl_pos+120) && (cnt_y[8:3]==54);

endmodule
