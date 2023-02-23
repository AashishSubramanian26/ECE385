module BusMux	(       input			    [3:0]   S,
						input			    [15:0]  MDR,
						input 				[15:0]  ALU,
                        input			    [15:0]  PC,
						input 			    [15:0]  MARMUX,
						output logic	    [15:0]  BUS);
						
		//Tristate buffers implemented as a mux using case statement
		always_comb 
		begin
				unique case(S)
						4'b1000	:	BUS <= MDR; //GateMDR
						4'b0100	:   BUS <= ALU; //GateALU
                        4'b0010	:	BUS <= PC; //GatePC
						4'b0001	:	BUS <= MARMUX; //GateMARMux
                default:
                        BUS <= 16'hxxxx; //Default Case 
				endcase
		end 
		
		
endmodule