//memorias 


module ROM #(parameter DATA_WITH =8, ADRESS_WIDTH = 8)(
	input ce, read_en, //chip enable, read enable 
	input [7:0] adress, //tiene que tener el tamanio para 8 bits 
	output reg data //no es reg porque es assign 



);

reg [7:0] mem[0:255];
initial begin

	$readmemb("rom.hex", mem);
end 

assign data =  (ce && read_en) ?
mem[adress] : 8'h00;

endmodule