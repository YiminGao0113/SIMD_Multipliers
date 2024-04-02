module eight_bit_multiplier_tb;

// reg nrst,CLK;
reg [7:0] a, b; 
wire [15:0] result;
wire [3:0] result_int2_0, result_int2_1, result_int2_2, result_int2_3;
wire [7:0] result_int4_0, result_int4_1;

eight_bit_multiplier UUT(.result(result), .result_int2_0(result_int2_0), .result_int2_1(result_int2_1), .result_int2_2(result_int2_2), .result_int2_3(result_int2_3), .result_int4_0(result_int4_0), .result_int4_1(result_int4_1), .a(a), .b(b));

// always begin
//     #10 
//     CLK = ~CLK;
//      $display("out value:%b",result);
// end

initial begin
$dumpfile("eight_bit_multiplier.vcd");
$dumpvars(0,eight_bit_multiplier_tb);

// we have to start somewhere
// CLK = 0;
// nrst = 0;
#15
a = 8'b11111111;
b = 8'b11111111;

#15
a = 8'b10100000;
b = 8'b11111111;
 
#100

$finish; 
end

endmodule
