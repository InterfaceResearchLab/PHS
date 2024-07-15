`timescale 1ns / 1ps

module counter(
    input clk,  // clock
    input rst,  // reset
    input dir,  // count direction
    output reg [3:0] cnt // count
    );
    
    // Counter
    always @ (posedge clk) begin
        if (rst == 1'b1) begin
            // reset state
            cnt <= 0;
        end
        else begin
            if (dir == 1'b0) begin
                // count up
                cnt <= cnt + 1;
            end        
            else begin
                // count down
                cnt <= cnt - 1;
            end
        end
    
    end
    
    
endmodule
