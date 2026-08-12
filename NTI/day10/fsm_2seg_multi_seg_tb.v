`timescale 1ns/1ps

module fsm_2seg_multi_seg_tb;

reg a;
reg b;
reg clk;
reg rst_n;

wire y0;
wire y1;

fsm_2seg_multi_seg fsm (
    .clk(clk),
    .rst_n(rst_n),
    .a(a),
    .b(b),
    .y0(y0),
    .y1(y1)
);

always #10 clk = ~clk;

initial begin
    clk = 1'b0;
    rst_n = 1'b0;

    #12;
    rst_n = 1'b1;

    {a,b} = 2'b11;
    #10;

    {a,b} = 2'b10;
    #15;

    {a,b} = 2'b01;
    #20;

    {a,b} = 2'b10;
    #20;

    {a,b} = 2'b11;
    #45;

    #20;
    $stop;
end

endmodule
