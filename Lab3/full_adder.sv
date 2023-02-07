module full_adder
(
	input logic [15:0] x, y,
	input logic 		z,
	output logic [15:0] s,
	output logic 		cout
);

    assign s = A ^ B ^ cin; 
    assign cout = (A&B)|(A&cin)|(B&cin); 
     

endmodule   
