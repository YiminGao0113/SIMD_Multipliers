module two_bit_multiplier_tb;

// reg nrst,CLK;
reg [1:0] a, b; 
wire [3:0] result;

two_bit_multiplier UUT(.result(result), .a(a), .b(b));

// always begin
//     #10 
//     CLK = ~CLK;
//      $display("out value:%b",result);
// end

initial begin
$dumpfile("build/two_bit_multiplier.vcd");
$dumpvars(0,two_bit_multiplier_tb);

// we have to start somewhere
// CLK = 0;
// nrst = 0;
#15
a = 2'b11;
b = 2'b11;

#15
a = 2'b01;
b = 2'b01;


#15
a = 2'b10;
b = 2'b01;
 
#100

$finish; 
end

endmodule
