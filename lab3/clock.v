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
module clocks( 
    // outputs
    clk1_en, clk2_en, clk3_en, clk4_en, 
    // inputs 
    clk
    );
   
   // Logic
   input        clk;                  // 100MHz
   output clk1_en;
   output clk2_en;
   output clk3_en;
   output clk4_en;
   
   reg clk1_en;
   integer clk1_dv;
   reg clk2_en;
   integer clk2_dv;
   reg clk3_en;
   integer clk3_dv;
   reg clk4_en;
   integer clk4_dv;
   
   initial 
   begin
     clk1_dv = 0;
     clk1_en = 0;
     clk2_dv = 0;
     clk2_en = 0;
     clk3_dv = 0;
     clk3_en = 0;
     clk4_dv = 0;
     clk4_en = 0;
   end

   // ===========================================================================
   // 1Hz timing signal for clock enable
   // ===========================================================================
   
   always @ (posedge clk)
     begin
        clk1_dv   = clk1_dv + 1;
        if (clk1_dv == 100000000) begin 
          clk1_en = 1;
          clk1_dv = 0;
        end else begin
          clk1_en = 0;
        end
     end
     
   always @ (posedge clk)
     begin
        clk2_dv   = clk2_dv + 1;
        if (clk2_dv == 50000000) begin 
          clk2_en = 1;
          clk2_dv = 0;
        end else begin
          clk2_en = 0;
        end
     end
       
   always @ (posedge clk)
     begin
        clk3_dv   = clk3_dv + 1;
        if (clk3_dv == 500000) begin 
          clk3_en = 1;
          clk3_dv = 0;
        end else begin
          clk3_en = 0;
        end
     end
	   
   always @ (posedge clk)
     begin
        clk4_dv   = clk4_dv + 1;
        if (clk4_dv == 20000000) begin 
          clk4_en = 1;
          clk4_dv = 0;
        end else begin
          clk4_en = 0;
        end
     end

endmodule
