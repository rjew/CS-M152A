`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:45:34 02/16/2016 
// Design Name: 
// Module Name:    sync_gen 
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
module sync_gen(
    //outputs
    Hsync, Vsync, 
    //inputs
    clk
    );
    
    input clk;
    output Hsync;
    output Vsync;
    
    reg vga_HS;
    reg vga_VS;
    
    reg [11:0] clk1_dv;
    reg [20:0] clk2_dv;
    
    initial
    begin
      clk1_dv <= 0;
      clk2_dv <= 0;
    end
    
    always @ (posedge clk)
    begin
      clk1_dv <= clk1_dv + 1;
      if ( clk1_dv >= 3200 )
      begin
        clk1_dv <= 0;
      end
      vga_HS = (clk1_dv < 384);
    end
    
    always @ (posedge clk)
    begin
      clk2_dv = clk2_dv + 1;
      if ( clk2_dv >= 1667200 )
      begin
        clk2_dv = 0;
      end
      vga_VS <= (clk2_dv < 6400);
    end
    
    assign Hsync = ~vga_HS;
    assign Vsync = ~vga_VS;
endmodule
