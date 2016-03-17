`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:15:53 02/16/2016 
// Design Name: 
// Module Name:    breakout_tb 
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
module breakout_tb;
    // outputs
    wire [2:0] vgaRed;
    wire [2:0] vgaGreen;
    wire [1:0] vgaBlue;
    wire Hsync;
    wire Vsync;
    // inputs
    reg clk;

    Breakout bo (.vgaRed(vgaRed), .vgaGreen(vgaGreen), .vgaBlue(vgaBlue), .Hsync(Hsync), .Vsync(Vsync), .clk(clk));
    
    initial
    begin
      clk = 0;
    end
    
    always #5 clk = ~clk;
endmodule
