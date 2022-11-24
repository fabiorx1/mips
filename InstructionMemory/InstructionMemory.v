module InstructionMemory(dados,clk,address,we);
	
//---------Sizes-----------------
	parameter data_WIDTH = 32;
	parameter addr_WIDTH = 10;

//---------Input-----------------
	input clk, we;
	input[addr_WIDTH-1:0] address;
	
//---------Inout-----------------
	inout[data_WIDTH-1:0] dados;

//---------Interno---------------
	reg[data_WIDTH-1:0] mem[0:(1<<addr_WIDTH)-1];
	reg [data_WIDTH-1:0] data_out;
	
//---------Escrita ou Leitura----------------
	always @(posedge clk)begin
		if(we)begin
			mem[address] <= dados;//Escrita
		end
		else begin
			data_out <= mem[address];//Leituta
		end
	end
	//assign dados = data_out;
	assign dados = (!we) ? data_out : 8'bz;
endmodule	
