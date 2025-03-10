module counter_tb();

    reg clk, rst, enable;
    wire [3:0] count;
    counter DUT (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .count(count)
    );

    always #5 clk = ~clk; 

    initial begin
        // Inicialización de señales
        clk = 0;
        enable = 0;
        rst = 0;

        // Secuencia de prueba
        #5  rst = 1;  // Activamos reset
        #10 rst = 0;  // Desactivamos reset
        #10 enable = 1; // Activamos enable

        // Dejamos correr la simulación por un tiempo
        #100 $stop; // Finalizamos la simulación
    end

endmodule
