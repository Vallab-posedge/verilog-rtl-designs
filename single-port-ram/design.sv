module single_port_RAM(
    input [5:0] addr,
    input [15:0] data_in,
    input we,
    input clk,
    output reg [15:0] data_out
);

reg [15:0] ram [63:0];

always @(posedge clk)
begin
    if (we)
        ram[addr] <= data_in;
    else
        data_out <= ram[addr];
end

endmodule
