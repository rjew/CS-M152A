`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:16:12 02/04/2016 
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
   reg       clk;
   reg btnR;
   reg btnS;
   reg [1:0] sw;
   
   wire clk1_en;
   wire clk2_en;
   wire clk3_en;
   wire clk4_en;
   
   wire rst;
   wire adj;
   wire sel;
   wire pause;
   wire [3:0] disp [3:0];   
   wire [3:0] ovf;
   
   wire en_sec, en_min, clk_sec, clk_min;
 
   // End of automatics

   initial
     begin
        clk = 0;
        btnR = 0;
        btnS = 0;
        sw = 2'b01;
     end

   always #5 clk = ~clk; 
   
   debouncer db ( .rst(rst), .pause(pause), .adj(adj), .sel(sel), .btnR(btnR), .btnS(btnS), .sw(sw), .clk(clk3_en) );
   clocks clk_maker( .clk1_en (clk1_en), .clk2_en (clk2_en), .clk3_en (clk3_en), .clk4_en (clk4_en), .clk (clk));
   adjsel as ( .en_sec(en_sec), .en_min(en_min), .clk_sec(clk_sec), .clk_min(clk_min), .clk(clk3_en), .nor_clk(clk1_en), .adj_clk(clk2_en), .adj(adj), .sel(sel), .pause(pause), .ovf(ovf));
   
   counter9 c0( .Q (disp[0]), .ovf(ovf[0]), .clk (clk_sec), .en (en_sec), .rst (rst) );
   counter5 c1( .Q (disp[1]), .ovf(ovf[1]), .clk (ovf[0]), .en (en_sec), .rst (rst) );
   counter9 c2( .Q (disp[2]), .ovf(ovf[2]), .clk (clk_min), .en (en_min), .rst (rst) );
   counter5 c3( .Q (disp[3]), .ovf(ovf[3]), .clk (ovf[2]), .en (en_min), .rst (rst) );
   
endmodule