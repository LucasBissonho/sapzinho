module control_sequen(
input clock, clr, 
input [3:0] instruction,
output Cp, Ep, Lm, CE, Li, Ei, La, Ea, Su, Eu, Lb, Lo, hlt);

wire t1, t2, t3, t4, t5, t6, lda, add, sub, out;

ring_counter o_anel(.clock(clock), .clr(clr), .t1(t1), .t2(t2), .t3(t3), .t4(t4), .t5(t5), .t6(t6));

instruction_decoder decod(.instruction(instruction), .lda(lda), .add(add), .sub(sub), .out(out), .hlt(hlt));

control_matrix(.lda(lda), .add(add), .sub(sub), .out(out), .t1(t1), .t2(t2), .t3(t3), .t4(t4), .t5(t5), .t6(t6),
.Cp(Cp), .Ep(Ep), .Lm(Lm), .CE(CE), .Li(Li), .Ei(Ei), .La(La), .Ea(Ea), .Su(Su), .Eu(Eu), .Lb(Lb), .Lo(Lo));

endmodule 