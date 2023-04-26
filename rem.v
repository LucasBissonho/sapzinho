module rem(input [3:0] bus, addr_in, input Lm, clock, run_prog, output reg[3:0] Y_ram);

/*
LEGENDA
Lm -> Permite pegar os valores do bus (LOW) ou nao (HIGH)
run_prog -> representa o modo de execuçao do pc (HIGH) ou o mode de programaçao (LOW)
S2 -> entrada de dados manual
*/
reg [3:0] y_aux;

always @ (posedge clock)
begin
	//y_aux <= Lm == 0 ? bus: y_aux;
if (Lm == 0) 
begin
y_aux <= bus;
end
end


always @ (run_prog == 1)
begin
	Y_ram <= run_prog == 1 ? y_aux: addr_in;
end

endmodule 