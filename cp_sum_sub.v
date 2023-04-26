module cp_sum_sub(input [7:0] reg_a, reg_b, input Su, Eu, output [7:0] Y);

/*
Legenda
Su -> sinal de controle. Pode Indicar soma (LOW) ou subtraçao (HIGH)
Eu -> Sinal de controle. Libera a saida do somador (HIGH) ou alta impedancia (LOW)
*/
wire [7:0] b_aux, sum_aux, y_aux;
	
assign b_aux = Su? ~ reg_b: reg_b;
assign sum_aux = reg_a + b_aux + Su;

assign Y = Eu? sum_aux: 8'bz;
	

endmodule 