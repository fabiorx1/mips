//Registro Simples de 32 bits
module Register(Saida,Entrada,Clk,En,Rst);

	output reg[31:0] Saida;
	input[31:0] Entrada;
	input Clk, En, Rst;
	
	always @(posedge Clk or posedge Rst)begin//Talvez precise trocar o reset pra sincrono dependendo da FPGA escolhida
		if(Rst)begin
			Saida <= 32'd0;
		end
		else begin
			if(En)begin
				Saida <= Entrada;
			end
			else begin
				Saida <= Saida;
			end 
		end
	end

endmodule
//
