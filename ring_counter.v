module ring_counter(input clock, clr, output reg t1, t2, t3, t4, t5, t6);
/*
LEGENDA
A descida do sinal de clock para zero (borda de descida) aciona uma mudança de tempo.
clr -> reseta a contagem do tempo quando o sinal for LOW.

*/

integer count;

always @ (negedge clock)
begin
count = count + 1;
count = count == 7? 1: count;
count = clr == 0? 1: count;

t1 <= count == 1? 1: 0;
t2 <= count == 2? 1: 0;
t3 <= count == 3? 1: 0;
t4 <= count == 4? 1: 0;
t5 <= count == 5? 1: 0;
t6 <= count == 6? 1: 0;
end

endmodule 