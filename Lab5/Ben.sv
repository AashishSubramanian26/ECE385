module BEN(
			input logic [15:0] D,
			input logic LD_CC, LD_BEN, Clk, Reset,
			input logic [2:0] IR_Input,
			output logic Out
			);
	logic N, Z, P, N_nxt, Z_nxt, P_nxt;

	always_ff @ (posedge Clk) begin
		if(Reset)
			Out <= 1'b0;
		else if(LD_BEN)
			Out <= ((IR_Input & {N_nxt, Z_nxt, P_nxt}) != 3'b000);

		if(LD_CC) 
            begin
                N_nxt <= N;
                Z_nxt <= Z;
                P_nxt <= P;
            end
	end 
	
	
	always_comb begin
		if(D == 16'h0000) 
            begin
                N = 0;
                Z = 1;
                P = 0;
            end
		else if(D[15] == 1'b1) 
            begin
                N = 1;
                Z = 0;
                P = 0;
            end
		else if(D[15] == 1'b0) 
			begin
                N = 0;
                Z = 0;
                P = 1;
            end
		else //*************ask TA about this *********************
			begin
                N = 1'bZ;
                Z = 1'bZ;
                P = 1'bZ;
            end
	end 
endmodule 