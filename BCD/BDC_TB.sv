module BCD_TB#(parameter N=10, ITERACIONES = 10)();

    reg [N-1:0] BCD_in_sw;
    wire [6:0] display_unidad;
    wire [6:0] display_decena;
    wire [6:0] display_centena;
    wire [6:0] display_miles;
	 
    BCD DUT (
        .BCD_in_sw(BCD_in_sw),
        .display_unidad(display_unidad),
        .display_decena(display_decena),
        .display_centena(display_centena),
        .display_miles(display_miles)
    );

    // Task para generar valores aleatorios
    task set_input();
        begin
            BCD_in_sw = $urandom_range(0, 2**N - 1);
            $display("Valor a probar = %d", BCD_in_sw);
            #10;
        end
    endtask

    integer i;

    initial begin
        for (i = 0; i < ITERACIONES; i = i + 1) begin
            set_input();
        end
    end

endmodule
