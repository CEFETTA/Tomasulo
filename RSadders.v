module RSadders(instruction, Clock, Adderin, Busy);
  output reg [7:0] Busy; //1 quando a estacao de reserva e a unidade estiverem ocupadas
  reg [7:0] Name [2:0]; //guarda um apelido para a instrucao
  reg [7:0]Qj[2:0];
  reg [7:0]Qk[2:0]; //operando fonte, 0= já disponível
  reg [7:0] Vj[2:0];
  reg [7:0] Vk[2:0]; //valores do operando fonte
  input [15:0] instruction; //recebe a instrucao
  reg [7:0] OP [15:0]; //operacao em si
  input Clock, Adderin; //clock e controle de entrada de uma nova instrucao

  reg [7:0]registerStatus[2:0]; //guarda o estado de cada registrador
	//0 = disponivel, valor = apelido da instrucao que ele aguarda

  wire [2:0] verifyWire;

verify verificarLivre(Clock, Qj, Qk, verifyWire);

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
        if(Busy[3'b001]==0) // Linha 0
      	begin
      	  Busy[3'b001]<=1;
      	  OP[3'b001][15:0] = instruction[15:0]; //guarda a instrucao inteira
       	  Qj[3'b001] = registerStatus[instruction[9:7]]; //guarda a dependencia de x
	  Qk[3'b001] = registerStatus[instruction[6:4]]; //guarda a dependencia de y
	  registerStatus[instruction[12:10]] = 3'b001; //X passa a depender da nova instrucao
      	end
        else
          if(Busy[3'b010]==0) // Linha 2
          begin
            Busy[3'b010]<=1;
      	    OP[3'b010][15:0] = instruction[15:0]; //guarda a instrucao inteira
       	    Qj[3'b010] = registerStatus[instruction[9:7]]; //guarda a dependencia de x
	    Qk[3'b010] = registerStatus[instruction[6:4]]; //guarda a dependencia de y
	    registerStatus[instruction[12:10]] = 3'b010; //X passa a depender da nova instrucao
          end
          else
            if(Busy[3'b011]==0) // Linha 3
            begin
              Busy[3'b011]<=1;
      	      OP[3'b011][15:0] = instruction[15:0]; //guarda a instrucao inteira
       	      Qj[3'b011] = registerStatus[instruction[9:7]]; //guarda a dependencia de x
	      Qk[3'b011] = registerStatus[instruction[6:4]]; //guarda a dependencia de y
	      registerStatus[instruction[12:10]] = 3'b011; //X passa a depender da nova instrucao
            end
            else
              if(Busy[3'b100]==0) // Linha 4
              begin
		Busy[3'b100]<=1;
      	  	OP[3'b100][15:0] = instruction[15:0]; //guarda a instrucao inteira
       	  	Qj[3'b100] = registerStatus[instruction[9:7]]; //guarda a dependencia de x
	  	Qk[3'b100] = registerStatus[instruction[6:4]]; //guarda a dependencia de y
	  	registerStatus[instruction[12:10]] = 3'b100; //X passa a depender da nova instrucao
              end
              else
                if(Busy[3'b101]==0) // Linha 5
                begin
                  Busy[3'b101]<=1;
      	  	  OP[3'b101][15:0] = instruction[15:0]; //guarda a instrucao inteira
       	  	  Qj[3'b101] = registerStatus[instruction[9:7]]; //guarda a dependencia de x
	  	  Qk[3'b101] = registerStatus[instruction[6:4]]; //guarda a dependencia de y
	  	  registerStatus[instruction[12:10]] = 3'b101; //X passa a depender da nova instrucao
                end
                  else
                    if(Busy[3'b110]==0) // Linha 6
                    begin
                      Busy[3'b110]<=1;
      	  	      OP[3'b110][15:0] = instruction[15:0]; //guarda a instrucao inteira
       	  	      Qj[3'b110] = registerStatus[instruction[9:7]]; //guarda a dependencia de x
	   	      Qk[3'b110] = registerStatus[instruction[6:4]]; //guarda a dependencia de y
	  	      registerStatus[instruction[12:10]] = 3'b110; //X passa a depender da nova instrucao
                    end
                    else
                      if(Busy[3'b111]==0) // Linha 7
                      begin
                        Busy[3'b111]<=1;
      	  		OP[3'b111][15:0] = instruction[15:0]; //guarda a instrucao inteira
       	  		Qj[3'b111] = registerStatus[instruction[9:7]]; //guarda a dependencia de x
	  		Qk[3'b111] = registerStatus[instruction[6:4]]; //guarda a dependencia de y
	  		registerStatus[instruction[12:10]] = 3'b111; //X passa a depender da nova instrucao
                      end
    end

	//Always at clock

	if(verifyWire != 0)
	begin
	end

  end

	
  
endmodule