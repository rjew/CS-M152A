`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:41:54 02/02/2016 
// Design Name: 
// Module Name:    counter 
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
module counter9(
    //outputs
    Q, ovf,
    // inputs
    clk, en, rst
    );
    
    input clk;
    input en;
    input rst;
    
    output [3:0] Q;
    output ovf;
    
    reg [3:0] Q;
    reg ovf;
    
    initial
    begin
      Q = 4'b0000;
      ovf = 1'b0;
    end
    
    always @ (posedge clk or posedge rst)
      if (rst) begin
        Q = 4'b0000;
        ovf = 1'b0;
      end
      else
      begin
        if (en) begin
          ovf = (Q >= 9) ? 1'b1 : 1'b0;
          Q = (Q >= 9) ? 4'b0000 : Q + 1;
        end
      end
endmodule