module ADD_SUB9 ( input  [7:0] A, B,
         input        fn,
         output [8:0] S  );

    logic c0, c1, c2, c3, c4, c5, c6, c7; 
    logic cout;
    logic [7:0] BB;
    logic A8, BB8; 
    assign A8 = A[7]; 
    assign BB = (B^{8{Fn}});
    assign BB8 = BB[7]; //Droid Moment (Star Wars The Force Awakens Sucks (& Sequels Suck) But BB8 Ig)

    full_adder fa0(.x(A[0]), .y(BB[0]), .cin(fn), .s(S[0]), .cout(c0));
    full_adder fa1(.x(A[1]), .y(BB[1]), .cin(c0), .s(S[1]), .cout(c1));
    full_adder fa2(.x(A[2]), .y(BB[2]), .cin(c1), .s(S[2]), .cout(c2));
    full_adder fa3(.x(A[3]), .y(BB[3]), .cin(c2), .s(S[3]), .cout(c3));
    full_adder fa4(.x(A[4]), .y(BB[4]), .cin(c3), .s(S[4]), .cout(c4));
    full_adder fa5(.x(A[5]), .y(BB[5]), .cin(c4), .s(S[5]), .cout(c5));
    full_adder fa6(.x(A[6]), .y(BB[6]), .cin(c5), .s(S[6]), .cout(c6));
    full_adder fa7(.x(A[7]), .y(BB[7]), .cin(c6), .s(S[7]), .cout(c7));
    full_adder fa8(.x(A8), .y(BB8), .cin(c7), .s(S[8]), .cout(cout));

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