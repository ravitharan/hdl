`timescale 1ns/1ps

module tb_lookup();

    parameter WIDTH = 5;
    parameter DATA_WIDTH = 16;

    reg clk;
    reg nReset;
    reg [WIDTH-1:0] x;
    wire [DATA_WIDTH-1:0] value;

    lookup lookup_1(x, value);

    initial
    begin
        clk = 0;
        nReset = 0;
        #100 nReset = 1;
    end

    always #5 clk = ~clk;

    always @(posedge clk) begin
        if (nReset == 0)
            x = 0;
        else
            x = x +1;
    end

endmodule
