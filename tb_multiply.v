`timescale 1ns/1ps

module tb_multiply();

  parameter WIDTH = 16;

  reg clk;
  reg nReset;
  reg [WIDTH-1:0] num1;
  reg [WIDTH-1:0] num2;
  wire [WIDTH-1:0] multply;

  multiply #(WIDTH) multply_1(num1, num2, multply);

  initial
    begin
      clk = 0;
      nReset = 1;
      #100 nReset = 0;
    end

  always
    begin
      #10 clk = ~ clk;
    end

  always @(posedge clk)
    begin
      if (nReset == 1)
        begin
          num1 = 'h0025;
          num2 = 0;
        end
      else
        begin
          num2 = num2 + 1;
        end
    end

endmodule
