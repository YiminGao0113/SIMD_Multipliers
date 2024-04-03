module dp64_tb;

// reg nrst,CLK;
reg [63:0] a, b; 
wire [34:0] sum_int16;
wire [18:0] sum_int8;
wire [11:0] sum_int4;
wire [10:0] sum_int2;

// int16_multiplier UUT(.result_int16(result), .result_int2_0(result_int2_0), .result_int2_1(result_int2_1), .result_int2_2(result_int2_2), .result_int2_3(result_int2_3), .result_int2_4(result_int2_4), .result_int2_5(result_int2_5), .result_int2_6(result_int2_6), .result_int2_7(result_int2_7), .result_int4_0(result_int4_0), .result_int4_1(result_int4_1), .result_int4_2(result_int4_2), .result_int4_3(result_int4_3), .a(a), .b(b));
dp64 UUT(a, b, sum_int16, sum_int8, sum_int4, sum_int2);
// always begin
//     #10 
//     CLK = ~CLK;
//      $display("out value:%b",result);
// end

initial begin
$dumpfile("build/dp64.vcd");
$dumpvars(0,dp64_tb);

// we have to start somewhere
// CLK = 0;
// nrst = 0;
#15
a = 64'b1111111111111111111111111111111111111111111111111111111111111111;
b = 64'b1111111111111111111111111111111111111111111111111111111111111111;

#15
a = 64'b0000000000000001000000000000000100000000000000010000000000000001;
b = 64'b0000000000000001000000000000000100000000000000010000000000000001;
 
#100

$finish; 
end

endmodule
