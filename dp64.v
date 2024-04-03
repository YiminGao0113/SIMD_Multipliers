
module dp64(
    input [63:0] a, b,
    output [34:0]  sum_int16,
    output [18:0]  sum_int8,
    output [11:0]  sum_int4,
    output [10:0]  sum_int2
 );

wire [31:0] result_int16 [3:0];
wire [15:0] result_int8 [7:0];
wire [7:0]  result_int4 [15:0];
wire [3:0]  result_int2 [31:0];

wire [6:0]   sum_int2_0, sum_int2_1, sum_int2_2, sum_int2_3;
wire [9:0]   sum_int4_0, sum_int4_1, sum_int4_2, sum_int4_3;
wire [16:0]  sum_int8_0, sum_int8_1, sum_int8_2, sum_int8_3;

assign sum_int16 =    result_int16[3] + result_int16[2] + result_int16[1] + result_int16[0];
assign sum_int8  =    sum_int8_0 + sum_int8_1 + sum_int8_2 + sum_int8_3;
assign sum_int4  =    sum_int4_0 + sum_int4_1 + sum_int4_2 + sum_int4_3;
assign sum_int2  =    sum_int2_0 + sum_int2_1 + sum_int2_2 + sum_int2_3;

int16_multiplier m0(.a(a[15:0]), .b(b[15:0]), 
.result_int16(result_int16[0]), 
.sum_int2(sum_int2_0), .sum_int4(sum_int4_0), .sum_int8(sum_int8_0)
);

int16_multiplier m1(.a(a[31:16]), .b(b[31:16]), 
.result_int16(result_int16[1]), 
.sum_int2(sum_int2_1), .sum_int4(sum_int4_1), .sum_int8(sum_int8_1)
);

int16_multiplier m2(.a(a[47:32]), .b(b[47:32]), 
.result_int16(result_int16[2]), 
.sum_int2(sum_int2_2), .sum_int4(sum_int4_2), .sum_int8(sum_int8_2)
);

int16_multiplier m3(.a(a[63:48]), .b(b[63:48]), 
.result_int16(result_int16[3]), 
.sum_int2(sum_int2_3), .sum_int4(sum_int4_3), .sum_int8(sum_int8_3)
);

endmodule

module int16_multiplier(
    input [15:0] a, b,
    output [31:0] result_int16,
    output [3:0] result_int2_0, result_int2_1, result_int2_2, result_int2_3,result_int2_4, result_int2_5, result_int2_6, result_int2_7,
    output [7:0] result_int4_0, result_int4_1, result_int4_2, result_int4_3,
    output [15:0] result_int8_0, result_int8_1,
    output [6:0] sum_int2,
    output [9:0] sum_int4,
    output [16:0] sum_int8
);

wire [15:0]  result_int8_2, result_int8_3;
// [7:0] x [7:0] => output results for int2, int4, and int8
eight_bit_multiplier m0(.result(result_int8_0), .result_int2_0(result_int2_0), .result_int2_1(result_int2_1), .result_int2_2(result_int2_2), .result_int2_3(result_int2_3), .result_int4_0(result_int4_0), .result_int4_1(result_int4_1), .a(a[7:0]), .b(b[7:0]));

// [15:8] x [7:0]
eight_bit_multiplier m1(.result(result_int8_1), .a(a[15:8]), .b(b[7:0]));

// [7:0] x [15:8]
eight_bit_multiplier m2(.result(result_int8_2), .a(a[7:0]), .b(b[15:8]));

// [15:8] x [15:8] => output results for int2, int4, and int8
eight_bit_multiplier m3(.result(result_int8_3), .result_int2_0(result_int2_4), .result_int2_1(result_int2_5), .result_int2_2(result_int2_6), .result_int2_3(result_int2_7), .result_int4_0(result_int4_2), .result_int4_1(result_int4_3), .a(a[15:8]), .b(b[15:8]));


assign result_int16 = result_int8_0 + {result_int8_1, 8'b0} + {result_int8_2, 8'b0} + {result_int8_3, 16'b0};
assign sum_int2 = result_int2_0 + result_int2_1 + result_int2_2 + result_int2_3 + result_int2_4 + result_int2_5 + result_int2_6 + result_int2_7;
assign sum_int4 = result_int4_0 + result_int4_1 + result_int4_2 + result_int4_3;
assign sum_int8 = result_int8_0 + result_int8_1;

endmodule


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
