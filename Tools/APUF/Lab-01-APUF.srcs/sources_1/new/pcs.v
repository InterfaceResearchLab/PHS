`timescale 1ns / 1ps
(* keep_hierarchy = "yes" *) 
module pcs(
    a, b, c, d, Z, c1, c2
    );
    
    input wire a, b, c, d, c1, c2;
    output wire Z;
    
    wire abar, bbar, cbar, dbar;
    wire Z0, Z1;
    
  (* DONT_TOUCH = "true" *) (* LOCK_PINS = "I0:A6" *) LUT1 #(.INIT(2'b01)) abar_LUT (.O(abar), .I0(a));
  (* DONT_TOUCH = "true" *) (* LOCK_PINS = "I0:A6" *) LUT1 #(.INIT(2'b01)) bbar_LUT (.O(bbar), .I0(b));
  (* DONT_TOUCH = "true" *) (* LOCK_PINS = "I0:A6" *) LUT1 #(.INIT(2'b01)) cbar_LUT (.O(cbar), .I0(c));
  (* DONT_TOUCH = "true" *) (* LOCK_PINS = "I0:A6" *) LUT1 #(.INIT(2'b01)) dbar_LUT (.O(dbar), .I0(d));

    /*
        a   b   c   Z0
        0   0   0   0
        0   0   1   0
        0   1   0   0
        0   1   1   1
        1   0   0   1
        1   0   1   0  
        1   1   0   1
        1   1   1   1
    */
  (* DONT_TOUCH = "true" *) (* LOCK_PINS = "I0:A4,I1:A5,I2:A6" *) LUT3 #(.INIT(8'hd8)) d6LUT (.O(Z0), .I0(c1), .I1(abar), .I2(bbar));
  (* DONT_TOUCH = "true" *) (* LOCK_PINS = "I0:A4,I1:A5,I2:A6" *) LUT3 #(.INIT(8'hd8)) c6LUT (.O(Z1), .I0(c1), .I1(cbar), .I2(dbar));

   MUXF7 muxOut (
      .O(Z),    // Output of MUX to general routing
      .I0(Z0),  // Input (tie to LUT6 O6 pin)
      .I1(Z1),  // Input (tie to LUT6 O6 pin)
      .S(c2)     // Input select to MUX
   );
       
endmodule
