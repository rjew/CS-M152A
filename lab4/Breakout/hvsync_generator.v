module hvsync_generator(clk, vga_h_sync, vga_v_sync, cnt_x, cnt_y);
input clk;
output vga_h_sync, vga_v_sync;
output [9:0] cnt_x;
output [8:0] cnt_y;

//////////////////////////////////////////////////
reg [9:0] cnt_x; // x position goes from 0 to 766.
reg [8:0] cnt_y; // y position goes from 0 to 511.

// 32.5 kHz signal
wire clk_x = (cnt_x==767);

always @(posedge clk)
if(clk_x)
	cnt_x <= 0;
else
	cnt_x <= cnt_x + 1;

always @(posedge clk)
if(clk_x) cnt_y <= cnt_y + 1;

reg	vga_HS, vga_VS;
always @(posedge clk)
begin
	vga_HS <= (cnt_x[9:4]==47); // change this value to move the display horizontally
	vga_VS <= (cnt_y==500); // change this value to move the display vertically
end
	
assign vga_h_sync = ~vga_HS;
assign vga_v_sync = ~vga_VS;

endmodule
