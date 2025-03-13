module mainCounterClkDiv (
    input clk,           
    input rst,
	 //input [3:0] data_in,
	 //input up_down,
	 //input load,
    output [6:0] display_unidad, 
    output [6:0] display_decena, 
    output [6:0] display_centena, 
    output [6:0] display_miles
);
    // Auxiliares
    wire clk_div;
    //wire debounced_button;
    wire [4:0] unidad, decena, centena, miles;
   // wire counter_match;
    //wire [9:0] time_count;


    clkdiv div_inst (
        .clk(clk),
        .rst(rst),
        .clk_div(clk_div)
    );
/*
    debouncer #(.N_MAX(50000000)) debounce_inst (
        .clk(clk),
        .rst_a_p(rst),
        .debouncer_in(1'b1),
        .debouncer_out(debounced_button)
    );
*/
/*
    bin_count_load counter_inst (
        .clk(clk_div),
        .rst(rst),
        .enable(debounced_button),
        .count(time_count),
		  .up_down(up_down),
		  .load(load),
		  .data_in(data_in)
    );
*/
    BCD bcd_inst (
        .BCD_in_sw(time_count),
        .display_unidad(display_unidad),
        .display_decena(display_decena),
        .display_centena(display_centena),
        .display_miles(display_miles)
    );

endmodule

