module clkdiv #(parameter DIV = 50000)(
    input clk,
    input rst,
    output reg clk_div
);

reg [31:0] count;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 0;
        clk_div <= 0;
    end else begin
        if (count >= DIV) begin
            count <= 0;
            clk_div <= ~clk_div; // Divide la frecuencia a la mitad
        end else begin
            count <= count + 1;
        end
    end
end

endmodule