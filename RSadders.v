module RSadders(instruction, Clock, Adderin, Busy);
  output reg [7:0] Busy; //1 quando a estacao de reserva e a unidade estiverem ocupadas
  reg [7:0] Name [2:0]; //guarda um apelido para a instrucao
  reg [7:0] Qj, Qk; //operando fonte, 0= já disponível
  reg [7:0] Vj, Vk; //valores do operando fonte
  input [15:0] instruction; //recebe a instrucao
  reg [7:0] OP [3:0]; //operacao em si
  input Clock, Adderin; //clock e controle de entrada de uma nova instrucao

  reg [7:0]registerStatus[2:0]; //guarda o estado de cada registrador
	//0 = disponivel, valor = apelido da instrucao que ele aguarda

  initial
  begin
	registerStatus[0] = 0;  // 0 = disponivel
	registerStatus[1] = 0;  // 0 = disponivel
	registerStatus[2] = 0;  // 0 = disponivel
	registerStatus[3] = 0;  // 0 = disponivel
	registerStatus[4] = 0;  // 0 = disponivel
	registerStatus[5] = 0;  // 0 = disponivel
	registerStatus[6] = 0;  // 0 = disponivel
	registerStatus[7] = 0;  // 0 = disponivel
  end
  
  always @ (posedge Clock)
  begin
  
    if(Adderin == 1'b1)
    begin
      if(Busy[3'b000]==0) // Linha 0
      begin
        Busy[3'b000]<=1;
        OP[3'b000] = instruction[3:0]; //guarda o operador
	Qj[3'b000] = registerStatus[instruction[9:7]]; //guarda a dependencia de x
	Qk[3'b000] = registerStatus[instruction[6:4]]; //guarda a dependencia de y
	instruction[9:7] = 3'b000; //X passa a depender da nova instrucao
      end
      else
        if(Busy[3'b001]==0) // Linha 1
        begin
          Busy[3'b001]<=1;
          OP[3'b001] = instruction[3:0];
        end
        else
          if(Busy[3'b010]==0) // Linha 2
          begin
            Busy[3'b010]<=1;
            OP[3'b010] = instruction[3:0];
          end
          else
            if(Busy[3'b011]==0) // Linha 3
            begin
              Busy[3'b011]<=1;
              OP[3'b011] = instruction[3:0];
            end
            else
              if(Busy[3'b100]==0) // Linha 4
              begin
                Busy[3'b100]<=1;
                OP[3'b100] = instruction[3:0];
              end
              else
                if(Busy[3'b101]==0) // Linha 5
                begin
                  Busy[3'b101]<=1;
                  OP[3'b101] = instruction[3:0];
                end
                  else
                    if(Busy[3'b110]==0) // Linha 6
                    begin
                      Busy[3'b110]<=1;
                      OP[3'b110] = instruction[3:0];
                    end
                    else
                      if(Busy[3'b111]==0) // Linha 7
                      begin
                        Busy[3'b111]<=1;
                        OP[3'b111] = instruction[3:0];
                      end
    end
  end
  
endmodule