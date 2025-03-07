`timescale 1ns/1ps

module PWM_TB();

    reg pb_inc, pb_dec;  
    reg clk, rst;        
    wire pwm_out;    

    PWM DUT(
        .pb_inc(pb_inc),
        .pb_dec(pb_dec),
        .clk(clk),
        .rst(rst),
        .pwm_out(pwm_out)
    );

    always #10 clk = ~clk;  

    initial begin 
        // Inicialización
        clk = 0;
        rst = 1;
        pb_inc = 0;
        pb_dec = 0;
        #50 rst = 0;  
        #50 rst = 1;
        #50 rst = 0; 
        #100 pb_inc = 1;
        #20 pb_inc = 0;
        #100 pb_inc = 1;
        #20 pb_inc = 0;

        #100 pb_dec = 1;
        #20 pb_dec = 0;
        #100 pb_dec = 1;
        #20 pb_dec = 0;

        #1000;

        $finish;
    end

endmodule

			