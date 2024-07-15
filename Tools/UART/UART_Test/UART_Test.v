`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/13/2021 05:12:16 PM
// Design Name: 
// Module Name: UART_Test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module UART_Test(input clk, input rx, output [3:0] led);
   
   wire [7:0] rx_data;
   
   assign led = rx_data[3:0];
   
   uart_rx urx0 (.i_Clock(clk), .i_Rx_Serial(rx), .o_Rx_DV(), .o_Rx_Byte(rx_data));

endmodule
