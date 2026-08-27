`timescale 1ns/1ps

module mux8to1(
    input [7:0] I,
    input [2:0] S,
    output Y
);

    assign Y = S[2] ?
               (S[1] ?
                    (S[0] ? I[7] : I[6]) :
                    (S[0] ? I[5] : I[4])) :
               (S[1] ?
                    (S[0] ? I[3] : I[2]) :
                    (S[0] ? I[1] : I[0]));

endmodule