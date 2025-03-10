module debouncer #(parameter N_MAX = 50000000)(
    input clk, 
    input rst_a_p, 
    input debouncer_in,
    output reg debouncer_out
);

    // Se usa $clog2(N_MAX) para calcular el número de bits necesarios para el contador
    localparam COUNTER_WIDTH = $clog2(N_MAX);

    wire [COUNTER_WIDTH-1 : 0] counter_out;
    wire counter_match;

    counter_debouncer #(.N_MAX(N_MAX)) CONTADOR_PARA_RATE(
        .clk(clk),
        .rst_a_p(rst_a_p),  
        .enable(debouncer_in),
        .counter_out(counter_out),
        .counter_match(counter_match)
    );

    always @(posedge clk or posedge rst_a_p) 
	 begin
        if (rst_a_p)
            debouncer_out <= 0;
        else if (counter_match) 
            debouncer_out <= debouncer_in;  
    end

endmodule

