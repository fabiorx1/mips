`timescale 1ns/100ps
module datamemory_TB();

//Sizes//
	parameter data_WIDTH = 32;
	parameter addr_WIDTH = 10;
//
//Inputs//
	reg cs,we,clk;
	reg[addr_WIDTH-1:0] address;
	reg[data_WIDTH-1:0] dataIn;
//
//Outputs//
	wire[data_WIDTH-1:0] dataOut;
//
	integer k = 0;
	
//module datamemory(dout,din,clk,WR_RD,cs,ADDR);
	datamemory DUT(dataOut,dataIn,clk,we,cs,address);
//

	initial begin
		clk = 0;
		cs = 0;
		we = 0;
		address = 8'b0;
		dataIn = 8'b0;
		#200 cs = 1;
		we = 0;
		for (k=0; k < 10; k = k + 1) begin
			#140 address = k;
			dataIn = k;
		end
		we = 1;
		for (k=0; k < 10; k = k + 1) begin
			#140 address = k;
		end
		cs = 0;
	end
	
	always #50 clk =~clk;//Esse clock ta dando problema, simulem pra ver
	initial #6000 $stop;
	
endmodule 