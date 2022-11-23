`timescale 1ns/100ps 
module pc_TB();

	wire[9:0] Address;
	
	reg clk, rst;
	
	//module pc(Address,Clk,Rst);
		pc DUT(Address,clk,rst);
	//
	
	always begin
		#100 clk = ~clk;
	end
	
	initial begin
		clk = 0;
		rst = 0;
		#50 rst = 1;
		#150 rst = 0;
		
		#220000 $stop;
	end
endmodule	