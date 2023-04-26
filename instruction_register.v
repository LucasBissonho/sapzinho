module instruction_register(input [7:0] bus, input Li, Ei, clk, output [3:0] instruction, output [3:0] data);
/*
LEGENDA
Ei -> libera a saida para o barramento (LOW) ou alta impedancia (HIGH)
Li -> realiza a leitura do barramento (LOW) ou nao (HIGH)
*/
reg [3:0] aux_instr;
reg [3:0] aux_data;

always @ (posedge clk)
begin
//aux_instr <= Li == 0? bus[7:4]: aux_instr;
//aux_data <= Li == 0? bus[3:0]: aux_data;
if (Li == 0)
begin
aux_instr <= bus[7:4];
aux_data <= bus[3:0];
end

//data <= Ei == 0? aux_data: 4'bz;

end

assign data = Ei == 0? aux_data: 4'bz;
assign instruction = aux_instr;

endmodule 