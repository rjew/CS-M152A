`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:26:34 03/03/2016 
// Design Name: 
// Module Name:    brick_disp_row 
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
module brick_disp_row(
  // outputs
  odd_brk_row, even_brk_row, 
  // inputs
  bricks, row_parity
    );
    
  output odd_brk_row, even_brk_row;
  input [7:0] bricks;
  input row_parity;
  
  assign odd_brk_row = (row_parity) ? bricks[0] | bricks[2] | bricks[4] | bricks[6] : 
                                      bricks[1] | bricks[3] | bricks[5] | bricks[7];
  assign even_brk_row = (row_parity) ? bricks[1] | bricks[3] | bricks[5] | bricks[7] : 
                                       bricks[0] | bricks[2] | bricks[4] | bricks[6];


endmodule
