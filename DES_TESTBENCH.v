`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2025 04:55:24 PM
// Design Name: 
// Module Name: DES_TESTBENCH
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
/*
DES_ALGORITHM(
        Plaintext,   //                      DU LIEU CAN MA HOA 
        Key_in,
        Clk,//                               XUNG CLOCK 
        Clk_machine,
        Reset,//                        
        Cirphertext);
       input [63:0] Plaintext; 
      input [63:0] Key_in; 
      input Clk, Clk_machine, Reset;
      output [63:0] Cirphertext;
      */ 

module DES_TESTBENCH();
     reg [63:0]  Plaintext;
     reg [63:0] Key_in;
     reg Clk, Clk_machine, Reset;
	  //Start;
     wire [63:0] Cirphertext;
     wire [31:0]Ln, R_n; 
     wire [4:0] Counter_machine,Counter_cycle; 
     wire Done; 
	  
	  parameter delay_between_clock = 5;  // do tre giua hai tin hieu clock machine va clock 
	  parameter delay_cycle = 10;         // chu ki xung clock 
	  parameter first_test = 16 *delay_cycle *2;          /// test_case dau tien 
	  parameter second_test = 17* delay_cycle *2;         // cac test case tiep theo 
	  
     DES_ALGORITHM des(
        .Plaintext(Plaintext),   //                      DU LIEU CAN MA HOA 
        .Key_in(Key_in),
        .Clk(Clk),//                               XUNG CLOCK 
        .Clk_machine(Clk_machine),
        .Reset(Reset),
		  //.Start(Start),// 
        .Ln(Ln),
        .R_n(R_n),   
        .Counter_machine(Counter_machine),
        .Counter_cycle(Counter_cycle),		  
        .Cirphertext(Cirphertext),
        .Done(Done));
        
       initial begin
        Clk = 0; 
        #delay_between_clock; 
        forever #delay_cycle Clk = ~Clk; 
       end 
       initial begin
        Clk_machine = 0; 
        forever #delay_cycle Clk_machine = ~Clk_machine; 
       end 
       initial begin
		   // Start  =1'b1; 
          Reset = 1'b1; 
           Plaintext =  64'h00123456789abcde; 
           Key_in    = 64'h0133457799bbcdff; 
          #13;  
          Reset = 1'b0;
			 
			#first_test; 
			  Plaintext = 64'h01334577789abcde; 
           Key_in    = 64'h0012345699bbcdff;
			  
			#second_test; 
	        Plaintext =  64'h789abcde00123456; 
           Key_in    =  64'h0133457799bbcdff; 
			
			#second_test; 
	       Plaintext =  64'h0012345699bbcdff; 
          Key_in    =  64'h01334577789abcde; 
			 
			#second_test; 
	       Plaintext =  64'h99bbcdff789abcde; 
          Key_in    =  64'h01334577789abcde; 

			#second_test; 
	        Plaintext =  64'h0133457799bbcdff; 
           Key_in    =  64'h789abcde00123456;
			
			#second_test; 
	       Plaintext =  64'h01334577789abcde; 
          Key_in    =  64'h0012345699bbcdff;  
			 
			#second_test; 
	       Plaintext =  64'h01334577789abcde; 
          Key_in    =  64'h99bbcdff789abcde;  			 
			 
			#second_test; 
		    Plaintext =  64'h0133457799bbcdff; 
          Key_in    =  64'h00123456789abcde; 	
       end 
     
endmodule
