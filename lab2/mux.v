`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:01:49 01/28/2016 
// Design Name: 
// Module Name:    mux 
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
module mux(
    POS, EXP, SIG, RND
    );
    
input [10:0] POS;
input [3:0] EXP;
output [3:0] SIG;
output RND; 

wire [4:0] sigrnd;

assign sigrnd = (EXP == 4'b1010) ? POS[10:6] :
                (EXP == 4'b1001) ? POS[9:5] :
                (EXP == 4'b1000) ? POS[8:4] :
                (EXP == 4'b0111) ? POS[7:3] :
                (EXP == 4'b0110) ? POS[6:2] :
                (EXP == 4'b0101) ? POS[5:1] :
                (EXP == 4'b0100) ? POS[4:0] :
                (EXP == 4'b0011) ? POS[3:0] :
                (EXP == 4'b0010) ? POS[2:0] :
                (EXP == 4'b0001) ? POS[1:0] :
                POS[0];
                
assign SIG = sigrnd[4:1];
assign RND = sigrnd[0];

endmodule
