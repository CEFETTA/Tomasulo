module UnidadeFuncional(clock, instruction, instructIn, done, dout, reg1, reg2);
input [15:0]instruction;
input instructIn, clock;
input [15:0] reg1, reg2;
output reg done;
output reg [15:0]dout;

always @(posedge clock)
begin
	if(instructIn == 1)
	begin
		case(instruction[3:0])
		4'b0000: dout <= reg1 + reg2;
		4'b0001: dout <= reg1 - reg2;
		//complete
		endcase
	end
end

endmodule