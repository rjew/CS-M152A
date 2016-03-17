module collision_row_check (
    //outputs
    row_collision, brk_num, 
    // inputs
    clk, collision, bricks);
    
    output row_collision;
    output [2:0] brk_num;
    
    input clk, collision;
    input [7:0] bricks;
    
    reg row_collision;
    reg [2:0] brk_num;
    
    initial
    begin
      row_collision = 0;
      brk_num = 3'b000;
    end
    
    reg[3:0] i;
    always @ (posedge clk)
    begin
        if ( collision )
        begin
            row_collision <= 0;
            brk_num <= 0;
            for ( i = 0; i < 8; i = i + 1 )
            begin
                if (bricks[i])
                begin
                    row_collision <= 1;
                    brk_num[2] <= i[2];
                    brk_num[1] <= i[1];
                    brk_num[0] <= i[0];
                end
            end
        end
    end
endmodule
            
            
            