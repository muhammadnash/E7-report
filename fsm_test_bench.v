module test_bench();
	wire y;
	reg clk,jump,go,reset;

	FSM machine0(y, go ,jump ,clk, reset);
	
	//clock generation
	always
		#5 clk=~clk;
		
	// intialize simulation
	initial 
		begin 
			reset=1;
			jump=0;
			go=0;
			clk=0;
			
			
			#15 @(posedge clk)
			begin 	
				reset=0;
				jump=0;	 // to state	1
				go=1;	
			end 
			
			#5 @(posedge clk)
			begin 
				jump=1; // to state	3
			end 
			
			#5 @(posedge clk)
			begin 
				jump=0; //to state 4
			end
			
			#5 @(posedge clk)
			begin 
				jump=0;
				go=1;
			end 
		end
endmodule
