module 3InputMux	(	input				S,
						input				[15:0] BUS,
                        input               [15:0] ALU,
						input 				[15:0] PCPLUS1,
						output logic		[15:0] PCMUXOUT);
						
		// 17 bit parallel multiplexer implemented using case statement
		always_comb
		begin
				unique case(S)
						1'b00	:	PCMUXOUT <= BUS; 
						1'b01	:	PCMUXOUT <= ALU;
                        1'b10   :   PCMUXOUT <= PCPLUS1
				endcase
		end
		
		
endmodule