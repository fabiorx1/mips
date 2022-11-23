//Contador de Programa
module pc(Address,Clk,Rst);

	output reg[9:0] Address;
	input Clk, Rst;
	
	always @(posedge Clk or posedge Rst)begin //Trocar o reset com base na FPGA
		if(Rst)begin
			Address <= 10'd0;
		end
		else begin
			Address <= Address + 1'b1;
		end
	end
	
endmodule	
//
