`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:37:50 01/28/2016 
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
  reg [11:0] D;
  reg        S;
  reg [2:0]  E;
  reg [3:0]  F;
  
  initial
  begin
  assign D = 12'b000101001111;
  end
  
  TOP t(.D (12'b000101001111), .S (S), .E (E), .F (F));
  
  //$display ("S : %01b", S);
  //$display ("E : %03b", E);
  //$display ("F : %04b", F);
endmodule
