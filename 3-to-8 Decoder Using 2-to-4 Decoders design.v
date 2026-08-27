`timescale 1ns/1ps

module decoder2to4(
    input A,
    input B,
    input Enable,
    output [3:0] Y
);

    assign Y[0] = Enable & ~A & ~B;
    assign Y[1] = Enable & ~A & B;
    assign Y[2] = Enable & A & ~B;
    assign Y[3] = Enable & A & B;

endmodule


module decoder3to8(
    input [2:0] A,
    input Enable,
    output [7:0] Y
);

    wire [3:0] Y0;
    wire [3:0] Y1;

    decoder2to4 D0(
        .A(A[1]),
        .B(A[0]),
        .Enable(Enable & ~A[2]),
        .Y(Y0)
    );

    decoder2to4 D1(
        .A(A[1]),
        .B(A[0]),
        .Enable(Enable & A[2]),
        .Y(Y1)
    );

    assign Y[3:0] = Y0;
    assign Y[7:4] = Y1;

endmodule