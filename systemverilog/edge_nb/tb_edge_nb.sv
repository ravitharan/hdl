`timescale 1ns/1ps

module tb_edge_nb();

  reg clk;
  reg nReset;
  reg out_edge;

  edge_nb edge_1(clk, nReset, out_edge);

  initial
    begin
      clk = 0;
      nReset = 0;
      #100 nReset = 1;
    end

  always #5 clk = ~clk;

endmodule
