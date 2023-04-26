module ram(input [7:0] data_in, input [3:0] addr, input CE, read_write, run_prog, output [7:0] Y);
/*
LEGENDA
Ce -> representa o modo de execuçao do pc (HIGH) ou o mode de programaçao (LOW)
run_prog -> aciona o modo de programaçao (LOW) ou o modo de execucao do pc (HIGH)
read_write -> aciona o modo de leitura (HIGH) ou de escrita (LOW) da memoria ram
"[7:0]" -> é o tamanho dos elementos individuais da matriz. Cada elemento é um vetor unidimensional de 8 bits.
"[0:15]" -> é o intervalo de índices permitidos para a matriz. A matriz "data" tem 16 elementos, numerados de 0 a 15.
*/
reg [7:0] storage [0:15];
wire ce_aux;

assign ce_aux = run_prog == 1? CE: 0;

always @ (negedge read_write)
begin
storage[addr] <= ce_aux == 0 ? data_in: storage[addr];
end

assign Y = ce_aux == 0? storage[addr]: 8'bz;

endmodule 