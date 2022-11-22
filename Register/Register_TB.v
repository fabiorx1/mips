`timescale 1ns/100ps
module Register_TB();

	reg[31:0] Entrada;
	reg Clk, En, Rst;
	wire[31:0] Saida;
	
	//module Register(Saida,Entrada,Clk,En,Rst);
		Register DUT(Saida,Entrada,Clk,En,Rst);
	//
	
	always begin 
		#100 Clk = ~Clk;//Frequencia do clock pode mudar de acordo com FPGA
	end
	
	initial begin
		//Inicial
		Clk = 0;
		En = 0;
		Rst = 0;
		Entrada = 32'd0;
		
		//Reset
		#50 Rst = 1;
		#150 Rst = 0;
		
		//Dados
		Entrada = 32'd15;
		En = 1;
		#500 En = 0;
		Entrada = 32'd20;
		#300 $stop;
	end
endmodule 