module moore_fsm (
    input clk,
    input rst,
    input x,
    output reg y
);

    parameter S0 = 2'b00,
              S1 = 2'b01,
              S2 = 2'b10,
              S3 = 2'b11;

    reg [1:0] state, next_state;

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)

            S0: begin
                if (x)
                    next_state = S1;
                else
                    next_state = S0;
            end

            S1: begin
                if (x)
                    next_state = S1;
                else
                    next_state = S2;
            end

            S2: begin
                if (x)
                    next_state = S3;
                else
                    next_state = S0;
            end

            S3: begin
                if (x)
                    next_state = S1;
                else
                    next_state = S0;
            end

            default: next_state = S0;

        endcase
    end

    always @(*) begin
        case (state)

            S3: y = 1'b1;

            default: y = 1'b0;

        endcase
    end

endmodule
