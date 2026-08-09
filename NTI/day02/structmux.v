module MUX4X1_Struct(
    input I0, I1, I2, I3,
    input [1:0] S,
    output Y
);

wire w1, w2;

MUX2X1 M1 (.A(I0), .B(I1), .S(S[0]), .Y(w1));
MUX2X1 M2 (.A(I2), .B(I3), .S(S[0]), .Y(w2));
MUX2X1 M3 (.A(w1), .B(w2), .S(S[1]), .Y(Y));

endmodule
