
module compare(i_num1,
  i_num2,
  o_out);

  parameter WIDTH = 8;

  input [WIDTH-1:0] i_num1;
  input [WIDTH-1:0] i_num2;
  output o_out;

assign o_out = (i_num1 > i_num2) ? 1 : 0; 

endmodule
