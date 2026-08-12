`default_nettype none

module fsm_2seg_multi_seg (
    input wire clk,
    input wire rst_n,
    input wire a,
    input wire b,
    output reg y0,
    output reg y1
);

localparam [1:0] S0 = 2'b00,
                 S1 = 2'b01,
                 S2 = 2'b10;

reg [1:0] Present_State;
reg [1:0] Next_State;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        Present_State <= S0;
    else
        Present_State <= Next_State;
end

always @(*) begin
    Next_State = Present_State;

    case (Present_State)
        S0: begin
            case ({a,b})
                2'b10: Next_State = S1;
                2'b11: Next_State = S2;
            endcase
        end

        S1: begin
            case ({a,b})
                2'b10,
                2'b11: Next_State = S0;
            endcase
        end

        S2: begin
            Next_State = S0;
        end

        default: begin
            Next_State = S0;
        end
    endcase
end

always @(*) begin
    y1 = (Present_State != S2);
end

always @(*) begin
    y0 = 1'b0;

    if ((Present_State == S0) && ({a,b} == 2'b11))
        y0 = 1'b1;
end

endmodule
