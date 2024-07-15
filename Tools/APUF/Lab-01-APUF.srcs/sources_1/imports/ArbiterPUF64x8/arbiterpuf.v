`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2017 02:17:51 PM
// Design Name: 
// Module Name: arbiterpuf
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
module arbiterpuf(
    input clk,
    input s,
    input [15:0] C,
    output Q
    );
    
    (* DONT_TOUCH = "true" *) wire enableTopLUTOut, enableBotLUTOut,enablePrimaryLUTOut;
    (* DONT_TOUCH = "true" *) wire enableTop, enableBot, enablePrimary;


    (* DONT_TOUCH = "true" *) wire s0, s1;
//    (* DONT_TOUCH = "true" *) arbiter A0(s1, s1, C, Q);
    (* DONT_TOUCH = "true" *) pcs_arbiter PCSPUF(enableTop, enableBot, C, Q);
    assign s0 = s;
    assign s1 = s;
    
    
    (* DONT_TOUCH = "true" *) (* LOCK_PINS = "I0:A6" *) LUT1 #(.INIT(2'b10)) primaryEnableLUT (.O(enablePrimaryLUTOut), .I0(s));

    
    (* DONT_TOUCH = "true" *) (* LOCK_PINS = "I0:A6" *) LUT1 #(.INIT(2'b10)) topEnableLUT (.O(enableTopLUTOut), .I0(enablePrimary));
        (* DONT_TOUCH = "true" *) (* LOCK_PINS = "I0:A6" *) LUT1 #(.INIT(2'b10)) botEnableLUT (.O(enableBotLUTOut), .I0(enablePrimary));


    (* DONT_TOUCH = "true" *) MUXF7 primaryEnableMUX (
      .O(enablePrimary),    // Output of MUX to general routing
      .I0(1'b0),  // Input (tie to LUT6 O6 pin)
      .I1(enablePrimaryLUTOut),  // Input (tie to LUT6 O6 pin)
      .S(enablePrimaryLUTOut)     // Input select to MUX
   );

    (* DONT_TOUCH = "true" *) MUXF7 topEnableMUX (
      .O(enableTop),    // Output of MUX to general routing
      .I0(1'b0),  // Input (tie to LUT6 O6 pin)
      .I1(enableTopLUTOut),  // Input (tie to LUT6 O6 pin)
      .S(enableTopLUTOut)     // Input select to MUX
   );
   
   (* DONT_TOUCH = "true" *) MUXF7 botEnableMUX (
      .O(enableBot),    // Output of MUX to general routing
      .I0(1'b0),  // Input (tie to LUT6 O6 pin)
      .I1(enableBotLUTOut),  // Input (tie to LUT6 O6 pin)
      .S(enableBotLUTOut)     // Input select to MUX
   );
   
   
//    always @(posedge clk) begin
//        s0 <= s;
//        s1 <= s;
//    end
    
//    (* DONT_TOUCH = "true" *) arbiter A1(s, s, C, Q[1]);
//	(* DONT_TOUCH = "true" *) arbiter A2(s, s, C, Q[2]);
//    (* DONT_TOUCH = "true" *) arbiter A3(s, s, C, Q[3]);
    
//	(* DONT_TOUCH = "true" *) arbiter A4(s, s, C, Q[4]);
//    (* DONT_TOUCH = "true" *) arbiter A5(s, s, C, Q[5]);
//    (* DONT_TOUCH = "true" *) arbiter A6(s, s, C, Q[6]);
//    (* DONT_TOUCH = "true" *) arbiter A7(s, s, C, Q[7]);
     
//	(* DONT_TOUCH = "true" *) arbiter A8(s, s, C, Q[8]);
//    (* DONT_TOUCH = "true" *) arbiter A9(s, s, C, Q[9]);
//    (* DONT_TOUCH = "true" *) arbiter A10(s, s, C, Q[10]);
//    (* DONT_TOUCH = "true" *) arbiter A11(s, s, C, Q[11]);
    
//	(* DONT_TOUCH = "true" *) arbiter A12(s, s, C, Q[12]);
//    (* DONT_TOUCH = "true" *) arbiter A13(s, s, C, Q[13]);
//    (* DONT_TOUCH = "true" *) arbiter A14(s, s, C, Q[14]);
//    (* DONT_TOUCH = "true" *) arbiter A15(s, s, C, Q[15]);
    /*
	(* DONT_TOUCH = "true" *) arbiter A16(s, s, C, Q[16]);
    (* DONT_TOUCH = "true" *) arbiter A17(s, s, C, Q[17]);
    (* DONT_TOUCH = "true" *) arbiter A18(s, s, C, Q[18]);
    (* DONT_TOUCH = "true" *) arbiter A19(s, s, C, Q[19]);
    
    (* DONT_TOUCH = "true" *) arbiter A20(s, s, C, Q[20]);
    (* DONT_TOUCH = "true" *) arbiter A21(s, s, C, Q[21]);
    (* DONT_TOUCH = "true" *) arbiter A22(s, s, C, Q[22]);
    (* DONT_TOUCH = "true" *) arbiter A23(s, s, C, Q[23]);
    
	(* DONT_TOUCH = "true" *) arbiter A24(s, s, C, Q[24]);
    (* DONT_TOUCH = "true" *) arbiter A25(s, s, C, Q[25]);
    (* DONT_TOUCH = "true" *) arbiter A26(s, s, C, Q[26]);
    (* DONT_TOUCH = "true" *) arbiter A27(s, s, C, Q[27]);
    
	(* DONT_TOUCH = "true" *) arbiter A28(s, s, C, Q[28]);
    (* DONT_TOUCH = "true" *) arbiter A29(s, s, C, Q[29]);
    (* DONT_TOUCH = "true" *) arbiter A30(s, s, C, Q[30]);
    (* DONT_TOUCH = "true" *) arbiter A31(s, s, C, Q[31]);
    
	 
	(* DONT_TOUCH = "true" *) arbiter A32(s, s, C, Q[32]);
    (* DONT_TOUCH = "true" *) arbiter A33(s, s, C, Q[33]);
    (* DONT_TOUCH = "true" *) arbiter A34(s, s, C, Q[34]);
    (* DONT_TOUCH = "true" *) arbiter A35(s, s, C, Q[35]);
    
    (* DONT_TOUCH = "true" *) arbiter A36(s, s, C, Q[36]);
    (* DONT_TOUCH = "true" *) arbiter A37(s, s, C, Q[37]);
    (* DONT_TOUCH = "true" *) arbiter A38(s, s, C, Q[38]);
    (* DONT_TOUCH = "true" *) arbiter A39(s, s, C, Q[39]);
    
    (* DONT_TOUCH = "true" *) arbiter A40(s, s, C, Q[40]);
    (* DONT_TOUCH = "true" *) arbiter A41(s, s, C, Q[41]);
    (* DONT_TOUCH = "true" *) arbiter A42(s, s, C, Q[42]);
    (* DONT_TOUCH = "true" *) arbiter A43(s, s, C, Q[43]);
    
    (* DONT_TOUCH = "true" *) arbiter A44(s, s, C, Q[44]);
    (* DONT_TOUCH = "true" *) arbiter A45(s, s, C, Q[45]);
    (* DONT_TOUCH = "true" *) arbiter A46(s, s, C, Q[46]);
    (* DONT_TOUCH = "true" *) arbiter A47(s, s, C, Q[47]);
    
    (* DONT_TOUCH = "true" *) arbiter A48(s, s, C, Q[48]);
    (* DONT_TOUCH = "true" *) arbiter A49(s, s, C, Q[49]);
    (* DONT_TOUCH = "true" *) arbiter A50(s, s, C, Q[50]);
    (* DONT_TOUCH = "true" *) arbiter A51(s, s, C, Q[51]);
    
    (* DONT_TOUCH = "true" *) arbiter A52(s, s, C, Q[52]);
    (* DONT_TOUCH = "true" *) arbiter A53(s, s, C, Q[53]);
    (* DONT_TOUCH = "true" *) arbiter A54(s, s, C, Q[54]);
    (* DONT_TOUCH = "true" *) arbiter A55(s, s, C, Q[55]);
    
    (* DONT_TOUCH = "true" *) arbiter A56(s, s, C, Q[56]);
    (* DONT_TOUCH = "true" *) arbiter A57(s, s, C, Q[57]);
    (* DONT_TOUCH = "true" *) arbiter A58(s, s, C, Q[58]);
    (* DONT_TOUCH = "true" *) arbiter A59(s, s, C, Q[59]);
    
    (* DONT_TOUCH = "true" *) arbiter A60(s, s, C, Q[60]);
    (* DONT_TOUCH = "true" *) arbiter A61(s, s, C, Q[61]);
    (* DONT_TOUCH = "true" *) arbiter A62(s, s, C, Q[62]);
    (* DONT_TOUCH = "true" *) arbiter A63(s, s, C, Q[63]);
    */
    
    
endmodule
