
module OneShot_tb();

    reg clk, b;
    wire oneShot;

    // Instancia del módulo OneShot
    OneShot DUT (
        .clk(clk),
        .b(b),
        .oneShot(oneShot)
    );

    // Generador de reloj
    initial clk = 0;
    always #1 clk = ~clk; // Reloj con periodo de 2 unidades de tiempo

    // Secuencia de prueba
    initial begin
        b = 0;
        
        #100 b = 1;
        #50  b = 0;
        #1000 b = 1;

        $stop;
    end

endmodule
