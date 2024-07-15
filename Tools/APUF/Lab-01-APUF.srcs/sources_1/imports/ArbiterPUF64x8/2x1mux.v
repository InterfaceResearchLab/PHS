`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2017 01:45:55 PM
// Design Name: 
// Module Name: 2x1mux
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

(* DONT_TOUCH = "true" *)
(* KEEP_HIERARCHY = "yes" *)
module mux2x1(
    input A,
    input B,
    input S,
    output D
    );
    
//    wire SN, SA, SB;
    
    (* DONT_TOUCH = "true" *) defparam U0.INIT = 8'hE4;
    (* DONT_TOUCH = "true" *) LUT3 U0 (.I2(A), .I1(B), .I0(S), .O(D));
    
//    not N1(SN, S);
//    and A1(SA, A, S);
//    and A2(SB, B, SN);
//    or  O1(D, SA, SB);
endmodule
