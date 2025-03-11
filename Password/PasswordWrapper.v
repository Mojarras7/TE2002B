module PasswordWrapper(
    input clk,
    input [3:0] sw,  // Entradas de switches físicos
    output access,
    output [6:0] seg,  // Salida del display de 7 segmentos
    output [3:0] an  // Anodo del display
);

    // Instancia del módulo Password
    Password password_inst (
        .clk(clk),
        .sw(sw),
        .access(access),
        .seg(seg),
        .an(an)
    );

endmodule
