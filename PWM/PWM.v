
// Clock Divider
module clkdiv #(parameter FREQ = 50) (
    input clk,
    input rst,
    output reg clk_div
);

localparam constantN = 50_000_000; // 50 MHz base clock
localparam COUNT_MAX = constantN/(2*FREQ);

reg [31:0] count;

always @(posedge clk or posedge rst) 
begin
    if (rst)    
        count <= 32'b0;
    else if (count == COUNT_MAX - 1)
        count <= 32'b0;
    else
        count <= count + 1;
end

always @(posedge clk or posedge rst) begin 
    if (rst)
        clk_div <= 1'b0;
    else if (count == COUNT_MAX - 1)
        clk_div <= ~clk_div;
end

endmodule


// PWM Module
module PWM(
    input pb_inc,
    input pb_dec,
    input clk,
    input rst,
    output pwm_out
);

wire neg_pb_inc = ~pb_inc;
wire neg_pb_dec = ~pb_dec;
wire slow_clk;
wire debounced_pb_inc;
wire debounced_pb_dec;

reg [31:0] DC = 32'd10; // Inicializar

parameter base_freq = 50_000_000;
parameter target_freq = 50;
parameter counts = base_freq / target_freq; 
parameter step_size = 1; // Cambia el duty cycle 

// Reducir la frecuencia del reloj
clkdiv u1(.clk(clk), .rst(rst), .clk_div(slow_clk));

// Debouncer
debouncer d0(.pb_1(neg_pb_inc), .clk(slow_clk), .rst(rst), .pb_out(debounced_pb_inc));
debouncer d1(.pb_1(neg_pb_dec), .clk(slow_clk), .rst(rst), .pb_out(debounced_pb_dec));

// Control del Duty Cycle
always @(posedge slow_clk or posedge rst)
begin 
    if (rst)
        DC <= 32'd7; // Reset 
    else if (debounced_pb_inc && DC < 100) 
        DC <= DC + step_size;
    else if (debounced_pb_dec && DC > 0) 
        DC <= DC - step_size;
	  else if (DC == 100)
			DC <= DC;
end

// Generación PWM
reg [31:0] counter;
always @(posedge clk or posedge rst) 
begin
    if (rst)
        counter <= 32'b0;
    else if (counter >= counts - 1)
        counter <= 32'b0;
    else
        counter <= counter + 1;
end

assign pwm_out = (counter < (DC * counts / 100)) ? 1'b1 : 1'b0;

endmodule


// Debouncer Module
module debouncer(
    input pb_1,
    input clk,
    input rst,
    output pb_out
);

wire Q0, Q1, Q2, Q2_bar;

// Flip-Flops
d_ff d0(.clk(clk), .D(pb_1), .rst(rst), .Q(Q0));
d_ff d1(.clk(clk), .D(Q0), .rst(rst), .Q(Q1));
d_ff d2(.clk(clk), .D(Q1), .rst(rst), .Q(Q2));

assign Q2_bar = ~Q2;
assign pb_out = Q1 & Q2_bar; 

endmodule


// D Flip-Flop
module d_ff(
    input clk,
    input D,
    input rst,
    output reg Q
);

always @(posedge clk or posedge rst)
begin
    if (rst)
        Q <= 1'b0;
    else
        Q <= D;
end

endmodule
