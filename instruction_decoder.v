module instruction_decoder(input [3:0] instruction, output lda, add, sub, out, hlt);
/*
LEGENDA
Os sinais lda, add, sub  out sao ativos em HIGH.
O sinal htl esta ativo em LOW
Apenas um desses sinais está ativo de cada vez.
Codigo das instruçoes:
LDA 	0000
ADD 	0001
SUB 	0010
OUT 	1110
HLT   1111

o hlt, quando acionado, esta responsavel por parar o clock do pc
*/

assign lda = instruction == 8'b0000 ? 1: 0;

assign add = instruction == 8'b0001 ? 1: 0;

assign sub = instruction == 8'b0010 ? 1: 0;

assign out = instruction == 8'b1110 ? 1: 0;

assign hlt = instruction == 8'b1111 ? 0: 1;


endmodule 