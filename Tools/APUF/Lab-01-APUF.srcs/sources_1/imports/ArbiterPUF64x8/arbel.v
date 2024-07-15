`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2017 02:11:57 PM
// Design Name: Arbiter Element
// Module Name: arbel
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


(* keep_hierarchy = "yes" *)
(* DONT_TOUCH = "true" *)  
module arbel(
    input X,
    input Y,
    input C,
    output W,
    output Z
    );
    
    (* DONT_TOUCH = "true" *) wire X2, Y2;
    
    assign X2 = X;
    assign Y2 = Y;
    
    (* DONT_TOUCH = "true" *) wire W1, W2;
    (* DONT_TOUCH = "true" *) wire Z1, Z2;
    
//    (* DONT_TOUCH = "true" *) mux2x1 M1(X, Y, C, W1);
//    (* DONT_TOUCH = "true" *) mux2x1 M2(Y2, X2, C, Z1);
    
    // 0b11100100
//    defparam U0.INIT = 8'hE4;
    (* keep_hierarchy = "yes" *) LUT3 #(.INIT(8'hE4)) U0 (.I2(X), .I1(Y), .I0(C), .O(W1));
    
    
//    defparam U1.INIT = 8'hE4;
    (* keep_hierarchy = "yes" *) LUT3 #(.INIT(8'hE4)) U1 (.I2(Y2), .I1(X2), .I0(C), .O(Z1));
    
//    (* DONT_TOUCH = "true" *) not N1(W2, W1);
//    (* DONT_TOUCH = "true" *) not N2(W, W2);
//    (* DONT_TOUCH = "true" *) not N7(Z2, Z1);
//    (* DONT_TOUCH = "true" *) not N8(Z, Z2);
    
    assign Z = Z1;
    assign W = W1;
    
endmodule
