module accumulator_a (input [7:0] bus, input La, Ea, clock, output [7:0] Y, Y_bus);

/*
Legenda
La -> Permite pegar os valores do bus (LOW) ou nao (HIGH)
Ea -> Permite liberar os valores do acumulador para o barramento (HIGH) ou alta impedancia (LOW)
*/
register_b new_reg_b(.bus(bus), .Lb(La), .clock(clock), .Y(Y));

assign Y_bus = Ea == 0 ? 8'bz: Y;


endmodule 