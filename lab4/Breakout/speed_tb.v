`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:25:47 02/23/2016 
// Design Name: 
// Module Name:    tb 
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
module speed_tb;
reg clk;
reg rst;
reg update_ball;
reg pause;
reg gameover;
reg [2:0] pdl_hit;
reg [1:0] left_bounce;
reg [1:0] right_bounce;
reg [1:0] up_bounce;
reg [1:0] down_bounce;

wire [9:0] ballx;
wire [8:0] bally;

initial 
begin
  clk = 0;
  rst = 0;
  update_ball = 1;
  pause = 0;
  gameover = 0;
  up_bounce = 0;
  down_bounce = 0;
  left_bounce = 0;
  right_bounce = 0; 
  
  pdl_hit = 0;
  
  #100
  update_ball = 1;
  down_bounce = 2'b01;
  pdl_hit = 3'b100;
  
  #105
  update_ball = 0;
end

always #5 clk = ~clk;

ball_control b(.ballx(ballx), .bally(bally), 
               .clk(clk), .rst(rst), .update_ball(update_ball), .pause(pause), .gameover(gameover), 
               .pdl_hit(pdl_hit), .left_bounce(left_bounce), .right_bounce(right_bounce), 
               .up_bounce(up_bounce), .down_bounce(down_bounce));

endmodule
