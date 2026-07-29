module MUX4X1_GL(
    input I0, I1, I2, I3,
    input [1:0] S,
    output Y
);

wire S0n, S1n;
wire w0, w1, w2, w3;

not (S0n, S[0]);
not (S1n, S[1]);

and (w0, I0, S1n, S0n);
and (w1, I1, S1n, S[0]);
and (w2, I2, S[1], S0n);
and (w3, I3, S[1], S[0]);

or (Y, w0, w1, w2, w3);

endmodule
