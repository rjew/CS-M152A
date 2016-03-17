module collision_check (
    //outputs
    brk_col, row_collision, brk_num, 
    // inputs
    clk, collision, bricks);
    
    output brk_col;
    output [7:0] row_collision;
    output [7:0][2:0] brk_num;
    
    input clk;
    input collision;
    input [7:0][7:0] bricks;
    
    assign brk_col = row_collision[0] | row_collision[1] | row_collision[2] | row_collision[3] |
                     row_collision[4] | row_collision[5] | row_collision[6] | row_collision[7];
    
    collision_row_check rows[7:0] (.row_collision(row_collision), .brk_num(brk_num), 
                                   .clk(clk), .collision(collision), .bricks(bricks));
                              
endmodule