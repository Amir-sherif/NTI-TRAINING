module controller (
    input  wire [2:0] opcode,
    input  wire [2:0] phase,
    input  wire zero,
    output wire sel,
    output wire rd,
    output wire ld_ir,
    output wire inc_pc,
    output wire halt,
    output wire ld_pc,
    output wire data_e,
    output wire ld_ac,
    output wire wr
);

localparam [2:0] HLT = 3'b000,
                 SKZ = 3'b001,
                 ADD = 3'b010,
                 AND = 3'b011,
                 XOR = 3'b100,
                 LDA = 3'b101,
                 STO = 3'b110,
                 JMP = 3'b111;

localparam [2:0] INST_ADDR  = 3'b000,
                 INST_FETCH = 3'b001,
                 INST_LOAD  = 3'b010,
                 IDLE       = 3'b011,
                 OP_ADDR    = 3'b100,
                 OP_FETCH   = 3'b101,
                 ALU_OP     = 3'b110,
                 STORE      = 3'b111;

wire is_halt;
wire is_alu;
wire is_skip;
wire is_jump;
wire is_store;

reg [8:0] control_word;

assign is_halt = (opcode == HLT);
assign is_alu  = (opcode == ADD) || (opcode == AND) ||
                 (opcode == XOR) || (opcode == LDA);
assign is_skip = (opcode == SKZ) && zero;
assign is_jump = (opcode == JMP);
assign is_store = (opcode == STO);

always @(*) begin
    control_word = 9'b0;

    case (phase)
        INST_ADDR: begin
            control_word[8] = 1'b1;
        end

        INST_FETCH: begin
            control_word[8:7] = 2'b11;
        end

        INST_LOAD,
        IDLE: begin
            control_word[8:6] = 3'b111;
        end

        OP_ADDR: begin
            control_word[5] = is_halt;
            control_word[4] = 1'b1;
        end

        OP_FETCH: begin
            control_word[7] = is_alu;
        end

        ALU_OP: begin
            control_word[7] = is_alu;
            control_word[4] = is_skip;
            control_word[2] = is_jump;
            control_word[0] = is_store;
        end

        STORE: begin
            control_word[7] = is_alu;
            control_word[6] = is_alu;
            control_word[3] = is_jump;
            control_word[2] = is_store;
            control_word[1] = is_store;
        end

        default: begin
            control_word = 9'b0;
        end
    endcase
end

assign {sel, rd, ld_ir, halt, inc_pc, ld_ac, ld_pc, wr, data_e} = control_word;

endmodule
