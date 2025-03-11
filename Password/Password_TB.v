`timescale 1ns / 1ps

module Password_tb;
    reg clk;
    reg [3:0] sw;
    wire access;
    wire [6:0] seg;
    wire [3:0] an;


    Password DUT (
        .clk(clk),
        .sw(sw),
        .access(access),
        .seg(seg),
        .an(an)
    );

    // Generación del clock
    always #5 clk = ~clk;

    initial begin

        clk = 0;
        sw = 4'b0000;
        #10 sw = 4'b0001; 
        #10 sw = 4'b0000;
        #10 sw = 4'b0001; 
        #10 sw = 4'b0000;
        #20;

        #10 sw = 4'b0001;
        #10 sw = 4'b0001;
        #10 sw = 4'b0000;
        #10 sw = 4'b0000;
        #20;

    end

endmodule
