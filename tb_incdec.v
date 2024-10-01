`timescale 1ns/1ps

module tb_incdec();
parameter WIDTH = 4;

reg clk, nReset;
wire [WIDTH-1:0] inc;
wire [WIDTH-1:0] dec;

incdec #(WIDTH)  incdec_1(clk, nReset, inc, dec);

initial
  begin
    clk = 0;
    nReset = 0;
    #100 nReset = 1;
  end

  always
    #10 clk = ~clk;

endmodule
