module UnidadeFuncional(clock, instruction, instructIn, instructionCodeIn, instructionCodeOut, done, dout, reg1, reg2);
input [2:0]instructionCodeIn;
output reg[2:0]instructionCodeOut;
input [15:0]instruction;
input instructIn, clock;
input [15:0] reg1, reg2;
output reg done;
output reg [15:0]dout;

always @(posedge clock)
begin
  done=0;	
	
	if(instructIn == 1)
	begin
		instructionCodeOut = instructionCodeIn;
		case(instruction[3:0])
		4'b0000: dout <= reg1 + reg2;
		4'b0001: dout <= reg1 - reg2;
		//complete
		endcase
		done = 1'b1;
	end
	
end

endmodule