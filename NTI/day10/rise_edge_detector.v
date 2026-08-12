module rising_edge_detector (
    input  wire clk,
    input  wire rst,
    input  wire signal,
    output wire rise
);

    reg signal_delay;

    always @(posedge clk or posedge rst) begin
        if (rst)
            signal_delay <= 1'b0;
        else
            signal_delay <= signal;
    end

    assign rise = signal & ~signal_delay;

endmodule
