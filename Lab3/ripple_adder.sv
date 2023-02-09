module ripple_adder
(
	input  [15:0] A, B,
    input cin, 
	output logic [15:0] S,
	output logic cout
);
    logic C0, C1, C2;

    four_bit_ra FRA0(.x(A[3 : 0]), .y(B[3 : 0]), .cin(cin), .s(S[3 : 0]), .cout(C0));
    four_bit_ra FRA1(.x(A[7 : 4]), .y(B[7 : 4]), .cin(C0), .s(S[7 : 4]), .cout(C1));
    four_bit_ra FRA2(.x(A[11 : 8]), .y(B[11 : 8]), .cin(C1), .s(S[11 : 8]), .cout(C2));
    four_bit_ra FRA3(.x(A[15 : 12]), .y(B[15 : 12]), .cin(C2), .s(S[15 : 12]), .cout(cout));

endmodule


module four_bit_ra
(
    input [3:0] x,
    input [3:0] y, 
    input cin, 
    output logic [3:0] s,
    output logic cout
);

    logic c0, c1, c2; //the coutsd before the actual cout
    full_adder fa0(.x(x[0]), .y(y[0]), .cin(cin), .s(s[0]), .cout(c0));
    full_adder fa1(.x(x[1]), .y(y[1]), .cin(cin), .s(s[1]), .cout(c1));
    full_adder fa2(.x(x[2]), .y(y[2]), .cin(cin), .s(s[2]), .cout(c2));
    full_adder fa3(.x(x[3]), .y(y[3]), .cin(cin), .s(s[3]), .cout(cout));
endmodule



module full_adder(
                    input x,
                    input y, 
                    input cin, 
                    output logic s,
                    output logic cout
                    );

    assign s    = x ^ y ^ cin;
    assign cout = (x & y) | (y & cin) | (cin & x);

endmodule