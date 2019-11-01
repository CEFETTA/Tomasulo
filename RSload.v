module RSload(clock, instruction, instructionIn, registerStatus, done, din, dinAddress, valueIn, requestRegister, requestAddress, requestEnable, R1, R2, R3, R4, R5, R6, R7);
input [15:0]R1, R2, R3, R4, R5, R6, R7;
input clock, done;
input [15:0]intruction;
reg[3:0]loadOP[15:0];
reg[3:0]Qj[2:0];
reg[3:0]Busy;
integer i;

output reg [2:0]requestRegister;
output reg [15:0]requestAddress;
output reg requestEnable;

always@(posedge clock)
begin
  if(instructionIn == 1)
  begin
    for(i = 1; i < 4; i = i + 1)begin
      if(Busy[i]==0)
      begin
        loadOP[i]=intruction;
        Qj[i] = registerStatus[instruction[9:7]];
        break;
      end
    end
  end
  
  for(i = 1; i < 4; i = i = 1)begin
    if(Qj[i] == 0)
    begin
      requestRegister = loadOP[i][6:4];
      if(loadOP[i][9:7]==3'b001)
        requestAddress = R1;
      
    end
  end
  
end

endmodule