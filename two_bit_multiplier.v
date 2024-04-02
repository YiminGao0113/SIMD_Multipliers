module two_bit_multiplier(
    // input clk, nrst, 
    input [1:0] a, b,
    output [3:0] result
);
    assign result = a * b; 

endmodule