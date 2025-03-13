module SumModuleC(
	input clk, rst, enable,
	input [3:0] sumar,
	output reg [6:0] seg0, 
    output reg [6:0] seg1, 
    output reg [6:0] seg2, 
    output reg [6:0] seg3, 
    output reg [6:0] seg4, 
    output reg [6:0] seg5 
);


//mi logica de estados solo consideraba 4 valores, si N=3, sumaba bien de 3 a 0, pero cuando N = 10, solo sumaba hasta 7
localparam 		   SUMANDO = 1,
				   SUMADO = 2,
				   IDLE = 0;

reg [3:0] current_state;
reg [3:0] next_state;

reg [31:0] sumatoria = 0;
reg [31:0] frecuencia;
reg [3:0] contador;

// Control de estado
always@(posedge clk)
	begin 
		if(rst)
			current_state <= IDLE; 
		else
			current_state <= next_state; 
	end

// Lógica de la sumatoria

//mi logica de la maquina de estados estaba mal tambien, hice 2 logicas, pero la segunda fue peor, la mas cercana 
//fue la primera pero como mencione esta solo sumaba 4 valores
always@(*)
	begin
		case(current_state)
			IDLE:
				begin
					sumatoria  = 0;
					contador = sumar;
					next_state = SUMANDO;
				end
			
			SUMANDO:
				begin
					if (contador >= 0) begin
						sumatoria = sumatoria + contador;
						contador = contador - 1;
					end else begin
						next_state = SUMADO;
					end
				end
			
			SUMADO:
				begin
					frecuencia <= sumatoria;
				end
		endcase
	end	
	
//reutilice el codigo del frecuenciometro, por lo que para imprimir uso frecuencia y esto se convierte a 
//decimal y ya se muestra en el display

// Conversión a dígitos para los displays de 7 segmentos
reg [3:0] d0, d1, d2, d3, d4, d5;

always @(posedge clk) 
	begin
		integer temp;
		temp = frecuencia;
		d0 = temp % 10; 
		temp = temp / 10;
		d1 = temp % 10; 
		temp = temp / 10;
		d2 = temp % 10; 
		temp = temp / 10;
		d3 = temp % 10; 
		temp = temp / 10;
		d4 = temp % 10;
		temp = temp / 10;
		d5 = temp % 10;
	end

// Mapeo de valores para display de 7 segmentos
always @(posedge clk) 
	begin
		case (d0)
			4'd0: seg0 = 7'b1000000;
			4'd1: seg0 = 7'b1111001;
			4'd2: seg0 = 7'b0100100;
			4'd3: seg0 = 7'b0110000;
			4'd4: seg0 = 7'b0011001;
			4'd5: seg0 = 7'b0010010;
			4'd6: seg0 = 7'b0000010;
			4'd7: seg0 = 7'b1111000;
			4'd8: seg0 = 7'b0000000;
			4'd9: seg0 = 7'b0010000;
			default: seg0 = 7'b1111111;
		endcase

		case (d1)
			4'd0: seg1 = 7'b1000000;
			4'd1: seg1 = 7'b1111001;
			4'd2: seg1 = 7'b0100100;
			4'd3: seg1 = 7'b0110000;
			4'd4: seg1 = 7'b0011001;
			4'd5: seg1 = 7'b0010010;
			4'd6: seg1 = 7'b0000010;
			4'd7: seg1 = 7'b1111000;
			4'd8: seg1 = 7'b0000000;
			4'd9: seg1 = 7'b0010000;
			default: seg1 = 7'b1111111;
		endcase
	end

endmodule
