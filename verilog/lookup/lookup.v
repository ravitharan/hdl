
module lookup(i_key,
    o_value);

    parameter WIDTH = 5;
    parameter DATA_WIDTH = 16;

    input [WIDTH-1:0] i_key;
    output [DATA_WIDTH-1:0] o_value;

    wire[DATA_WIDTH-1:0] values[0:2**WIDTH-1];

    assign values[00] = 'h0000;
    assign values[01] = 'h19c4;
    assign values[02] = 'h327a;
    assign values[03] = 'h491f;
    assign values[04] = 'h5cc6;
    assign values[05] = 'h6ca0;
    assign values[06] = 'h7808;
    assign values[07] = 'h7e86;
    assign values[08] = 'h7fd6;
    assign values[09] = 'h7bea;
    assign values[10] = 'h72eb;
    assign values[11] = 'h6538;
    assign values[12] = 'h5360;
    assign values[13] = 'h3e1e;
    assign values[14] = 'h2652;
    assign values[15] = 'h0cf3;
    assign values[16] = 'hf30d;
    assign values[17] = 'hd9ae;
    assign values[18] = 'hc1e2;
    assign values[19] = 'haca0;
    assign values[20] = 'h9ac8;
    assign values[21] = 'h8d15;
    assign values[22] = 'h8416;
    assign values[23] = 'h802a;
    assign values[24] = 'h817a;
    assign values[25] = 'h87f8;
    assign values[26] = 'h9360;
    assign values[27] = 'ha33a;
    assign values[28] = 'hb6e1;
    assign values[29] = 'hcd86;
    assign values[30] = 'he63c;
    assign values[31] = 'h0000;

    assign o_value = values[i_key];

endmodule
