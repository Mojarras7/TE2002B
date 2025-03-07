module Frecuenciometro(
    input clk,
    input rst,       
    input signal_in, 
    output reg [6:0] seg0, 
    output reg [6:0] seg1, 
    output reg [6:0] seg2, 
    output reg [6:0] seg3, 
    output reg [6:0] seg4, 
    output reg [6:0] seg5  
);

    reg [31:0] contadorPulsos; 
    reg [31:0] contadorTiempo;
    reg [31:0] frecuencia;     
    reg estadoAnterior;  
	 
	//contar pulsos
    always @(posedge clk or posedge rst) 
	 begin
        if (rst) 
		  begin
            contadorPulsos <= 0;
            contadorTiempo <= 0;
            frecuencia <= 0;
        end 
		  else 
				begin
            if (contadorTiempo < 50_000_000) 
				begin  
                contadorTiempo <= contadorTiempo + 1;
                if (signal_in && !estadoAnterior) 
					 begin  
                    contadorPulsos <= contadorPulsos + 1;
                end
                estadoAnterior <= signal_in;
            end 
				else 
				begin
                frecuencia <= contadorPulsos * 11/10; 
                contadorPulsos <= 0;
                contadorTiempo <= 0;
            end
        end
    end

    // Extraer digito
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

    // Conversión a segmentos
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

        case (d2)
            4'd0: seg2 = 7'b1000000;
            4'd1: seg2 = 7'b1111001;
            4'd2: seg2 = 7'b0100100;
            4'd3: seg2 = 7'b0110000;
            4'd4: seg2 = 7'b0011001;
            4'd5: seg2 = 7'b0010010;
            4'd6: seg2 = 7'b0000010;
            4'd7: seg2 = 7'b1111000;
            4'd8: seg2 = 7'b0000000;
            4'd9: seg2 = 7'b0010000;
            default: seg2 = 7'b1111111;
        endcase

        case (d3)
            4'd0: seg3 = 7'b1000000;
            4'd1: seg3 = 7'b1111001;
            4'd2: seg3 = 7'b0100100;
            4'd3: seg3 = 7'b0110000;
            4'd4: seg3 = 7'b0011001;
            4'd5: seg3 = 7'b0010010;
            4'd6: seg3 = 7'b0000010;
            4'd7: seg3 = 7'b1111000;
            4'd8: seg3 = 7'b0000000;
            4'd9: seg3 = 7'b0010000;
            default: seg3 = 7'b1111111;
        endcase

        case (d4)
            4'd0: seg4 = 7'b1000000;
            4'd1: seg4 = 7'b1111001;
            4'd2: seg4 = 7'b0100100;
            4'd3: seg4 = 7'b0110000;
            4'd4: seg4 = 7'b0011001;
            4'd5: seg4 = 7'b0010010;
            4'd6: seg4 = 7'b0000010;
            4'd7: seg4 = 7'b1111000;
            4'd8: seg4 = 7'b0000000;
            4'd9: seg4 = 7'b0010000;
            default: seg4 = 7'b1111111;
        endcase

        case (d5)
            4'd0: seg5 = 7'b1000000;
            4'd1: seg5 = 7'b1111001;
            4'd2: seg5 = 7'b0100100;
            4'd3: seg5 = 7'b0110000;
            4'd4: seg5 = 7'b0011001;
            4'd5: seg5 = 7'b0010010;
            4'd6: seg5 = 7'b0000010;
            4'd7: seg5 = 7'b1111000;
            4'd8: seg5 = 7'b0000000;
            4'd9: seg5 = 7'b0010000;
            default: seg5 = 7'b1111111;
        endcase
    end

endmodule
