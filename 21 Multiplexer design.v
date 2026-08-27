module mux2to1 (
    input a,
    input b,
    input c,
    output d
);
    assign d = c ? b : a;
endmodule