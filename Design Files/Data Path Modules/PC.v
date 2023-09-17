module PC (
    input [31:0] next_inst,
    input clk, rst,
    output reg [31:0] current_inst
);
    
always @(posedge clk) begin
    if (~rst)
        current_inst = 0;
    else
        current_inst = next_inst;
end    
endmodule