module testbench();

timeunit 10ns;

timeprecision 1ns;

logic Clk; 
logic Reset;
logic LoadB;
logic Run;
logic[15:0] SW;

//all outputs are registered
logic CO;
logic[15:0] Sum;
logic[6:0] Ahex0;
logic[6:0] Ahex1;
logic[6:0] Ahex2;
logic[6:0] Ahex3;
logic[6:0] Bhex0;
logic[6:0] Bhex1;
logic[6:0] Bhex2;
logic[6:0] Bhex3;

always begin : CLOCK_GENERATION

#1 Clk = ~Clk; //Starts the clock

end

initial begin
    Clk = 0;
end

initial begin: TEST_VECTORS:

Reset = 0;
LoadB = 1;
Run = 1;

//test case 1
#2 Reset = 1; //After 2 time limit delay

#2 LoadB = 0;
    SW = 16'h0001;

#2 LoadB = 1;
    SW = 16'h0002;

#2 Run = 0; //Starts running

#22 ;
end


endmodule