module testbench();

timeunit 10ns;    // Half clock cycle at 50 MHz
                // This is the amount of time represented by #1

timeprecision 1ns;


logic Clk = 0;
logic Execute, Reset_ClearA_LoadB;
logic [7:0] S;
logic [7:0] Aval, Bval;
logic [9:0] LED;
logic [6:0] HEX0, HEX1, HEX2, HEX3;

logic [16:0] XAB;
assign XAB = {top.X, Aval, Bval};


Processor top(.*);


initial begin
    Clk = 0;
end

always #1 Clk = ~Clk;


initial begin
    Reset_ClearA_LoadB = 0;
    Execute = 1;
    S = 8'hC5; 

    #2

    Reset_ClearA_LoadB = 1;

    #2


    S = 8'h7; 
    Execute = 0;




    // #4 S = 8'b00000111;

    // #2 Reset_ClearA_LoadB = 0; 
    // #2 Reset_ClearA_LoadB = 1;

    // #4 S = 8'b11000101; 

    // #2 Execute = 0;

    // #4 Execute = 1;



    // #4 S = 8'b11111001;

    // #2 Reset_ClearA_LoadB = 0; 
    // #2 Reset_ClearA_LoadB = 1;

    // #4 S = 8'b00111011;

    // #2 Execute = 0;

    // #4 Execute = 1;



    // #4 S = 8'b11111001; 

    // #2 Reset_ClearA_LoadB = 0; 
    // #2 Reset_ClearA_LoadB = 1;

    // #4 S = 8'b11000101; 

    // #2 Execute = 0;

    // #4 Execute = 1;


    // #4 S = 8'b11111110; 

    // #2 Reset_ClearA_LoadB = 0; 
    // #2 Reset_ClearA_LoadB = 1;

    // #4 S = 8'b11111110;
    // #2 Execute = 0;
    // #4 Execute = 1;

    // #4 S = 8'b11111110;
    // #2 Execute = 0;
    // #4 Execute = 1;

    // #4 S = 8'b11111110;
    // #2 Execute = 0;
    // #4 Execute = 1;

    // #4 S = 8'b11111110;
    // #2 Execute = 0;
    // #4 Execute = 1;


end

endmodule