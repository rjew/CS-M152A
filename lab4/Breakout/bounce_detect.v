`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:35:27 03/08/2016 
// Design Name: 
// Module Name:    bounce_detect 
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
module bounce_detect(
  //outputs
  left_bounce, right_bounce, up_bounce, down_bounce, gamelose, pdl_hit, 
  //inputs
  clk, rst, cnt_x, cnt_y, rst_col, ballx, bally, bounce, border, paddle, l_pdl, m_pdl, r_pdl
  
    );
  output gamelose;
  output [1:0] left_bounce;
  output [1:0] right_bounce;
  output [1:0] up_bounce;
  output [1:0] down_bounce;
  output [2:0] pdl_hit;
  
  input [9:0] ballx;
  input [8:0] bally;
  input [9:0] cnt_x;
  input [9:0] cnt_y;
  input clk, rst, rst_col, bounce, border, paddle, l_pdl, m_pdl, r_pdl;

  reg [1:0] left_bounce;
  reg [1:0] right_bounce;
  reg [1:0] up_bounce;
  reg [1:0] down_bounce;
  
  reg [2:0] pdl_hit;
  reg gamelose;
  
  initial
  begin
    gamelose = 0;
    
    up_bounce = 0;
    down_bounce = 0;
    left_bounce = 0;
    right_bounce = 0;
    
    pdl_hit = 0;
  end
  
  always @(posedge clk) 
  if(rst_col | rst) 
    left_bounce<=0; 
  else if (left_bounce[0])
    left_bounce<=2'b11;
  else if(bounce & (cnt_x==ballx   ) & (cnt_y==bally+ 8)) 
    left_bounce<=1;

  always @(posedge clk) 
    if(rst_col | rst) 
      right_bounce<=0; 
    else if (right_bounce[0])
      right_bounce<=2'b11;
    else if(bounce & (cnt_x==ballx+16) & (cnt_y==bally+ 8))
      right_bounce<=1;
      
  always @(posedge clk) 
    if(rst_col | rst) 
      up_bounce<=0; 
    else if (up_bounce[0])
      up_bounce<=2'b11;
    else if(bounce & (cnt_x==ballx+ 8) & (cnt_y==bally   )) 
      up_bounce<=1;
      
  always @(posedge clk)
  begin
    if(rst)
      gamelose <= 0;
    if(rst_col | rst)
    begin
      down_bounce <= 0;
      pdl_hit <= 0;
    end
    else if (down_bounce[0])
      down_bounce<=2'b11;
    else if(bounce & (cnt_x==ballx+ 8) & (cnt_y==bally+16)) 
    begin
      down_bounce<=1;
      if (border)
        gamelose <= 1;
      else if (paddle)
        if (l_pdl)
          pdl_hit[0] <= 1;
        else if (m_pdl)
          pdl_hit[1] <= 1;
        else
          pdl_hit[2] <= 1;
    end
  end

endmodule
