`default_nettype none

module cloc_div #(
    parameter DIV_RATIO = 10
)(
    input wire i_cloc_div_clock_in,
    input wire i_cloc_div_reset_n,
    output reg o_cloc_div_clock_out
);

localparam WIDTH = $clog2(DIV_RATIO);
localparam HALF_COUNT = (DIV_RATIO / 2) - 1;

reg [WIDTH-1:0] counter;

always @(posedge i_cloc_div_clock_in or negedge i_cloc_div_reset_n) begin
    if (!i_cloc_div_reset_n) begin
        counter <= 'b0;
        o_cloc_div_clock_out <= 1'b0;
    end
    else if (counter == HALF_COUNT) begin
        counter <= 'b0;
        o_cloc_div_clock_out <= ~o_cloc_div_clock_out;
    end
    else begin
        counter <= counter + 1'b1;
    end
end

endmodule
