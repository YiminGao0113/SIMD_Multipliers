module dp32_tb;

// reg nrst,CLK;
reg [31:0] a, b; 
wire [63:0] mul_int32;
wire [32:0] sum_int16;
wire [17:0] sum_int8;
wire [10:0] sum_int4;
wire [7:0] sum_int2;

// int16_multiplier UUT(.result_int16(result), .result_int2_0(result_int2_0), .result_int2_1(result_int2_1), .result_int2_2(result_int2_2), .result_int2_3(result_int2_3), .result_int2_4(result_int2_4), .result_int2_5(result_int2_5), .result_int2_6(result_int2_6), .result_int2_7(result_int2_7), .result_int4_0(result_int4_0), .result_int4_1(result_int4_1), .result_int4_2(result_int4_2), .result_int4_3(result_int4_3), .a(a), .b(b));
dp32 UUT(a, b, mul_int32, sum_int16, sum_int8, sum_int4, sum_int2);
// always begin
//     #10 
//     CLK = ~CLK;
//      $display("out value:%b",result);
// end

initial begin
$dumpfile("dp32.vcd");
$dumpvars(0,dp32_tb);

// we have to start somewhere
// CLK = 0;
// nrst = 0;
#15
a = 32'hFFFFFFFF;
b = 32'hFFFFFFFF;
#15
a = 32'h22222222;
b = 32'h22222222;
#15
a = 32'h11111111;
b = 32'h11111111;
#15
a = 32'b01010101010101010101010101010101;
b = 32'b01010101010101010101010101010101;
#100

$finish; 
end

endmodule
