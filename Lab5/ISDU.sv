//------------------------------------------------------------------------------
// Company:          UIUC ECE Dept.
// Engineer:         Stephen Kempf
//
// Create Date:    17:44:03 10/08/06
// Design Name:    ECE 385 Lab 6 Given Code - Incomplete ISDU
// Module Name:    ISDU - Behavioral
//
// Comments:
//    Revised 03-22-2007
//    Spring 2007 Distribution
//    Revised 07-26-2013
//    Spring 2015 Distribution
//    Revised 02-13-2017
//    Spring 2017 Distribution
//------------------------------------------------------------------------------


module ISDU (   input logic         Clk, Reset, Run, Continue,
				input logic[3:0]    Opcode, 
				input logic         IR_5, IR_11, BEN,

				output logic        LD_MAR, LD_MDR, LD_IR, LD_BEN,
									LD_CC, LD_REG, LD_PC, LD_LED, 
									
				output logic        GatePC, GateMDR, GateALU, GateMARMUX, DRMUX, ADDR1MUX, SR1MUX, SR2MUX,
									
				output logic [1:0]  PCMUX, ADDR2MUX, ALUK,
				  
				output logic        Mem_CE, Mem_UB, Mem_LB, Mem_OE, Mem_WE
				);

	enum logic [4:0] {  Halted, PauseIR1, PauseIR2, S_18, S_33_1, S_33_2, S_33_3, S_35, S_32, S_1, S_5, S_9, S_06, S_25_1,
			S_25_2,S_25_3,S_27, S_07,S_23,S_16_1,S_16_2,S_16_3, S_04,S_21, S_12, S_00, S_22}   State, Next_State;   // Internal state logic
		
	always_ff @ (posedge Clk)
	begin
		if (Reset) 
			State <= Halted;
		else 
			State <= Next_State;
	end
   
	always_comb
	begin 
		// Default next state is staying at current state
		Next_State = State;
		
		// Default controls signal values
		{LD_MAR, LD_MDR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED} = 1'b0;
		 
		{GatePC, GateMDR, GateALU, GateMARMUX} = 1'b0;
		 
		ALUK = 2'b00;
		PCMUX = 2'b00;

		{DRMUX, SR1MUX, SR2MUX, ADDR1MUX} = 1'b0;
		ADDR2MUX = 2'b00;
		 
		Mem_OE = 1'b1;
		Mem_WE = 1'b1;
	
		// Assign next state
		unique case (State)
			Halted : 
				if (Run) 
					Next_State = S_18;                      
			S_18 : 
				Next_State = S_33_1;
			// Any states involving SRAM require more than one clock cycles.
			// The exact number will be discussed in lecture.
			S_33_1 : 
				Next_State = S_33_2;
			S_33_2 : 
				Next_State = S_33_3;
			S_33_3 : 
				Next_State = S_35;
			S_35 : 
				Next_State = S_32;
			// PauseIR1 and PauseIR2 are only for Week 1 such that TAs can see 
			// the values in IR.
			PauseIR1 : 
				if (~Continue) 
					Next_State = PauseIR1;
				else 
					Next_State = PauseIR2;
			PauseIR2 : 
				if (Continue) 
					Next_State = PauseIR2;
				else 
					Next_State = S_18;
			S_32 : 
				case (Opcode)
					4'b1101: //PSE
						Next_State = PauseIR1;
					4'b0001 : //ADD
						Next_State = S_1;
					4'b0101 : //AND
						Next_State = S_5;
					4'b1001 : //NOT
						Next_State = S_9; 
					4'b1100 : //JMP
						Next_State = S_12;
					4'b0100 : //JSR
						Next_State = S_04;
					4'b0000 : //BR
						Next_State = S_00;
					4'b0110 : //LDR
						Next_State = S_06;
					4'b0111: //STR
						Next_State = S_07;

					default : 
						Next_State = S_18;
				endcase
			//ADD
			S_1 : 
				Next_State = S_18;
			
			//AND
			S_5 :
				Next_State = S_18;

			//NOT
			S_9  :
				Next_State = S_18;

			//BR
			S_00 :
				if (BEN == 1'b1)
					Next_State = S_22;
				else 
					Next_State = S_18;
			S_22 :
				Next_State = S_18;

			S_12 :
				Next_State = S_18;

			//JSR
			S_04 :
				Next_State = S_21;

			S_21 :
				Next_State = S_18;

			//LDR
			S_06 :
				Next_State = S_25_1;

			S_25_1 :
				Next_State = S_25_2;

			S_25_2 :
				Next_State = S_25_3;

			S_25_3 :
				Next_State = S_27;

			S_27 :
				Next_State = S_18;

			//STR
			S_07 :
				Next_State = S_23;

			S_23 :
				Next_State = S_16_1;

			S_16_1 :
				Next_State = S_16_2;

			S_16_2 :
				Next_State = S_16_3;

			S_16_3 :
				Next_State = S_18;

			default : ;

		endcase
		
		// Assign control signals based on current state
		case (State)
			Halted: ; //Maybe delete
			S_18 : 
				begin 
					GatePC = 1'b1;
					LD_MAR = 1'b1;
					PCMUX = 2'b00;
					LD_PC = 1'b1;
				end
			S_33_1 : 
					Mem_OE = 1'b0;
			S_33_2 : 
				begin 
					Mem_OE = 1'b0;
					LD_MDR = 1'b1;
				end
			S_33_3 : 
				begin 
					Mem_OE = 1'b0;
					LD_MDR = 1'b1;
				end
			S_35 : 
				begin 
					GateMDR = 1'b1;
					LD_IR = 1'b1;
				end
			PauseIR1: 
				begin
					LD_LED = 1'b1;
				end
			PauseIR2: ;
			S_32 : 
				LD_BEN = 1'b1;
			S_1 : //ADD
				begin 
					SR2MUX = IR_5;
					SR1MUX = 1'b1;
					ALUK = 2'b00;
					GateALU = 1'b1;
					DRMUX = 1'b0;
					LD_REG = 1'b1;
					LD_CC = 1'b1;

				end
			S_5 : //AND
				begin
					SR2MUX = IR_5;
					SR1MUX = 1'b1;
					ALUK = 2'b01;
					GateALU = 1'b1;
					LD_REG = 1'b1;
					LD_CC = 1'b1;
					DRMUX = 1'b0;
				end
			S_9  : //NOT
				begin
					DRMUX = 1'b0;
					SR1MUX = 1'b1;
					SR2MUX = 1'b0;
					ALUK = 2'b10;
					GateALU = 1'b1;
					LD_CC = 1'b1;
					LD_REG = 1'b1;
				end
			S_06 : //LDR
				begin
					SR1MUX = 1'b1;
					ADDR2MUX = 2'b01;
					ADDR1MUX = 1'b1;
					GateMARMUX = 1'b1;
					LD_MAR = 1'b1;
				end
			S_25_1 : 
				begin
					Mem_OE = 1'b0;
					Mem_WE = 1'b1;
				end
			S_25_2 :
				begin
					Mem_OE = 1'b0;
					Mem_WE = 1'b1;
					LD_MDR = 1'b1;
				end
			S_25_3 :
				begin
					Mem_OE = 1'b0;
					Mem_WE = 1'b1;
					LD_MDR = 1'b1;
				end
			S_27 :
				begin
					GateMDR = 1'b1;
					DRMUX = 1'b0;
					LD_REG = 1'b1;
					LD_CC = 1'b1;
				end
			S_07 : //STR
				begin
					SR1MUX = 1'b1;
					ADDR2MUX = 2'b01;
					ADDR1MUX = 1'b1;
					GateMARMUX = 1'b1;
					LD_MAR = 1'b1;
				end
			S_23 :
				begin
					ALUK = 2'b11;
					GateALU = 1'b1;
					SR1MUX = 1'b0;
					LD_MDR = 1'b1;
				end
			S_16_1 :
				begin
					Mem_OE = 1'b1;
					Mem_WE = 1'b0;
				end
			S_16_2 :
				begin
					Mem_OE = 1'b1;
					Mem_WE = 1'b0;
				end
			S_16_3 :
				begin
					Mem_OE = 1'b1;
					Mem_WE = 1'b0;
				end	
			S_04 : // JSR
				begin
					GatePC = 1'b1;
					DRMUX = IR_11;
					LD_REG = 1'b1;
				end
			S_21 :
				begin
					ADDR2MUX = 2'b11;
					ADDR1MUX = 1'b0;
					PCMUX = 2'b10;
					LD_PC = 1'b1;
				end
			S_12 : //JMP
				begin
					SR1MUX = 1'b1;
					ADDR1MUX = 1'b1;
					ADDR2MUX = 2'b00;
					PCMUX = 2'b10;
					LD_PC = 1'b1;
				end
			S_22 :
				begin
					ADDR2MUX = 2'b10;
					ADDR1MUX = 1'b0;
					PCMUX = 2'b10;
					LD_PC = 1'b1;
				end

			default : ;
		endcase
	end 

	 // These should always be active
	assign Mem_CE = 1'b0;
	assign Mem_UB = 1'b0;
	assign Mem_LB = 1'b0;
	
endmodule