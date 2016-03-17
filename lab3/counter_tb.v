`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:34:53 02/04/2016 
// Design Name: 
// Module Name:    counter_tb 
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
module counter_tb;
  reg clk, reset, enable;
  wire [3:0] count;
  wire ovf;
  
  counter5 c5 ( .Q (count), .ovf(ovf), .clk (clk), .rst(reset), .en (enable));
  
  integer i;
  
  initial
  begin
    clk = 0;
    reset = 0;
    enable = 1;
    i = 0;
  end
  
  always @(posedge clk)
  begin
    i = i+1;
    reset = 0;
    if ( i == 1000 )
    begin
      i = 0;
      reset = 1;
    end
  end
  
  always
    #5 clk = !clk;

endmodule
