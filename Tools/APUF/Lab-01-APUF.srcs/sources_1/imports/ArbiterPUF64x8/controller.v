`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2017 06:38:45 PM
// Design Name: 
// Module Name: controller
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

(* DONT_TOUCH = "true" *) module APUF_CTRL(
    input clk,
    input rx,
    output tx
   );
	
	parameter __OUT_BYTE_COUNT = 1;
	 
    reg rst = 1;
    
    reg [7:0] tx_data;
    wire [7:0] tx_output;
    reg tx_valid = 0;
    wire tx_active;
    reg prev_tx_active = 0;
    wire tx_ready;
    reg [15:0] rx_data;
    wire [7:0] rx_input;
    wire rx_valid;
    reg prev_rx_valid = 0;
    reg rx_ready = 1;
    
    reg [3:0]in_byte_count = 0;
    reg [1:0]out_byte_count = 0;
    
    assign tx_output = tx_data[7:0];
    
	 //assign rx_dv = rx_valid;
	 
    reg 	[15:0]	challenge;
    reg 	[7:0]	rsp_counter;
    reg             preset = 0;
    reg             signal = 0;
    wire        	response;
    wire tx_done;
    
    uart_rx URX(clk, rx, rx_valid, rx_input);
    uart_tx UTX(clk, tx_valid, tx_output, tx_active, tx, tx_done);
    arbiterpuf A(clk, signal, challenge, response);
    
    always @(posedge clk) begin
        if (rst) begin
            rst         <= 0;
            tx_valid    <= 1;
            tx_data     <= 0;
            challenge   <= 0;
        end
        else begin
        
            //Load in a byte from the rx when rx_valid goes high
            if (~prev_rx_valid && rx_valid) begin
                if (in_byte_count < 2) begin
                    challenge       <= 0;
                    rx_data         <= (rx_data << 8) | rx_input;
                    in_byte_count   <= in_byte_count + 1;
                    
                end

            end
            //Run the data through the PUF when 8 bytes have been received
            else if (in_byte_count == 2) begin// (in_byte_count == 7) begin
                challenge      <= rx_data;
                rsp_counter    <= 0;
                preset         <= 1;
                signal         <= 0;
            end
            prev_rx_valid <= rx_valid;
            
            //Waits some cycles for the challenges to set 
            if (preset) begin
                rsp_counter     <= rsp_counter + 1;
                
                if (rsp_counter == 8'hFF) begin //FFFF
                   rsp_counter   <= 0;
                   in_byte_count <= 0;
                   signal        <= 1;
                   preset        <= 0;
                end
            end
            
            //Process while the PUF is working on the response
            if (signal) begin
                rsp_counter     <= rsp_counter + 1;
                
                //After a delay, send the result from the PUF back over the UART
                if (rsp_counter     == 8'hFF) begin
                    tx_data         <= response;
                    signal          <= 0;
                    out_byte_count  <= __OUT_BYTE_COUNT;
                    tx_valid        <= 1;
                end
            end
            
            //Send the next byte over the tx when the tx_active goes low
//            if (prev_tx_active && ~tx_active) begin
            if (tx_done == 1) begin
                tx_data         <= (tx_data >> 8);
                out_byte_count  <= out_byte_count - 1;
                
                //Stop transmitting after sending all data
                if (out_byte_count - 1 == 0) begin
                    tx_valid    <= 0;
                end
            end
            
            prev_tx_active <= tx_active;
        end
    end
endmodule
