`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:00:01 03/03/2016 
// Design Name: 
// Module Name:    score 
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
module score(
  //outputs
  Q, 
  //inputs
  score, rst
    );
    
  output [3:0][3:0] Q;
  input score, rst;
  
  wire en = 1;
  wire [3:0] ovf;
  
  counter9 c0( .Q (Q[0]), .ovf(ovf[0]), .clk (score), .en (en), .rst (rst) );
  counter9 c1( .Q (Q[1]), .ovf(ovf[1]), .clk (ovf[0]), .en (en), .rst (rst) );
  counter9 c2( .Q (Q[2]), .ovf(ovf[2]), .clk (ovf[1]), .en (en), .rst (rst) );
  counter9 c3( .Q (Q[3]), .ovf(ovf[3]), .clk (ovf[2]), .en (en), .rst (rst) );


endmodule
