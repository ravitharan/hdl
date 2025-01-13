`timescale 1ns/1ps

module tb_lut_ram();

    parameter BLOCK_WIDTH = 4;
    parameter ADDR_WIDTH = 10;
    parameter DATA_WIDTH = 16;
    parameter IMPL_DATA_WIDTH = DATA_WIDTH;

    reg clk;
    reg nReset;
    reg wvalid;
    reg [BLOCK_WIDTH-1:0] block;
    reg [ADDR_WIDTH-1:0] addr;
    reg [DATA_WIDTH-1:0] in_data;
    reg rvalid;
    wire [DATA_WIDTH-1:0] out_data;

    localparam [1:0] eIDLE = 0,
        eWRITE = 1,
        eREAD = 2,
        eDONE = 3;

    reg [1:0] state;

    lut_ram #(.IMPL_DATA_WIDTH(IMPL_DATA_WIDTH)) lut_ram_0(clk,
        nReset,
        wvalid,
        addr,
        in_data,
        rvalid,
        out_data);

    initial
    begin
        $display("%t: BLOCK_WIDTH %d, ADDR_WIDTH %d, DATA_WIDTH %d",
            $realtime,
            BLOCK_WIDTH,
            ADDR_WIDTH,
            DATA_WIDTH);
        clk = 0;
        nReset = 0;
        #100 nReset = 1;
    end

    always #5 clk = ~clk;

    always @(posedge clk) begin : RW
        if (nReset == 0) begin
            state = eIDLE;
        end else begin
            case (state)

                eIDLE: begin
                    wvalid = 0;
                    rvalid = 0;
                    addr = 0;
                    block = 0;
                    state = eWRITE;
                end

                eWRITE: begin
                    wvalid = ~wvalid;
                    if (wvalid == 0) begin
                        addr = addr + 1;
                        if (addr == 2**ADDR_WIDTH-1) begin
                            addr = 0;
                            block = block + 1;
                            if (block == 2**BLOCK_WIDTH-1) begin
                                block = 0;
                                state = eREAD;
                            end
                        end
                    end
                end

                eREAD: begin
                    rvalid = ~rvalid;
                    if (rvalid == 0) begin
                        addr = addr + 1;
                        if (addr == 2**ADDR_WIDTH-1) begin
                            addr = 0;
                            block = block + 1;
                            if (block == 2**BLOCK_WIDTH-1) begin
                                block = 0;
                                state = eDONE;
                            end
                        end
                    end

                end

                default:
                    state = state;
            endcase
            in_data = 2 * addr;

        end
    end

endmodule
