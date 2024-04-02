module four_bit_multiplier_tb;

// reg nrst,CLK;
reg [3:0] a, b; 
wire [7:0] result;

four_bit_multiplier UUT(.result(result), .a(a), .b(b));

// always begin
//     #10 
//     CLK = ~CLK;
//      $display("out value:%b",result);
// end

initial begin
$dumpfile("four_bit_multiplier.vcd");
$dumpvars(0,four_bit_multiplier_tb);

// we have to start somewhere
// CLK = 0;
// nrst = 0;
#15
a = 4'b1111;
b = 4'b1111;

#15
a = 4'b1010;
b = 4'b1111;


#15
a = 4'b1001;
b = 4'b0110;

#15
a = 4'b1001;
b = 4'b0000;
 
#100

$finish; 
end

endmodule
