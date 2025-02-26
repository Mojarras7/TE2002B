// Conversor binario a decimal con display de 7 segmentos

module BCD(
    input [9:0] BCD_in_sw, // Entrada binaria
    output [6:0] display_unidad, display_decena, display_centena, display_miles // Salidas a los displays
);
    
    wire [3:0] unidad;
    wire [3:0] decena;
    wire [3:0] centena;
    wire [3:0] miles;

    // Conversión binaria a BCD
    assign unidad = BCD_in_sw % 10;
    assign decena = (BCD_in_sw / 10) % 10;
    assign centena = (BCD_in_sw / 100) % 10;
    assign miles = (BCD_in_sw / 1000) % 10;

    // Instancias de los decodificadores de 7 segmentos
    decoder_7seg DISPLAY_UNIDADES (
        .decoder_in(unidad),
        .decoder_out(display_unidad)
    );

    decoder_7seg DISPLAY_DECENAS (
        .decoder_in(decena),
        .decoder_out(display_decena)
    );

    decoder_7seg DISPLAY_CENTENAS (
        .decoder_in(centena),
        .decoder_out(display_centena)
    );

    decoder_7seg DISPLAY_MILES (
        .decoder_in(miles),
        .decoder_out(display_miles)
    );

endmodule
