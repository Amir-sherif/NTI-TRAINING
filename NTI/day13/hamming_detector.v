module hamming_decoder (
    input  [6:0] code_in,
    output reg [3:0] data_out,
    output reg       error_detected,
    output reg       error_corrected
);

reg [2:0] pattern;
reg [6:0] corrected_code;

always @(*) begin

    pattern[0] = code_in[0] ^ code_in[2] ^ code_in[4] ^ code_in[6];
    pattern[1] = code_in[1] ^ code_in[2] ^ code_in[5] ^ code_in[6];
    pattern[2] = code_in[3] ^ code_in[4] ^ code_in[5] ^ code_in[6];

    corrected_code = code_in;

    error_detected = 1'b0;
    error_corrected = 1'b0;

    if (pattern != 3'b000) begin
        error_detected = 1'b1;
        error_corrected = 1'b1;

        case (pattern)
            3'b001: corrected_code[0] = ~code_in[0];
            3'b010: corrected_code[1] = ~code_in[1];
            3'b011: corrected_code[2] = ~code_in[2];
            3'b100: corrected_code[3] = ~code_in[3];
            3'b101: corrected_code[4] = ~code_in[4];
            3'b110: corrected_code[5] = ~code_in[5];
            3'b111: corrected_code[6] = ~code_in[6];
        endcase
    end

    data_out[0] = corrected_code[2];
    data_out[1] = corrected_code[4];
    data_out[2] = corrected_code[5];
    data_out[3] = corrected_code[6];

end

endmodule
