
module counter_ff(i_clk,
  i_nReset,
  i_step,
  i_threashold,
  o_state);

  parameter WIDTH = 4;

  input i_clk;
  input i_nReset;
  input signed [WIDTH-1:0] i_step;
  input signed [WIDTH-1:0] i_threashold;
  output  o_state;

  reg [WIDTH-1:0] counter;
  reg state;

  always @(posedge i_clk) begin : MAIN_LOOP
    if (i_nReset == 0) begin
      counter <= 0;
    end else begin
      counter <= counter + i_step;
      if (counter > i_threashold)
        state <= 1;
      else
        state <= 0;
    end
  end

  assign o_state = state;

endmodule
