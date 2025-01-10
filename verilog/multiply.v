
module multiply(i_num1, i_num2, o_multply);

parameter WIDTH = 16;

input [WIDTH-1:0] i_num1;
input [WIDTH-1:0] i_num2;
output [WIDTH-1:0] o_multply;

assign o_multply = i_num1 * i_num2;

endmodule
