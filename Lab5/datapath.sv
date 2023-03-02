module datapath (
					input logic  LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED, Clk, Reset, Run, Continue,
                    input logic  GatePC, GateMDR, GateALU, GateMARMUX,
                    input logic  SR1MUX, SR2MUX, ADDR1MUX, MARMUX, MIO_EN, DRMUX,
                    input logic  [1:0] PCMUX, ADDR2MUX, ALUK,
                    input logic  [15:0] MDR_In,
					output logic [15:0] MAR, MDR, IR, PC, //outputs
					output logic [9:0] LED,
					output logic BEN
				);
				
	logic 	[15:0] 	BUS,
					IR_Reg_Out,
					MDR_Reg_Out,
					MAR_Reg_Out, 
					PC_Reg_Out, 
					MDR_MUX,
					PCMUX_Out, 
					BEN_Reg_Out,
					SR1OUT,
					SR2OUT,
					SR2MUX_OUT,
					ALU_MOD_OUT, 
					SR1MUX_OUT, 
					DRMUX_OUT, 
					ADDR1MUX_OUT, 
					ADDR2MUX_OUT;

	BusMux Tri_State_Buff(
					.S({GateMDR, GateALU, GatePC, GateMARMUX}), 
					.MARMUX(ADDR1MUX_OUT + ADDR2MUX_OUT), 
					.PC(PC_Reg_Out), 
					.ALU(ALU_MOD_OUT), 
					.MDR(MDR_Reg_Out), 
					.BUS(BUS)
					);

	Reg_16  MDR_Reg(
				.Clk(Clk),
				.Reset(Reset), 
				.Load(LD_MDR), 
				.D(MDR_MUX), 
				.Out(MDR_Reg_Out)
				);

	Reg_16  IR_Reg(
				.Clk(Clk),
				.Reset(Reset),	 
				.Load(LD_IR), 
				.D(BUS), 
				.Out(IR_Reg_Out)
				);

	BEN_MOD  ben(
				.D(BUS),
				.LD_CC(LD_CC), .LD_BEN(LD_BEN), .Clk(Clk), .Reset(Reset),
				.IR_Input(IR_Reg_Out[11:9]),
				.Out(BEN_Reg_Out)
				);


	Reg_16  PC_Reg(
				.Clk(Clk),
				.Reset(Reset),	 
				.Load(LD_PC), 
				.D(PCMUX_Out), 
				.Out(PC_Reg_Out)
				);

	Reg_16  MAR_Reg(
				.Clk(Clk),
				.Reset(Reset),	 
				.Load(LD_MAR), 
				.D(BUS), 
				.Out(MAR_Reg_Out)
				);

	TwoInputMux MDRMult (
				.S(MIO_EN), 
				.D1(BUS), 
				.D2(MDR_In), 
				.Out_Mux(MDR_MUX)
				);
	
	
	ThreeInputMux PCMult(
					.S(PCMUX), 
					.D3(BUS), 
					.D1(PC_Reg_Out + 1'b1), 
					.D2(ADDR1MUX_OUT + ADDR2MUX_OUT),
					.OUT(PCMUX_Out)
					);

	ALU_MOD Arithmetic(
					.A(SR1OUT),
					.B(SR2MUX_OUT),
					.ALUK(ALUK),
					.ALUOut(ALU_MOD_OUT)
					);

	REGFILE Register_File(
					.Clk(Clk), 
					.LD_REG(LD_REG), 
					.Reset(Reset),
					.BUS(BUS), 
					.DR(DRMUX_OUT), 
					.SR1(SR1MUX_OUT), 
					.SR2(IR_Reg_Out[2:0]),
					.SR1OUT(SR1OUT), 
					.SR2OUT(SR2OUT)
				);

	TwoInputMux #(3) SR1_Mult(
		.S(SR1MUX), 
		.D1(IR_Reg_Out[8:6]), 
		.D2(IR_Reg_Out[11:9]), 
		.Out_Mux(SR1MUX_OUT)
	);

	TwoInputMux #(3) DR_Mult(
		.S(DRMUX), 
		.D1(IR_Reg_Out[11:9]), 
		.D2(3'b111), 
		.Out_Mux(DRMUX_OUT)
	);

	TwoInputMux SR2_Mult(
		.S(SR2MUX), 
		.D1(SR2OUT), 
		.D2({{11{IR_Reg_Out[4]}}, IR_Reg_Out[4:0]}), 
		.Out_Mux(SR2MUX_OUT)
	);

	TwoInputMux ADDR1_Mult(
		.S(ADDR1MUX),
		.D1(SR1OUT), 
		.D2(PC_Reg_Out), 
		.Out_Mux(ADDR1MUX_OUT)
	);

	FourInputMux ADDR2_Mult(
		.S(ADDR2MUX), 
		.D1(16'h0000), 
		.D2({{10{IR_Reg_Out[5]}}, IR_Reg_Out[5:0]}),
		.D3({{7{IR_Reg_Out[8]}}, IR_Reg_Out[8:0]}),
		.D4({{5{IR_Reg_Out[5]}}, IR_Reg_Out[10:0]}),
		.OUT(ADDR2MUX_OUT)
	);

	always_comb begin
		MDR = MDR_Reg_Out;
		MAR = MAR_Reg_Out;
		IR  = IR_Reg_Out;
		BEN = BEN_Reg_Out; 
		PC  = PC_Reg_Out;
	end 

	always_ff @ (posedge Clk) begin
		if (LD_LED)
			LED <= IR[9:0];
		else
			LED <= 10'b0;
	end

endmodule 