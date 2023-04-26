module register_b(input [7:0] bus, input Lb, clock, output reg [7:0] Y);

/*
LEGENDA
Lb -> Permite pegar os valores do bus (LOW) ou nao (HIGH)
*/

always @ (posedge clock)
begin
	Y <= Lb == 0 ? bus: Y;
end

endmodule 