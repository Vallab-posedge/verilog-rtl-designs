`timescale 1ns/1ps

module testbench;

reg [5:0] addr_a;
reg [5:0] addr_b;

reg [15:0] data_a;
reg [15:0] data_b;

reg we_a;
reg we_b;
reg clk;

wire [15:0] q_a;
wire [15:0] q_b;


dualport_RAM uut(
    .addr_a(addr_a),
    .addr_b(addr_b),
    .data_a(data_a),
    .data_b(data_b),
    .we_a(we_a),
    .we_b(we_b),
    .clk(clk),
    .q_a(q_a),
    .q_b(q_b)
);

initial
begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);
end

initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial
begin

    addr_a = 6'd10;
    data_a = 16'd25;
    we_a   = 1;

    addr_b = 6'd15;
    data_b = 16'd30;
    we_b   = 1;

    #10;


    we_a   = 0;
    addr_a = 6'd10;

    we_b   = 0;
    addr_b = 6'd15;

    #10;


    addr_a = 6'd20;
    data_a = 16'd35;
    we_a   = 1;

    we_b   = 0;
    addr_b = 6'd10;

    #10;


    we_a   = 0;
    addr_a = 6'd20;

    we_b   = 0;
    addr_b = 6'd15;

    #10;


    addr_a = 6'd40;
    data_a = 16'd200;
    we_a   = 1;

    addr_b = 6'd40;
    data_b = 16'd200;
    we_b   = 1;

    #10;

    $finish;

end

endmodule
