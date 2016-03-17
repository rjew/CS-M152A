`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:04:00 02/25/2016 
// Design Name: 
// Module Name:    clocker 
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
module clocker(
  // outputs
  clk_en, clk1_en, clk2_en, 
  // inputs
  clk
    );
    
  output clk_en, clk1_en, clk2_en;
  input clk;
  
  reg clk_en;
  
  initial
  begin
    clk_dv = 0;
    clk1_dv = 0;
    clk2_dv = 0;
  end
  
  reg [1:0] clk_dv;
  always @ (posedge clk)
  begin
    clk_dv = clk_dv + 1;
    clk_en = (clk_dv == 0);
  end

  integer clk1_dv;
  wire clk1_en = (clk1_dv == 1000000);
  always @ (posedge clk)
  if (clk1_en)
    clk1_dv <= 0;
  else
    clk1_dv <= clk1_dv + 1;
    
  integer clk2_dv;
  wire clk2_en = (clk2_dv == 500000);
  always @ (posedge clk)
  if (clk2_en)
    clk2_dv <= 0;
  else
    clk2_dv <= clk2_dv + 1;


endmodule
