`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:29:55 03/01/2016 
// Design Name: 
// Module Name:    brk_control 
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
module brk_control(
  //outputs
  brk_en, score, no_brks, 
  //inputs
  clk, rst, collision, bricks
    );
    
  output [7:0][7:0] brk_en;
  output score;
  output no_brks;
  
  input clk, rst, collision; 
  input [7:0][7:0] bricks;
  wire [7:0] row_collision;
  wire [7:0][2:0] brk;
  wire [7:0] scores;
  wire [7:0] empty;
  
  assign score = scores[0] | scores[1] | scores[2] | scores[3] | 
                 scores[4] | scores[5] | scores[6] | scores[7]; 
  assign no_brks = empty[0] & empty[1] & empty[2] & empty[3] &
                   empty[4] & empty[5] & empty[6] & empty[7];
  
  collision_row_check rows[7:0] (.row_collision(row_collision), .brk_num(brk), 
                                   .clk(clk), .collision(collision), .bricks(bricks));
  brk_control_row controls[7:0](.brk_en(brk_en), .scores(scores), .empty(empty), .clk(clk), .rst(rst), .no_brks(no_brks), .brk_num(brk), .row(row_collision));


endmodule
