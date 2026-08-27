module half_sub (
    input A,
    input B,
    output Dif,
    output Bor
);
    xor (Dif, A, B);
    and (Bor, ~A, B);

endmodule