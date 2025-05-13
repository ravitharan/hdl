`timescale 1ns/1ps

module tb_counter();
parameter WIDTH = 4;

reg clk, nReset;
reg signed [WIDTH-1:0] step;
reg signed [WIDTH-1:0] threashold;
wire  state;

counter #(WIDTH)  counter_1(clk, nReset, step, threashold, state);

initial
  begin
    clk = 0;
    nReset = 0;
    step = 3;
    threashold = 13;
    #100 nReset = 1;
  end

  always #5 clk = ~clk;

endmodule
