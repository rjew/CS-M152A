module brk_control_row (
    //outputs
    brk_en, scores, empty, 
    //inputs
    clk, rst, no_brks, brk_num, row );
    
    output [7:0] brk_en;
    output scores;
    output empty;
    
    input clk, rst, no_brks, row;
    input [2:0] brk_num;
    
    reg [7:0] brk_en;
    reg scores;
    
    assign empty = ~brk_en[0] & ~brk_en[1] & ~brk_en[2] & ~brk_en[3] & 
                   ~brk_en[4] & ~brk_en[5] & ~brk_en[6] & ~brk_en[7];
    
    initial
    begin
        brk_en = 8'b11111111;
        scores = 0;
    end
    
    always @ (posedge clk)
    begin
      if (rst | no_brks)
        brk_en <= 8'b11111111;
      if (row & brk_en[brk_num])
      begin
        brk_en[brk_num] <= 0;
        scores <= 1;
      end
      else
        scores <= 0;
    end
endmodule