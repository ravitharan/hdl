

module lut_ram(i_clk,
    i_nReset,
    i_wvalid,
    i_block,
    i_addr,
    i_data,
    i_rvalid,
    o_data);

parameter BLOCK_WIDTH = 4;
parameter ADDR_WIDTH = 10;
parameter DATA_WIDTH = 16;
parameter IMPL_DATA_WIDTH = 8;

input i_clk;
input i_nReset;
input i_wvalid;
input [BLOCK_WIDTH-1:0] i_block;
input [ADDR_WIDTH-1:0] i_addr;
input [DATA_WIDTH-1:0] i_data;
input i_rvalid;
output reg[IMPL_DATA_WIDTH-1:0] o_data;

reg [DATA_WIDTH-1:0]  ram[0:2**BLOCK_WIDTH-1][0:2**ADDR_WIDTH-1];

always @(posedge i_clk) begin
    if (i_nReset == 0) begin
    end else begin
        if (i_wvalid)
            ram[i_block][i_addr] = i_data;

        if (i_rvalid)
            o_data = ram[i_block][i_addr];
    end
end

endmodule

