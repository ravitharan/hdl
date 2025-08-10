
module tb_division_wrapper();

    logic aclk;
    logic [71:0]dout;
    logic dout_valid;
    logic [47:0]dividend;
    logic dividend_valid;
    logic [23:0]divisor;
    logic divisor_valid;

    division_wrapper division_wrapper_0(
       .aclk(aclk),
        .m_axis_dout_tdata(dout),
        .m_axis_dout_tvalid(dout_valid),
        .s_axis_dividend_tdata(dividend),
        .s_axis_dividend_tvalid(dividend_valid),
        .s_axis_divisor_tdata(divisor),
        .s_axis_divisor_tvalid(divisor_valid)
        );

    initial begin
    end

endmodule
