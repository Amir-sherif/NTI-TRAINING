module tg_mux_2x1 (
    input I0,
    input I1,
    input S,
    output OUT
);

    wire Sbar;

    not (Sbar, S);

    tranif0 TG0 (OUT, I0, S);
    tranif1 TG1 (OUT, I1, S);

endmodule
