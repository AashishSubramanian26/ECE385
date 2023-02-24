module testbench(); 

timeunit 10ns; 

timeprecision 1ns; 

logic Clk = 0; 
logic Run, Continue; 
logic [9:0] SW; 
logic [9:0] LED;
logic [6:0] HEX0, HEX1, HEX2, HEX3;
logic [15:0] PC;
logic [15:0] IR;



slc3_testtop slc3_1(.*);
assign PC = slc3_1.slc.d0.PC_Reg_Out; 
assign IR =  slc3_1.slc.IR; 
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 


initial begin: TEST_VECTORS
Run = 1;
Continue = 1;

#4 //Makes reset high 
Run = 0;
Continue = 0;

//Reset is no longer high 
#2 Run = 1;
 Continue = 1;

#2 Run = 0;
#2 Run = 1; 

#2 Continue = 0;

#2 Continue = 1;

#2 Continue = 0;

#2 Continue = 1;

#2 Continue = 0;

#2 Continue = 1;

#2 Continue = 1;

#2 Continue = 0;

#10 Continue = 1;

#2 Continue = 1;

#2 Continue = 0;

#2 Continue = 1;

#8 Continue = 1;

#2 Continue = 0;

#2 Continue = 1;

#2 Continue = 1;

#2 Continue = 0;

#2 Continue = 1;

#2 Continue = 1;

#2 Continue = 0;

#2 Continue = 1;

#2 Continue = 1;

#2 Continue = 0;

#5 Continue = 1;

#2 Continue = 1;

#2 Continue = 0;

#2 Continue = 1;

#2 Continue = 1;

#2 Continue = 0;

#2 Continue = 1;

#2 Continue = 1;

#2 Continue = 0;

#2 Continue = 1;

// #2 Continue = 1;
// #2 Continue = 0;


end
endmodule 