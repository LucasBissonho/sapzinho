module output_register(input [7:0] bus, input Lo, clock, output reg [7:0] leds);

/*
LEGENDA
Lo -> Permite pegar os valores do bus (LOW) ou nao (HIGH)
*/

always @ (posedge clock)
begin
	leds <= Lo == 0 ? bus: leds;
end

endmodule 