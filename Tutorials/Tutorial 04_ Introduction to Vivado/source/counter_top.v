`timescale 1ns / 1ps

module counter_top(
    input  clk,
    input  [1:0] btn,
    output [3:0] led
    );
    
    // Generate slower clock from 'clk' using a clock divider
    // 'clk' is 12MHz, too fast for our human eyes
    wire slow_clk;
    reg [22:0] clk_div = 0;
    
    always @ (posedge clk) begin
        clk_div <= clk_div + 1;
    end
    
    assign slow_clk = clk_div[22]; 
    
    
    // Counter: connect to 'slow_clk', buttons, and LEDs
    counter ctr0 (.clk(slow_clk), .rst(btn[0]), .dir(btn[1]), .cnt(led));
    
endmodule
