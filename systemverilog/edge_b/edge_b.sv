
module edge_b(i_clk, i_nReset, o_edge);

    parameter WIDTH = 4;

    input i_clk;
    input i_nReset;
    output logic o_edge;

    localparam logic [WIDTH-1:0] LIMITS[1:0] = {12, 8};

    logic window, window_last;

    always_ff @(posedge i_clk) begin : WINDOW_GENERATOR_BLOCKING
        logic [WIDTH-1:0] count;
        if (!i_nReset) begin
            window = 0;
            count = LIMITS[0];
        end else begin
            if (count == 0) begin
                count = LIMITS[~window] - 1;
                window = ~window;
            end else begin
                count = count - 1;
            end
        end
    end

    always_ff @(posedge i_clk) begin
        if (!i_nReset) begin
            window_last = 0;
        end else begin
            o_edge = window_last ^ window;
            window_last = window;
        end
    end

endmodule
