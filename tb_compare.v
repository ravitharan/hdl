`timescale 1ns/1ps

module tb_compare();

parameter WIDTH = 8;

reg clk;
reg nReset;
reg [WIDTH-1:0] num1;
reg [WIDTH-1:0] num2;
wire out;

compare #(WIDTH) compare_1(num1, num2, out);

  initial
    begin
      clk = 0;
      nReset = 0;
      num1 = 8'h20;
      nReset = 0;
      #100 nReset = 1;
    end

  always
    begin
      #10 clk = ~clk;
    end

  always @(posedge clk)
    begin
      if (nReset == 0)
        num2 = 0;
      else
        num2 = num2 + 1;
    end

endmodule
