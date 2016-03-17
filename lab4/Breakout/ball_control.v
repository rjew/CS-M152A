`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:54:04 03/08/2016 
// Design Name: 
// Module Name:    ball_control 
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
module ball_control(
  //outputs
  ballx, bally, 
  //inputs
  clk, rst, update_ball, pause, gameover, pdl_hit, 
  left_bounce, right_bounce, up_bounce, down_bounce
    );
    
  output [9:0] ballx;
  output [8:0] bally;
  
  reg [9:0] ballx;
  reg [8:0] bally;
  
  input clk, rst, update_ball, pause, gameover;
  input [2:0] pdl_hit;
  
  input [1:0] left_bounce;
  input [1:0] right_bounce;
  input [1:0] up_bounce;
  input [1:0] down_bounce;
  
  reg bdirx; // 1 means right. 0 means left. 
  reg bdiry; // 1 means down. 0 means up. 
  
  reg [1:0] x_speed;
  reg [1:0] y_speed;
  
  initial
  begin
    bdirx <= 1;
    bdiry <= 1;
    ballx <= 400;
    bally <= 100;
    
    x_speed = 2;
    y_speed = 2;
  end

  always @(posedge clk)
  begin
    if (rst)
    begin
      bdirx <= 1;
      bdiry <= 1;
      ballx <= 400;
      bally <= 100;
      
      x_speed = 2;
      y_speed = 2;
    end
    
    
    if(update_ball)
    begin
      if(~(left_bounce[0] & right_bounce[0]))
      begin
        ballx <= (pause | gameover)? ballx: (ballx + (bdirx ? x_speed : -x_speed));
        if(right_bounce[0]) 
          bdirx <= 0; 
        else if(left_bounce[0]) 
          bdirx <= 1;
      end

      if(~(up_bounce & down_bounce))        // if collision on both up and down, don't move in the Y direction
      begin
        bally <= (pause | gameover)? bally: (bally + (bdiry ? y_speed : -y_speed));
        if(down_bounce)
        begin
          if ((bdirx & pdl_hit[0]) | (~bdirx & pdl_hit[2]))
          begin
            bdirx <= ~bdirx;
            if (x_speed[1])
              x_speed = x_speed - 1;
          end
          else if ((~bdirx & pdl_hit[0]) | (bdirx & pdl_hit[2]))
          begin
            if (~x_speed[1] | ~x_speed[0])
              x_speed = x_speed + 1;
          end
          bdiry <= 0;
        end
        else if(up_bounce)
          bdiry <= 1;
      end
    end
  end

endmodule
