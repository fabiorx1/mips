module MIPS(d,clk);
	input d, clk;
	wire q1,q2,q3;
	Control c1(clk,d,q1);
	Control c2(clk,q1,q2);
	Control c3(clk,q2,q3);
endmodule
