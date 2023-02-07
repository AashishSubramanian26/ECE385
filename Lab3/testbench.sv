module testbench();

timeunit 10ns;

timeprecision 1ns;

input logic Clk; 
input logic Reset;
input logic LoadB;
input logic Run;
input logic[15:0] SW;

//all outputs are registered
output logic CO;
output logic[15:0] Sum;
output logic[6:0] Ahex0;
output logic[6:0] Ahex1;
output logic[6:0] Ahex2;
output logic[6:0] Ahex3;
output logic[6:0] Bhex0;
output logic[6:0] Bhex1;
output logic[6:0] Bhex2;
output logic[6:0] Bhex3;

always begin : CLOCK_GENERATION

#1 Clk = ~Clk; //Starts the clock

end

initial begin
    Clk = 0;
end



endmodule