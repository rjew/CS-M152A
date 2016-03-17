`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:37:30 03/03/2016 
// Design Name: 
// Module Name:    all_bricks 
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
module all_bricks(
  //outputs
  bricks, 
  //inputs
  clk, rst, cnt_x, cnt_y, brk_en
    );
    
  output [7:0][7:0] bricks;
  
  input clk, rst;
  input [9:0] cnt_x;
  input [8:0] cnt_y;
  input [7:0][7:0] brk_en;
  
  wire [7:0][2:0] row_num = {3'b000, 3'b001, 3'b010, 3'b011, 3'b100, 3'b101, 3'b110, 3'b111};
  
  brick_row r[7:0] (.bricks(bricks), .clk(clk), .rst(rst), .cnt_x(cnt_x), .cnt_y(cnt_y), .row_num(row_num), .brk_en(brk_en));


endmodule
