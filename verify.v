module verify(clock, Qj , Qk, verifyWire);
input clock;
input [7:0]Qj[2:0];
input [7:0]Qk[2:0]; //operando fonte, 0= já disponível
output [2:0]verifyWire;

integer i;

	always@(posedge clock)
	begin
		for(i=7; i>=0; i=i-1) begin
		
		if(Qj[i]== 3'b000 && Qk[i]== 3'b000) begin
			verifyWire = i;
			break;
		end

		end

	end

endmodule