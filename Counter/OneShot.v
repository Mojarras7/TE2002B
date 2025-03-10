module OneShot(
	input clk,b,
	output reg oneShot 
);


//auxiliares
reg delayB;


always @(posedge clk)
	begin
	delayB <= b;
//	
	
	
	if(delayB != b && b ==1)
		oneShot<=1;
	else
		oneShot <= 0;
		
		
end


endmodule




