  // Pong VGA game
  // (c) fpga4fun.com

module pong(
  //outputs
  vga_h_sync, vga_v_sync, vgaR, vgaG, vgaB, an, seg, 
  // inputs
  clk, btnL, btnR, btnS, btnD
  );
  input clk;
  input btnL, btnR, btnS, btnD;
  output [3:0] an;
  output [6:0] seg;
  output vga_h_sync, vga_v_sync;
  output [2:0] vgaR;
  output [2:0] vgaG;
  output [1:0] vgaB;

  wire [9:0] cnt_x;
  wire [8:0] cnt_y;
  wire gameover;
    
  /////////////////////////////////////////////////////////////////
  wire vga_clk, pdl_clk, deb_clk;
  clocker(.clk_en(vga_clk), .clk1_en(pdl_clk), .clk2_en(deb_clk), .clk(clk));

  hvsync_generator syncgen(.clk(vga_clk), .vga_h_sync(vga_h_sync), .vga_v_sync(vga_v_sync), 
    .cnt_x(cnt_x), .cnt_y(cnt_y));

  wire left, right, pause, rst;
  debouncer(.left(left), .right(right), .pause(pause), .rst(rst), 
            .btnL (btnL), .btnR(btnR), .btnS(btnS), .btnD(btnD), .clk(deb_clk));

  /////////////////////////////////////////////////////////////////
  wire paddle, l_pdl, m_pdl, r_pdl;
  paddle (.paddle(paddle), .l_pdl(l_pdl), .m_pdl(m_pdl), .r_pdl(r_pdl), .clk(pdl_clk), 
          .cnt_x(cnt_x), .cnt_y(cnt_y), .left(left), .right(right), .pause(pause), 
          .gameover(gameover), .rst(rst));

  wire border = (cnt_x[9:3]== 19) || (cnt_x[9:3]==94) || (cnt_y[8:3]==0) || (cnt_y[8:3]==59);
  wire bounce = paddle | border;

  /////////////////////////////////////////////////////////////////
  wire ball;
  wire [7:0][7:0] bricks;
  wire odd_brk, even_brk, all_brk;
  wire score;

  wire[7:0][7:0] brk_en;

  all_bricks(.bricks(bricks), .clk(vga_clk), .rst(rst), .cnt_x(cnt_x), .cnt_y(cnt_y), .brk_en(brk_en));
  
  brick_disp(.odd_brk(odd_brk), .even_brk(even_brk), .all_brk(all_brk), .bricks(bricks));

  ball (.ball(ball), .gameover(gameover), .brk_en(brk_en), .score(score),  
        .clk(vga_clk), .cnt_x(cnt_x), .cnt_y(cnt_y), .pause(pause), .rst(rst), 
        .paddle(paddle), .l_pdl(l_pdl), .m_pdl(m_pdl), .r_pdl(r_pdl), .border(border), 
        .bricks(bricks), .all_brk(all_brk));

  wire R = ball | bounce | odd_brk;
  wire G = ball | bounce | even_brk;
  wire B = ball | bounce | all_brk;

  reg [2:0] vgaR;
  reg [2:0] vgaG;
  reg [1:0] vgaB;
  always @(posedge vga_clk)
  begin
    vgaR[2:0] <= {R, R, R};
    vgaG[2:0] <= {G, G, G};
    vgaB[1:0] <= {B, B};
  end

  wire [3:0][3:0] disp;
  score(.Q(disp), .score(score), .rst(rst));
  score_disp(.an(an), .seg(seg), .disp(disp), .clk(deb_clk));

endmodule
