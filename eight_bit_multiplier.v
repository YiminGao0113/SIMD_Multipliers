module eight_bit_multiplier(
    input [7:0] a, b,
    output [15:0] result, 
    output [3:0] result_int2_0, result_int2_1, result_int2_2, result_int2_3,
    output [7:0] result_int4_0, result_int4_1
);

wire [3:0] result0 [3:0]; 
wire [3:0] result1 [3:0]; 
wire [3:0] result2 [3:0]; 
wire [3:0] result3 [3:0]; 
// wire [3:0] result_int2_0, result_int2_1, result_int2_2, result_int2_3;
wire [7:0] result_int4_2, result_int4_3;

// four_bit_multiplier m0(a[3:0], b[3:0], result0);
two_bit_multiplier m0(a[1:0], b[1:0], result0[0]);
two_bit_multiplier m1(a[3:2], b[1:0], result0[1]);
two_bit_multiplier m2(a[1:0], b[3:2], result0[2]);
two_bit_multiplier m3(a[3:2], b[3:2], result0[3]);

assign result_int4_0 = result0[0] + {result0[1], 2'b00} + {result0[2], 2'b00} + {result0[3], 4'b00}; // first output of int4

// four_bit_multiplier m1(a[7:4], b[3:0], result1);
two_bit_multiplier m4(a[5:4], b[1:0], result1[0]);
two_bit_multiplier m5(a[7:6], b[1:0], result1[1]);
two_bit_multiplier m6(a[5:4], b[3:2], result1[2]);
two_bit_multiplier m7(a[7:6], b[3:2], result1[3]);

assign result_int4_1 = result1[0] + {result1[1], 2'b00} + {result1[2], 2'b00} + {result1[3], 4'b00};

// four_bit_multiplier m2(a[3:0], b[7:4], result2);
two_bit_multiplier m8(a[1:0], b[5:4], result2[0]);
two_bit_multiplier m9(a[3:2], b[5:4], result2[1]);
two_bit_multiplier m10(a[1:0], b[7:6], result2[2]);
two_bit_multiplier m11(a[3:2], b[7:6], result2[3]);

assign result_int4_2 = result2[0] + {result2[1], 2'b00} + {result2[2], 2'b00} + {result2[3], 4'b00}; 

// four_bit_multiplier m3(a[7:4], b[7:4], result3);
two_bit_multiplier m12(a[5:4], b[5:4], result3[0]);
two_bit_multiplier m13(a[7:6], b[5:4], result3[1]);
two_bit_multiplier m14(a[5:4], b[7:6], result3[2]);
two_bit_multiplier m15(a[7:6], b[7:6], result3[3]);


assign result_int4_3 = result0[0] + {result3[1], 2'b00} + {result3[2], 2'b00} + {result3[3], 4'b00}; // second output of int4


assign result_int2_0 = result0[0];
assign result_int2_1 = result0[3];
assign result_int2_2 = result3[0];
assign result_int2_3 = result3[3];

assign result = result_int4_0 + {result_int4_1, 4'b00} + {result_int4_2, 4'b00} + {{result_int4_1, 8'b00}};



// assign result = result0 + shifted_result1 + shifted_result2 + shifted_result3;

endmodule

// module four_bit_multiplier(
//     input [3:0] a, b,
//     output [7:0] result
// );

// wire [3:0] result3, result2, result1, result0;
// wire [7:0] shifted_result3, shifted_result2, shifted_result1;

// two_bit_multiplier m0(a[1:0], b[1:0], result0);
// two_bit_multiplier m1(a[3:2], b[1:0], result1);
// two_bit_multiplier m2(a[1:0], b[3:2], result2);
// two_bit_multiplier m3(a[3:2], b[3:2], result3);

// assign shifted_result1 = result1 << 2;
// assign shifted_result2 = result2 << 2;
// assign shifted_result3 = result3 << 4;
// // assign result = result0 + result1<<2 + result2<<2 +result3<<4;
// assign result = result0 + shifted_result1 + shifted_result2 + shifted_result3;

// endmodule

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
