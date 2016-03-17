`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:26:26 02/25/2016 
// Design Name: 
// Module Name:    ball 
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
module ball(
  //outputs
  ball, gameover, brk_en, score, 
  //inputs
  clk, cnt_x, cnt_y, pause, rst, paddle, l_pdl, m_pdl, r_pdl, border, bricks, all_brk
    );
    
  output ball, gameover, score;
  output [7:0][7:0] brk_en;
  input clk, paddle, pause, border, rst;
  input [9:0] cnt_x;
  input [8:0] cnt_y;
  input [7:0] [7:0] bricks;
  input l_pdl, m_pdl, r_pdl, all_brk;
  
  wire [1:0] left_bounce;
  wire [1:0] right_bounce;
  wire [1:0] up_bounce;
  wire [1:0] down_bounce;
  
  wire [9:0] ballx;
  wire [8:0] bally;
  
  wire [2:0] pdl_hit;
  
  wire bounce = paddle | border | all_brk;
  wire ball = (cnt_x >= ballx) && (cnt_x <= ballx + 16) && (cnt_y >= bally) && (cnt_y <= bally + 16);
  
  reg rst_col;
  always @(posedge clk) 
    rst_col <= (cnt_y==500) & (cnt_x==0);  // active only once for every video frame

  wire gamelose;
  bounce_detect(.left_bounce(left_bounce), .right_bounce(right_bounce), .up_bounce(up_bounce),
                .down_bounce(down_bounce), .gamelose(gamelose), .pdl_hit(pdl_hit), 
                .clk(clk), .rst(rst), .cnt_x(cnt_x), .cnt_y(cnt_y), .rst_col(rst_col), 
                .ballx(ballx), .bally(bally), .bounce(bounce), .border(border), 
                .paddle(paddle), .l_pdl(l_pdl), .m_pdl(m_pdl), .r_pdl(r_pdl));
  

  /////////////////////////////////////////////////////////////////
  wire update_ball = rst_col;  // update the ball position at the same time that we rst the collision detectors

  ball_control(.ballx(ballx), .bally(bally), 
               .clk(clk), .rst(rst), .update_ball(update_ball), .pause(pause), .gameover(gameover), 
               .pdl_hit(pdl_hit), .left_bounce(left_bounce), .right_bounce(right_bounce), 
               .up_bounce(up_bounce), .down_bounce(down_bounce));

  
  wire collision = (~up_bounce[1] & up_bounce[0]) |
      (~down_bounce[1] & down_bounce[0]) |
      (~left_bounce[1] & left_bounce[0]) |
      (~right_bounce[1] & right_bounce[0]);
      
  wire no_brks;
  
  brk_control(.brk_en(brk_en), .score(score), .no_brks(no_brks), .clk(clk), .rst(rst), .collision(collision), .bricks(bricks));
  assign gameover = gamelose;

endmodule
