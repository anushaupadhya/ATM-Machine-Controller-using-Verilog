module test_v;

	wire [3:0]dout1;                 // THE 

AVAILABLE BALANCE
	wire signal;                     //SIGNAL 

INDICATING IF WRONG INPUTS ARE 3 

OR NOT  
	wire wd;                         

//WITHDRAW SIGNAL INDICATING IF 

THE AMOUNT WE WANT TO 

WITHDRAW IS NOT POSSIBLE 
	wire [3:0]dout;                  // 

FINAL BALANCE TO BE OUTPUT
	wire less ,greater,equal;        // TO 

COMPARE THE INPUT PIN WITH THE 

PREFED PIN

	reg [3:0]pin;                    // INPUT 

PIN GIVEN BY THE USER
	reg [3:0]amt;                    //INPUT 

AMOUNT TO BE DEPOSITED OR 

WITHDRAWED FROM MACHINE 
	reg [1:0]sel;                    //SELECT 

LINES FOR MUX TO SELECT 

WITHDRAWAL OR DEPOSIT OPTION
	reg [3:0]bal;                    

//BALANCE PRESENT IN THE MACHINE
	reg clk;                         //CLOCK
	reg [3:0]prefed;                 // THE 

PREFED PIN

 main uut

(bal,signal,wd,pin,sel,amt,clk,prefed,dout1,do

ut,less,greater,equal);

 initial begin
    
    $dumpfile("VerilogDM-131-207.vcd");        

        // FOR CREATION OF THE 

GTKWAVE
    //$dumpfile("VerilogBM-131-207.vcd");
    $dumpvars(0,test); 
 
	  clk = 0;                                     // 

INITIALIZATION OF THE VALUES
	  amt = 4'b0000;
	  bal = 4'b0000;
	  sel = 2'b00;
	  prefed = 4'b0110;
	 

	 
	 #2 pin = 4'b0110;
	 #2 pin = 4'b0011;
	 #2 pin = 4'b0110;
	 #2 pin = 4'b0011;
	 #2 pin = 4'b0110;
	 #2 pin = 4'b0110;
	 #2 pin = 4'b0011;
	 #2 pin = 4'b0110;

	 #2 amt = 4'b0000; 
	 #2 amt = 4'b0001;
	 #2 amt = 4'b0010;
	 #2 amt = 4'b0011;
	 #2 amt = 4'b0001;    
	 #2 amt = 4'b0001; 
	 #2 amt = 4'b0011;
	 #2 amt = 4'b0001;
	 #2 amt = 4'b0001;
	 #2 amt = 4'b0001;    
	 
	 #2 sel = 2'b00;
	 #2 sel = 2'b00;
	 #2 sel = 2'b01;
	 #2 sel = 2'b00;
	 #2 sel = 2'b01;
	 #2 sel = 2'b00;
	 #2 sel = 2'b01;
	 #2 sel = 2'b00;
	 #2 sel = 2'b00; 
	  
	 #2 bal = 4'b0000;
	 #2 bal = 4'b0000;
	 #2 bal = 4'b0001;
	 #2 bal = 4'b0011;
	 #2 bal = 4'b0110;
	 #2 bal = 4'b0111;
	 #2 bal = 4'b1000;
	 #2 bal = 4'b1011;
	 #2 bal = 4'b1100;
	 #2 bal = 4'b1101;    
	   
	 
end
 


always  #1 clk = ~clk;                        

//CLOCK PULSE IS CHANGED EVERY 

ONE SECOND
 

 
initial #100 $finish;                         //THE 

PROCESS TERMINATES AFTER 100 

SECONDS
   
initial begin                                 // OUTPUT 

MESSAGE 

                            
    $monitor("time = %d clk = %b pin = %b 

prefed = %b amt = %b sel = %b  bal = %b 

signal = %b wd = %d ",

$time,clk,pin,prefed,amt,sel,dout1,signal,wd);


end
endmodule
