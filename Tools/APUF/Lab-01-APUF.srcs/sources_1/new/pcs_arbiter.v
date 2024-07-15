`timescale 1ns / 1ps

module pcs_arbiter(
    s0,s1, c, r
    );
    
    (* DONT_TOUCH = "true" *) input wire s0,s1;
    input wire [15:0] c;
    output wire r;
    
    (* DONT_TOUCH = "true" *) wire [7:0] topPath;
    (* DONT_TOUCH = "true" *) wire [7:0] botPath;
    
    // top pcs path
    pcs top0 (.a(s0), .b(s0), .c(s0), .d(s0), .c1(c[0]), .c2(c[1]), .Z(topPath[0]));
    pcs top1 (.a(topPath[0]), .b(topPath[0]), .c(topPath[0]), .d(topPath[0]), .c1(c[2]), .c2(c[3]), .Z(topPath[1]) );
    pcs top2 (.a(topPath[1]), .b(topPath[1]), .c(topPath[1]), .d(topPath[1]), .c1(c[4]), .c2(c[5]), .Z(topPath[2]) );
    pcs top3 (.a(topPath[2]), .b(topPath[2]), .c(topPath[2]), .d(topPath[2]), .c1(c[6]), .c2(c[7]), .Z(topPath[3]) );
    pcs top4 (.a(topPath[3]), .b(topPath[3]), .c(topPath[3]), .d(topPath[3]), .c1(c[8]), .c2(c[9]), .Z(topPath[4]) );
    pcs top5 (.a(topPath[4]), .b(topPath[4]), .c(topPath[4]), .d(topPath[4]), .c1(c[10]), .c2(c[11]), .Z(topPath[5]) );
    pcs top6 (.a(topPath[5]), .b(topPath[5]), .c(topPath[5]), .d(topPath[5]), .c1(c[12]), .c2(c[13]), .Z(topPath[6]) );
    pcs top7 (.a(topPath[6]), .b(topPath[6]), .c(topPath[6]), .d(topPath[6]), .c1(c[14]), .c2(c[15]), .Z(topPath[7]) );

    // bottom PCS path    
    pcs bot0 (.a(s1), .b(s1), .c(s1), .d(s1), .c1(c[0]), .c2(c[1]), .Z(botPath[0]));
    pcs bot1 (.a(botPath[0]), .b(botPath[0]), .c(botPath[0]), .d(botPath[0]), .c1(c[2]), .c2(c[3]), .Z(botPath[1]) );
    pcs bot2 (.a(botPath[1]), .b(botPath[1]), .c(botPath[1]), .d(botPath[1]), .c1(c[4]), .c2(c[5]), .Z(botPath[2]) );
    pcs bot3 (.a(botPath[2]), .b(botPath[2]), .c(botPath[2]), .d(botPath[2]), .c1(c[6]), .c2(c[7]), .Z(botPath[3]) );
    pcs bot4 (.a(botPath[3]), .b(botPath[3]), .c(botPath[3]), .d(botPath[3]), .c1(c[8]), .c2(c[9]), .Z(botPath[4]) );
    pcs bot5 (.a(botPath[4]), .b(botPath[4]), .c(botPath[4]), .d(botPath[4]), .c1(c[10]), .c2(c[11]), .Z(botPath[5]) );
    pcs bot6 (.a(botPath[5]), .b(botPath[5]), .c(botPath[5]), .d(botPath[5]), .c1(c[12]), .c2(c[13]), .Z(botPath[6]) );
    pcs bot7 (.a(botPath[6]), .b(botPath[6]), .c(botPath[6]), .d(botPath[6]), .c1(c[14]), .c2(c[15]), .Z(botPath[7]) );
    
    
    wire r_not;
    dflipflop DFF(botPath[7], topPath[7], r);

//    assign r = ~(topPath[7] & r_not);
//    assign r_not = ~(botPath[7] & r); 
//    nor(r, botPath[7], r_not);
//    nor(r_not, topPath[7], r);

    
endmodule
