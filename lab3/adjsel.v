`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:58:01 02/16/2016 
// Design Name: 
// Module Name:    adjsel 
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
module adjsel(
    // output
    en_sec, en_min, clk_sec, clk_min,
    // input
    clk, nor_clk, adj_clk, adj, sel, pause, ovf
    );

    output en_sec, en_min, clk_sec, clk_min;
    input clk, nor_clk, adj_clk, adj, sel, pause;
    input [3:0] ovf;
    
    reg en_sec, en_min, clk_sec, clk_min;
    
    initial
    begin
      en_sec = 1;
      en_min = 1;
    end
    
    always @ (posedge clk)
    begin
      if (adj)
      begin
        if (sel) //seconds
        begin
          en_min = 0;
          en_sec = 1;
          clk_sec = adj_clk;
        end else begin
          en_min = 1;
          en_sec = 0;
          clk_min = adj_clk;
        end
      end
      else
      begin
        en_min = ~pause;
        en_sec = ~pause;
        clk_sec = nor_clk;
        clk_min = ovf[1];       
      end
  end

endmodule
