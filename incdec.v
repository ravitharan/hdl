
module incdec(i_clk, i_nReset, o_inc, o_dec);
  parameter WIDTH = 4;

  input i_clk;
  input i_nReset;
  output [WIDTH-1:0] o_inc;
  output [WIDTH-1:0] o_dec;

  reg [WIDTH-1:0] inc;
  reg [WIDTH-1:0] dec;

  always @(posedge i_clk)
    if (i_nReset == 1'b0)
      begin
        inc = 1 << WIDTH-2;
        dec = 1 << WIDTH-2;
      end
    else
      begin
        inc = inc + 1;
        dec = dec - 1;
      end

  assign o_inc = inc;
  assign o_dec = dec;

endmodule
