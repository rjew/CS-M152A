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
    left, right, pause, rst,
    // inputs
    btnL, btnR, btnS, btnD, clk
    );
    
   output pause, left, right, rst;
   
   input btnR, btnL, btnS, btnD;
   input clk;
   
   reg pause, left, right, rst;
    
   reg [3:0] pause_butt;
   reg [3:0] left_butt; 
   reg [3:0] right_butt;
   reg [3:0] rst_butt;
   
   initial
   begin
    left_butt = {btnL, 3'b000};
    right_butt = {btnR, 3'b000};
    pause_butt = 4'b0000;
    rst_butt = 4'b0000;
    
    pause = 1;
   end
   

   always @ (posedge clk)
   begin
    left_butt[3:0] <= {btnL, left_butt[3:1]};
    left <= ~left_butt[0] & left_butt[2] & left_butt[3];
   end
   
   always @ (posedge clk)
   begin
    right_butt[3:0] <= {btnR, right_butt[3:1]};
    right <= ~right_butt[0] & right_butt[2] & right_butt[3];
   end

   always @ (posedge clk)
	 begin
      pause_butt[3:0] <= {btnS, pause_butt[3:1]};
      pause <= (~pause_butt[0] & pause_butt[1] & pause_butt[2] & pause_butt[3])?~pause:pause;
      if (rst)
        pause <= 1;
	 end
 
   always @ (posedge clk)
   begin
    rst_butt[3:0] <= {btnD, rst_butt[3:1]};
    rst <= ~rst_butt[0] & rst_butt[2] & rst_butt[3];
   end

endmodule
