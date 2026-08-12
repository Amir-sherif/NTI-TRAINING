module d_latch (
    input D,
    input EN,
    output Q,
    output Qbar
);

    wire Dbar;
    wire S;
    wire R;

    not (Dbar, D);

    and (S, D, EN);
    and (R, Dbar, EN);

    nor (Q, R, Qbar);
    nor (Qbar, S, Q);

endmodule




