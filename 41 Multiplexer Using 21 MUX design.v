module mux2to1 (
    input A,
    input B,
    input S,
    output Y
);
    assign Y = S ? B : A;
endmodule

module mux4to1 (
    input A,
    input B,
    input C,
    input D,
    input S1,
    input S0,
    output Y
);
    wire W0, W1;
    mux2to1 M0 (
        .A(A),
        .B(B),
        .S(S0),
        .Y(W0)
    );
    mux2to1 M1 (
        .A(C),
        .B(D),
        .S(S0),
        .Y(W1)
    );
    mux2to1 M2 (
        .A(W0),
        .B(W1),
        .S(S1),
        .Y(Y)
    );
endmodule