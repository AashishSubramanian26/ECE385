module 2InputMux	(	input				S,
						input				[15:0] BUS,
						input 				[15:0] Data_to_CPU,
						output logic		[15:0] MDR);
						
		// 17 bit parallel multiplexer implemented using case statement
		always_comb
		begin
				unique case(S)
						1'b0	:	MDR <= BUS; //BUS
						1'b1	:	MDR <= Data_to_CPU; //Data_to_CPU
				endcase
		end
		
		
endmodule