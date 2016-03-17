`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:11:19 02/16/2016 
// Design Name: 
// Module Name:    debouncer 
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
module debouncer(
    // outputs
    rst, pause, adj, sel, 
    // inputs
    btnR, btnS, sw, clk
    );
    
   output rst;
   output pause;
   output adj;
   output sel;
   
   input btnR;
   input btnS;
   input [1:0] sw;
   input clk;
   
   reg rst;
   reg pause;
   reg adj;
   reg sel;
    
   reg [3:0] rst_butt;
   reg [3:0] pause_butt;
   reg [3:0] adj_slide;
   reg [3:0] sel_slide;
   
   initial
   begin
    rst_butt = {btnR, 3'b000};
    pause_butt = {btnS, 3'b000};
    adj_slide = {sw[0], 3'b000};
    sel_slide = {sw[1], 3'b000};
    
    adj = 0;
    sel = 0;
    pause = 0;
   end
   

   always @ (posedge clk)
   begin
    rst_butt[3:0] <= {btnR, rst_butt[3:1]};
    rst = ~rst_butt[0] & rst_butt[1] & rst_butt[2] & rst_butt[3];
   end

   always @ (posedge clk)
	 begin
      pause_butt[3:0] <= {btnS, pause_butt[3:1]};
      pause = (~pause_butt[0] & pause_butt[1] & pause_butt[2] & pause_butt[3])?~pause:pause;
	 end
   
   always @ (posedge clk)
   begin
    adj_slide[3:0] <= {sw[0], adj_slide[3:1]};
    if (~adj_slide[0] & adj_slide[1] & adj_slide[2] & adj_slide[3] )
      adj = 1;
    if (adj_slide[0] & ~adj_slide[1] & ~adj_slide[2] & ~adj_slide[3] )
      adj = 0;
   end
   
   always @ (posedge clk)
   begin
    sel_slide[3:0] <= {sw[1], sel_slide[3:1]};
    if (~sel_slide[0] & sel_slide[1] & sel_slide[2] & sel_slide[3] )
      sel = 1;
    if (sel_slide[0] & ~sel_slide[1] & ~sel_slide[2] & ~sel_slide[3] )
      sel = 0;
   end

endmodule
