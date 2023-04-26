module program_counter(input Cp, clk, clr, Ep, output [3:0] Y);
/*
LEGENDA
Ep -> libera a saida para o barramento (HIGH) ou alta impedancia (LOW)
Cp -> realiza a contagem do programa (HIGH) ou nao (LOW)
clr -> reinicia a contagem para zero quando ativado (LOW)
*/

reg [3:0] cont_aux;

always @ (posedge clk)
begin
cont_aux <= Cp == 1? cont_aux + 1: cont_aux;
if (clr == 0)
begin
cont_aux <= 4'b0;
end
end

/*always @ (1)
begin
if (Ep == 1)
begin
Y <= cont_aux;
end
else
begin
Y <= 4'bz;
end
end*/
assign Y = Ep == 1? cont_aux: 4'bz;
endmodule 