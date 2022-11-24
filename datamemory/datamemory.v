module datamemory(dout,din,clk,WR_RD,cs,ADDR);

//Sizes//
	parameter data_WIDTH = 32;
	parameter addr_WIDTH = 10;
//	
//Outputs//
	output reg[data_WIDTH-1:0] dout;
//
//Inputs//
	input clk,WR_RD,cs;
	input[addr_WIDTH-1:0] ADDR;
	input[data_WIDTH-1:0] din;
//
//Internal//
	reg[data_WIDTH-1:0] mem [0:(1<<addr_WIDTH)-1];
//
//Code//
	always @(posedge clk)begin
		if(cs) begin
			if(~WR_RD)begin//Escrita
				mem[ADDR] <= din;
			end
			else begin//Leitura
				dout <= mem[ADDR];
			end
		end
		else begin
			dout <= 32'bz;
		end
	end
//
endmodule	
