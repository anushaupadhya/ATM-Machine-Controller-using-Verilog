module main

(bal,signal,wd,pin,sel,amt,clk,prefed,dout1,do

ut,less,greater,equal);

	input [3:0]pin;       //INPUT PIN 

BY USER
	input [1:0]sel;       //SELECT 

LINES FOR MUX TO SELECT 

WITHDRAWAL OR DEPOSIT OPTION
	input [3:0]amt;       //INPUT 

AMOUNT TO BE DEPOSITED OR 

WITHDRAWED FROM MACHINE 
	input clk;            //CLOCK
	input [3:0]prefed;    //PREFED 

PIN WILL BE GIVEN IN TESTBENCH
	input [3:0]bal;       //BALANCE 

PRESENT IN THE MACHINE
	output signal;        //SIGNAL 

INDICATING IF WRONG INPUTS ARE 3 

OR NOT  
	output wd;            //WITHDRAW 

SIGNAL INDICATING IF THE AMOUNT 

WE WANT TO WITHDRAW IS NOT 

POSSIBLE 
	output [3:0]dout;     // FINAL 

BALANCE TO BE OUTPUTTED
	output [3:0]dout1;
	output less;          // REGISTER 

VALUE TO CHECK IF THE ENTERED 

INPUT PIN IS WRONG AND 

INCREMENT THE COUNT IF ITS 

WRONG
	output greater;
	output equal;
	reg signal; 
	reg less;  
	reg greater;
	reg equal;
	       
	reg wd;
	reg [3:0]dout1;
	reg [3:0]dout;
	wire [3:0]pin;
	wire [3:0]bal;
	wire [3:0]amt;
	wire [1:0]sel;
	wire clk;
	wire [3:0]prefed;
always @(posedge clk)
	begin
         if( pin < prefed || pin > prefed )                

         // CHECKING IF PIN IS NOT EQUAL 

TO PREFED
		    begin
			  dout = 

4'b0000 + 4'b0001 ;                

//INCREMENTING THE COUNT IF IT IS 

NOT EQUAL 
		          if(dout < 4'b0011 

|| dout == 4'b0011)     // CHECKING IF THE 

COUNT IS 3 
			         begin
				  

    signal = 1'b1;                // ASSIGNING 

THE SIGNAL VALUE 1 IF COUNT IS NOT 

3
			         end
		          else
				  

begin
				  

    signal = 1'b0;                // ASSIGNING 

THE SIGNAL VALUE 0 IF COUNT IS 

MORE THAN 3
				  

end
		    end
	 else if(pin == prefed)                      

               // CHECKING IF PIN IS EQUAL 

TO PREFED
	      begin
	       if(sel == 2'b00)              // 

CHECKING IF THE SELECT LINE FOR 

MUX IS DEPOSIT OR WITHDRAW 

WHERE 00 IS FOR DEPOSIT 
		       begin  
		       dout1 = amt + bal;  

                         // FINAL BALANCE AFTER 

DEPOSIT   
		       end 
	       else if (sel == 2'b01)                 

              // SELECT 01 IS FOR WITHDRAW 

OPTION
			 begin
			 if( dout1 

>= amt)  // CHECKING IF THE AMOUNT 

TO BE WITHDRAWN IS GREATER THAN 

PRESENT ALREADY IN THE MACHINE
				 

begin
				 

dout1 = amt - bal;                 // FINAL 

BALANCE AFTER WITHDRAW
				 

wd = 1'b0;                         // ASSIGNING 

WITHDRAW SIGNAL AS 0 IF 

WITHDRAW IS POSSIBLE   
				 

end
			 else if 

(dout1 < amt)
				 

begin
				 

wd = 1'b1;                         // ASSIGNING 

WITHDRAW SIGNAL AS 1 IF 

WITHDRAW IS NOT POSSIBLE
				 

end
			end
		end
	     
	 end
endmodule
