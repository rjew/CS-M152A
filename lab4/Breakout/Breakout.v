`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:40:23 02/16/2016 
// Design Name: 
// Module Name:    Breakout 
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
module Breakout(
    // outputs
    vgaRed, vgaGreen, vgaBlue, Hsync, Vsync,
    // inputs
    clk
    );

    input clk;
    output [2:0] vgaRed;
    output [2:0] vgaGreen;
    output [1:0] vgaBlue;
    output Hsync;
    output Vsync;
    
    reg [2:0] vgaRed;
    reg [2:0] vgaGreen;
    reg [1:0] vgaBlue;
    
    wire [2:0] R;
    wire [2:0] G;
    wire [1:0] B;

    sync_gen sg(.Hsync (Hsync), .Vsync (Vsync), .clk (clk));
    
    assign R[2:0] = 3'b010;
    assign G[2:0] = 3'b110;
    assign B[1:0] = 2'b10;
    
    always @ (posedge clk)
    begin
      vgaRed = R;
      vgaGreen = G;
      vgaBlue = B;
    end
    
endmodule
