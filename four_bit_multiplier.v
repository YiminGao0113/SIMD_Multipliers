module four_bit_multiplier(
    input [3:0] a, b,
    output [7:0] result
);

wire [3:0] result3, result2, result1, result0;
wire [7:0] shifted_result3, shifted_result2, shifted_result1;

two_bit_multiplier m0(a[1:0], b[1:0], result0);
two_bit_multiplier m1(a[3:2], b[1:0], result1);
two_bit_multiplier m2(a[1:0], b[3:2], result2);
two_bit_multiplier m3(a[3:2], b[3:2], result3);

assign shifted_result1 = result1 << 2;
assign shifted_result2 = result2 << 2;
assign shifted_result3 = result3 << 4;
assign result = result0 + {result1, 2'b00} + {result2, 2'b00} + {result3, 4'b00};
// result1<<2 + result2<<2 +result3<<4;
// assign result = result0 + shifted_result1 + shifted_result2 + shifted_result3;

endmodule

module two_bit_multiplier(
    // input clk, nrst, 
    input [1:0] a, b,
    output [3:0] result
);
// Brilliant circuit by Joy
// for clk:
//     if (!nrst)
//         result = a * b;
//     else
//         result += result

// always @ (posedge clk) begin
    // if (!nrst)
        // result <= 0;
    // else
      assign result = a * b; 
// end

endmodule
