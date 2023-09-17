module mux #(
    parameter DATA_WIDTH = 32
) (
    input [DATA_WIDTH - 1 : 0] in0, in1,
    input sel,
    output [DATA_WIDTH - 1 : 0] out
);

assign out = (sel)? in1 : in0 ;
    
endmodule