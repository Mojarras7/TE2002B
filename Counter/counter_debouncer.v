module counter_debouncer #(parameter N_MAX = 50000000)(
    input clk, 
    input rst_a_p, 
    input enable,  
    output reg [COUNTER_WIDTH-1:0] counter_out,
    output reg counter_match
);

    localparam COUNTER_WIDTH = $clog2(N_MAX);
    reg [COUNTER_WIDTH-1:0] count;  

    always @(posedge clk or posedge rst_a_p) 
	 begin
        if (rst_a_p)
				begin
            count <= 0;
            counter_match <= 0;
        end
        else if (enable) 
				begin 
            if (count >= N_MAX - 1) 
					begin
                count <= 0;
                counter_match <= 1; 
					end 
				else 
					begin
                count <= count + 1;
                counter_match <= 0;
					end
				end
    end

    always @(posedge clk or posedge rst_a_p) 
	 begin
        if (rst_a_p)
            counter_out <= 0;
        else if (enable) 
            counter_out <= count; 
    end

endmodule
