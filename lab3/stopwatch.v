`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:31:44 02/02/2016 
// Design Name: 
// Module Name:    stopwatch 
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
module stopwatch( 
    // outputs
    an, seg, 
    // inputs 
    btnS, btnR, sw, clk
    );

   // Misc.
   input  [1:0] sw;
   output [6:0] seg;
   output [3:0] an;
   //output [6:0] led1;
   //output [6:0] led0;
   input        btnS;                 // single-step instruction
   input        btnR;                 // arst
   
   // Logic
   input        clk;                  // 100MHz
   
   wire rst, pause;
   wire adj, sel; 
   
   reg [6:0] seg;
   reg [3:0] an;
   wire [3:0] disp [3:0];   
   wire [3:0] ovf;
   
   wire clk1_en, clk2_en, clk3_en, clk4_en;
   
   wire en_sec, en_min;
   wire clk_sec, clk_min;
   
   reg blk_on;
    
    initial
    begin
      i = 0;
      blk_on = 1;
    end

   // ===========================================================================
   // Reset and Enable
   // ===========================================================================	
   
   debouncer db ( .rst(rst), .pause(pause), .adj(adj), .sel(sel), .btnR(btnR), .btnS(btnS), .sw(sw), .clk(clk3_en) );


   // ===========================================================================
   // Adjust and Select
   // ===========================================================================	
   
   adjsel as( .en_sec(en_sec), .en_min(en_min), .clk_sec(clk_sec), .clk_min(clk_min), .clk(clk3_en), .nor_clk(clk1_en), .adj_clk(clk2_en), .adj(adj), .sel(sel), .pause(pause), .ovf(ovf));
   
   
   reg[1:0] i;
   
   // ===========================================================================
   // Display Parameters
   // ===========================================================================	

    always @ (posedge clk4_en)
    if ( adj )
    begin
      blk_on = ~blk_on;
    end
    else
    begin
      blk_on = 1;
    end

   // 7-segment display setting. 
   always @ (posedge clk3_en)
   begin
      if ( blk_on )
      begin
        case(i)
        0: an[3:0] = 4'b1110;
        1: an[3:0] = 4'b1101;
        2: an[3:0] = 4'b1011;
        3: an[3:0] = 4'b0111;
        endcase
      end
      else begin
        an[3:0] = 4'b1111;
      end
      case(disp[i])
      0: seg[6:0] = 7'b1000000;
      1: seg[6:0] = 7'b1111001;
      2: seg[6:0] = 7'b0100100;
      3: seg[6:0] = 7'b0110000;
      4: seg[6:0] = 7'b0011001;
      5: seg[6:0] = 7'b0010010;
      6: seg[6:0] = 7'b0000010;
      7: seg[6:0] = 7'b1111000;
      8: seg[6:0] = 7'b0000000;
      9: seg[6:0] = 7'b0010000;
      endcase
      i = i + 1;
    end
	
    clocks clk_maker( .clk1_en (clk1_en), .clk2_en (clk2_en), .clk3_en (clk3_en), .clk4_en (clk4_en), .clk (clk));
    counter9 c0( .Q (disp[0]), .ovf(ovf[0]), .clk (clk_sec), .en (en_sec), .rst (rst) );
    counter5 c1( .Q (disp[1]), .ovf(ovf[1]), .clk (ovf[0]), .en (en_sec), .rst (rst) );
    counter9 c2( .Q (disp[2]), .ovf(ovf[2]), .clk (clk_min), .en (en_min), .rst (rst) );
    counter5 c3( .Q (disp[3]), .ovf(ovf[3]), .clk (ovf[2]), .en (en_min), .rst (rst) );

endmodule
