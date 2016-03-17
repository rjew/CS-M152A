`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:25:30 03/01/2016 
// Design Name: 
// Module Name:    brk_disp 
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
module brick_disp( 
  //outputs
  odd_brk, even_brk, all_brk, 
  //inputs
  bricks
    );
    
  output odd_brk, even_brk, all_brk;
  input [7:0] [7:0] bricks;
  
  reg [2:0] i;
  
  wire[7:0] odd_brk_row;
  wire[7:0] even_brk_row;
  wire[7:0] row_parity = 8'b10101010;
  
  brick_disp_row disp_rows[7:0] (.odd_brk_row(odd_brk_row), .even_brk_row(even_brk_row), .bricks(bricks), .row_parity(row_parity));
  assign odd_brk = odd_brk_row[0] | odd_brk_row[1] | odd_brk_row[2] | odd_brk_row[3] | 
                   odd_brk_row[4] | odd_brk_row[5] | odd_brk_row[6] | odd_brk_row[7];
  assign even_brk = even_brk_row[0] | even_brk_row[1] | even_brk_row[2] | even_brk_row[3] | 
                    even_brk_row[4] | even_brk_row[5] | even_brk_row[6] | even_brk_row[7];
  assign all_brk = odd_brk | even_brk;

endmodule
