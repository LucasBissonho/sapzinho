module control_matrix(
input lda, add, sub, out, t1, t2, t3, t4, t5, t6,
output Cp, Ep, Lm, CE, Li, Ei, La, Ea, Su, Eu, Lb, Lo
);
/*
LEGENDA
Esse mini-modulo libera os sinais de controle (sinais de output),
dependendo da combinaçao dos mneumonicos (lda, add, sub e out) com o tempo do clock (t1 ate t6)

palavra de controle:
CON = CpEpLmCE LiEiLaEa SuEuLbLo

A seguir tabela de dependencias das saidas:

T1 (estado de endereço):  0101 1110 0011 (5E3) (ativos: Ep e Lm)
T2 (clico de incremento): 1011 1110 0011 (BE3) (ativo: Cp)
T3 (estado de memoria):   0010 0110 0011 (263) (ativos: CE e Li)

LDA
T4: 							  0001 1010 0011 (1A3) (ativos: Lm e Ei)
T5								  0010 1100 0011 (2C3) (ativos: CE e La)
T6								  0011 1110 0011 (3E3) (ativos: nada)

ADD
T4: 							  0001 1010 0011 (1A3) (ativos: Lm e Ei)
T5								  0010 1110 0001 (2E1) (ativos: CE e Lb)
T6								  0011 1100 0111 (3C7) (ativos: La e Eu)

SUB
T4: 							  0001 1010 0011 (1A3) (ativos: Lm e Ei)
T5								  0010 1110 0001 (2E1) (ativos: CE e Lb)
T6								  0011 1100 1111 (3CF) (ativos: La, Su, Eu)

OUT
T4: 							  0011 1111 0010 (3F2)(ativos: Ea e Lo)
T5								  0011 1110 0011 (3E3) (ativos: nada)
T6								  0011 1110 0011 (3E3) (ativos: nada)

*/

reg [11:0] con_aux;

always @ (posedge t1, posedge t2, posedge t3, posedge t4, posedge t5, posedge t6)
begin
con_aux <= 12'b000000000000;

if (t1 == 1) begin
con_aux <= 12'b010111100011;
end

if (t2 == 1) begin
con_aux <= 12'b101111100011;
end

if (t3 == 1) begin
con_aux <= 12'b001001100011;
end

if (t4 == 1) begin
//lda, add, sub, out
if (lda == 1) begin
con_aux <= 12'b000110100011; 
end
if (add == 1) begin
con_aux <= 12'b000110100011;
end
if (sub == 1) begin
con_aux <= 12'b000110100011;
end
if (out == 1) begin
con_aux <= 12'b001111110010;
end
end

if (t5 == 1) begin
if (lda == 1) begin
con_aux <= 12'b001011000011; 
end
if (add == 1) begin
con_aux <= 12'b001011100001;
end
if (sub == 1) begin
con_aux <= 12'b001011100001;
end
if (out == 1) begin
con_aux <= 12'b001111100011;
end
end



if (t6 == 1) begin
if (lda == 1) begin
con_aux <= 12'b001111100011; 
end
if (add == 1) begin
con_aux <= 12'b001111000111;
end
if (sub == 1) begin
con_aux <= 12'b001111001111;
end
if (out == 1) begin
con_aux <= 12'b001111100011;
end
end

end

assign Cp = con_aux[11];
assign Ep = con_aux[10];
assign Lm = con_aux[9];
assign CE = con_aux[8];
assign Li = con_aux[7];
assign Ei = con_aux[6];
assign La = con_aux[5];
assign Ea = con_aux[4];
assign Su = con_aux[3];
assign Eu = con_aux[2];
assign Lb = con_aux[1];
assign Lo = con_aux[0];


endmodule 