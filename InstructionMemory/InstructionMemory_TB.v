`timescale 1ns/100ps
module InstructionMemory_TB();
	//Input and Outputs
		reg clk;
		reg [9:0] address;
		reg [31:0] data;
		reg we;
		wire [31:0] dataA;
	
	
	// module InstructionMemory(dados,clk,address,we);
	 InstructionMemory DUT(dataA,clk,address,we);
	 //
	 
	integer l, k;
	
	// Aplicando os estimulos
	initial begin
		clk = 0;
		we = 1; //escrita
		for (l=0; l<=7; l=l+1) begin
			#50 data = l;
			address = l;
		end
		#50 we = 0; //leitura
		data = 8'bz;
		for (k=0; k<=7; k=k+1) begin
			#50 address = k;
		end
	end
	
	always #10 clk = ~clk;
	
	assign dataA = data;
	
	initial #900 $stop;
endmodule 