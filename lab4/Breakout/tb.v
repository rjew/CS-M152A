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
module tb;
reg clk;
reg collision;
reg[7:0] bricks;
reg rst;

wire [2:0] brk;
wire row_collision;

wire [7:0] brk_en;

initial 
begin
  clk = 0;
  collision = 0;
  rst = 0;
  bricks = 8'b00000000;
  
  #500
  collision = 1;
  bricks = 8'b00001000;
  
  #500
  collision = 0;
  bricks = 8'b00000000;
  
  #500
  collision = 1;
  bricks = 8'b00000000;
end

always #5 clk = ~clk;

collision_row_check crc (.row_collision(row_collision), .brk_num(brk), .clk(clk), .collision(collision), .bricks(bricks));
brk_control_row bcr(.brk_en(brk_en), .clk(clk), .rst(rst), .brk_num(brk), .row(row_collision));

endmodule
