`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:29:55 03/03/2016 
// Design Name: 
// Module Name:    brick_row 
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
module brick_row(
  //output
  bricks,  
  //input
  clk, rst, cnt_x, cnt_y, row_num, brk_en
    );
  output [7:0] bricks;
  input clk, rst;
  input [9:0] cnt_x; 
  input [8:0] cnt_y;
  input [2:0] row_num;
  input [7:0] brk_en;
  
  wire [7:0] bricks;
  wire [7:0] [2:0] brk_num = {3'b000, 3'b001, 3'b010, 3'b011, 3'b100, 3'b101, 3'b110, 3'b111};
  
  bricks b[7:0] (.bricks(bricks), .clk(clk), .reset(rst), .cnt_x(cnt_x), .cnt_y(cnt_y), 
               .brk_num(brk_num), .row_num(row_num), .brk_en(brk_en));


endmodule
