module controller_test;

localparam integer HLT = 0,
                   SKZ = 1,
                   ADD = 2,
                   AND = 3,
                   XOR = 4,
                   LDA = 5,
                   STO = 6,
                   JMP = 7;

reg [2:0] opcode;
reg [2:0] phase;
reg zero;

wire sel;
wire rd;
wire ld_ir;
wire inc_pc;
wire halt;
wire ld_pc;
wire data_e;
wire ld_ac;
wire wr;

controller dut (
    .opcode(opcode),
    .phase(phase),
    .zero(zero),
    .sel(sel),
    .rd(rd),
    .ld_ir(ld_ir),
    .inc_pc(inc_pc),
    .halt(halt),
    .ld_pc(ld_pc),
    .data_e(data_e),
    .ld_ac(ld_ac),
    .wr(wr)
);

task expect;
    input [8:0] expected;
    begin
        if ({sel,rd,ld_ir,inc_pc,halt,ld_pc,data_e,ld_ac,wr} !== expected) begin
            $display("\nTEST FAILED");
            $display("time\topcode phase zero sel rd ld_ir inc_pc halt ld_pc data_e ld_ac wr");
            $display("====\t====== ===== ==== === == ===== ====== ==== ===== ====== ===== ==");
            $display("%0d\t%d      %d     %b    %b   %b  %b     %b      %b    %b     %b      %b     %b",
                     $time, opcode, phase, zero, sel, rd, ld_ir, inc_pc, halt,
                     ld_pc, data_e, ld_ac, wr);
            $display("WANT\t                  %b   %b  %b     %b      %b    %b     %b      %b     %b",
                     expected[8], expected[7], expected[6], expected[5],
                     expected[4], expected[3], expected[2], expected[1],
                     expected[0]);
            $finish;
        end
    end
endtask

initial begin
    zero = 1'b0;

    $write("Testing opcode HLT phase");
    opcode = HLT;
    $write(" 0"); phase = 0; #1 expect(9'b100000000);
    $write(" 1"); phase = 1; #1 expect(9'b110000000);
    $write(" 2"); phase = 2; #1 expect(9'b111000000);
    $write(" 3"); phase = 3; #1 expect(9'b111000000);
    $write(" 4"); phase = 4; #1 expect(9'b000110000);
    $write(" 5"); phase = 5; #1 expect(9'b000000000);
    $write(" 6"); phase = 6; #1 expect(9'b000000000);
    $write(" 7"); phase = 7; #1 expect(9'b000000000);
    $write("\n");

    $write("Testing opcode SKZ phase");
    opcode = SKZ;
    $write(" 0"); phase = 0; #1 expect(9'b100000000);
    $write(" 1"); phase = 1; #1 expect(9'b110000000);
    $write(" 2"); phase = 2; #1 expect(9'b111000000);
    $write(" 3"); phase = 3; #1 expect(9'b111000000);
    $write(" 4"); phase = 4; #1 expect(9'b000100000);
    $write(" 5"); phase = 5; #1 expect(9'b000000000);
    $write(" 6"); phase = 6; #1 expect(9'b000000000);
    zero = 1'b1; #1 expect(9'b000100000);
    $write(" 7"); phase = 7; #1 expect(9'b000000000);
    $write("\n");

    $write("Testing opcode ADD phase");
    opcode = ADD;
    $write(" 0"); phase = 0; #1 expect(9'b100000000);
    $write(" 1"); phase = 1; #1 expect(9'b110000000);
    $write(" 2"); phase = 2; #1 expect(9'b111000000);
    $write(" 3"); phase = 3; #1 expect(9'b111000000);
    $write(" 4"); phase = 4; #1 expect(9'b000100000);
    $write(" 5"); phase = 5; #1 expect(9'b010000000);
    $write(" 6"); phase = 6; #1 expect(9'b010000000);
    $write(" 7"); phase = 7; #1 expect(9'b010000010);
    $write("\n");

    $write("Testing opcode AND phase");
    opcode = AND;
    $write(" 0"); phase = 0; #1 expect(9'b100000000);
    $write(" 1"); phase = 1; #1 expect(9'b110000000);
    $write(" 2"); phase = 2; #1 expect(9'b111000000);
    $write(" 3"); phase = 3; #1 expect(9'b111000000);
    $write(" 4"); phase = 4; #1 expect(9'b000100000);
    $write(" 5"); phase = 5; #1 expect(9'b010000000);
    $write(" 6"); phase = 6; #1 expect(9'b010000000);
    $write(" 7"); phase = 7; #1 expect(9'b010000010);
    $write("\n");

    $write("Testing opcode XOR phase");
    opcode = XOR;
    $write(" 0"); phase = 0; #1 expect(9'b100000000);
    $write(" 1"); phase = 1; #1 expect(9'b110000000);
    $write(" 2"); phase = 2; #1 expect(9'b111000000);
    $write(" 3"); phase = 3; #1 expect(9'b111000000);
    $write(" 4"); phase = 4; #1 expect(9'b000100000);
    $write(" 5"); phase = 5; #1 expect(9'b010000000);
    $write(" 6"); phase = 6; #1 expect(9'b010000000);
    $write(" 7"); phase = 7; #1 expect(9'b010000010);
    $write("\n");

    $write("Testing opcode LDA phase");
    opcode = LDA;
    $write(" 0"); phase = 0; #1 expect(9'b100000000);
    $write(" 1"); phase = 1; #1 expect(9'b110000000);
    $write(" 2"); phase = 2; #1 expect(9'b111000000);
    $write(" 3"); phase = 3; #1 expect(9'b111000000);
    $write(" 4"); phase = 4; #1 expect(9'b000100000);
    $write(" 5"); phase = 5; #1 expect(9'b010000000);
    $write(" 6"); phase = 6; #1 expect(9'b010000000);
    $write(" 7"); phase = 7; #1 expect(9'b010000010);
    $write("\n");

    $write("Testing opcode STO phase");
    opcode = STO;
    $write(" 0"); phase = 0; #1 expect(9'b100000000);
    $write(" 1"); phase = 1; #1 expect(9'b110000000);
    $write(" 2"); phase = 2; #1 expect(9'b111000000);
    $write(" 3"); phase = 3; #1 expect(9'b111000000);
    $write(" 4"); phase = 4; #1 expect(9'b000100000);
    $write(" 5"); phase = 5; #1 expect(9'b000000000);
    $write(" 6"); phase = 6; #1 expect(9'b000000100);
    $write(" 7"); phase = 7; #1 expect(9'b000000101);
    $write("\n");

    $write("Testing opcode JMP phase");
    opcode = JMP;
    $write(" 0"); phase = 0; #1 expect(9'b100000000);
    $write(" 1"); phase = 1; #1 expect(9'b110000000);
    $write(" 2"); phase = 2; #1 expect(9'b111000000);
    $write(" 3"); phase = 3; #1 expect(9'b111000000);
    $write(" 4"); phase = 4; #1 expect(9'b000100000);
    $write(" 5"); phase = 5; #1 expect(9'b000000000);
    $write(" 6"); phase = 6; #1 expect(9'b000001000);
    $write(" 7"); phase = 7; #1 expect(9'b000001000);

    $display("\nTEST PASSED");
    $finish;
end

endmodule
