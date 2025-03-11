module Password(
	input clk,
	input rst,
	input boton,
	input [3: 0] sw,
	//input correct,
	output reg [6:0] HEX0,HEX1,HEX2,HEX3, HEX4

);


// clock div 
wire clk_div;

clkdiv #(50000000) clk_div_inst (
    .clk(clk),
    .rst(rst),
    .clk_div(clk_div)
);


//one shot 
wire pulse;

OneShot GenPulso(
	.clk_div(clk),
	.b(boton),
	.oneShot(pulse)

);



//estados 

localparam IDLE     = 3'b001,
          DIG1      = 3'b010,
          DIG2      = 3'b011,
          DIG3      = 3'b100,
          DIG4      = 3'b101,
          COMPLETE  = 3'b110,
          ERROR     = 3'b000;
			 
			 
reg[2:0] current_state;
reg[2:0] next_state;


localparam [3:0] PASSWORD = 4'b1010;


always@(posedge pulse or posedge rst)
begin 
	if(rst)
		current_state <= IDLE; 
	else
		current_state <= next_state; 
end


always@(*)
		begin
		next_state = current_state;
		case(current_state) 
		//la contra es 1010
			IDLE:
				begin
						next_state = DIG1; //presionar para iniciar
				end
			
			DIG1:
				begin
						begin
							if(sw[0] == PASSWORD[0])
								next_state = DIG2;
							else
								next_state = ERROR;
						
						end
				end
			DIG2:
				begin 
						begin 
							if(sw[1] == PASSWORD[1])
								next_state = DIG3;
							else 
								next_state = ERROR;
						end
				end 
			DIG3:
				begin
					begin
						if(sw[2] == PASSWORD[2])
								next_state = DIG4;
							else 
								next_state = ERROR;
					end
				end
			DIG4:
				begin 
					begin
					if(sw[3] == PASSWORD[3])
								next_state = COMPLETE;
							else 
								next_state = ERROR;
					end
				end
			ERROR:
				begin
					next_state = IDLE;
				
				end
			COMPLETE:
				begin
					next_state = IDLE;
				
				end
		endcase
				
end


//assign correct = (current_state == UNLOCKED);

always@(*)
begin
	case(current_state)
	//display de 7 segmentos 	
		  COMPLETE:
        begin
            HEX4 = 7'b1111_111;
            HEX3 = 7'b0100_001;
            HEX2 = 7'b1000_000;
            HEX1 = 7'b1001_000;
            HEX0 = 7'b0000_110;
        end
        ERROR:
        begin
            HEX4 = 7'b0000_110;
            HEX3 = 7'b0101_111;
            HEX2 = 7'b0101_111;
            HEX1 = 7'b0100_011;
            HEX0 = 7'b0101_111;
        end
		  IDLE:
			begin 
				HEX4 = 7'b0111111; 
				HEX3 = 7'b0111111; 
				HEX2 = 7'b0111111; 
				HEX1 = 7'b0111111; 
				HEX0 = 7'b0111111;


			
			end
			
			
			default:
		begin
			HEX4 = 7'b1111111; 
			HEX3 = 7'b1111111; 
			HEX2 = 7'b1111111; 
			HEX1 = 7'b1111111; 
			HEX0 = 7'b1111111;
		end
	endcase

end 

endmodule




//one shot

module OneShot(
	input clk_div,b,
	output reg oneShot 
);


//auxiliares
reg delayB;


always @(posedge clk_div)
	begin
	delayB <= b;	
	if(delayB != b && b ==1)
		oneShot<=1;
	else
		oneShot <= 0;
		
		
end


endmodule






