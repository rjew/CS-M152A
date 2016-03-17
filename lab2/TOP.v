`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:08:16 01/28/2016 
// Design Name: 
// Module Name:    TOP 
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
module TOP( D, S, E, F
    );

input [11:0] D;

output       S;
output [2:0] E;
output [3:0] F;

wire   [10:0] POS;
wire   [3:0]  EXP;
wire   [3:0] CHK_EXP;
wire   [3:0] RND_EXP;

wire [3:0] SIG;
wire RND;

assign S = D[11];

assign POS = S ? ~D[10:0] + 1 : D[10:0];

priority_encoder p_enc(.POS (POS), .EXP (EXP));

mux m(.POS (POS), .EXP (EXP), .SIG (SIG), .RND (RND));

assign CHK_EXP = EXP - 3; // IDK IF THIS WORKS LMAO.
assign RND_EXP = RND ? CHK_EXP + 1 : CHK_EXP;
assign E = (RND_EXP[3]) ? 0 : RND_EXP[2:0];

assign F = (RND) ? SIG + 1 : SIG;

endmodule
