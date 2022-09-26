module encoder_8_to_3( I, Y );
  input [7:0] I;
  output [2:0] Y;
  or(Y[2],I[4],I[5],I[6],I[7]);
  or(Y[1],I[2],I[3],I[6],I[7]);
  or(Y[0],I[1],I[3],I[5],I[7]);
endmodule

module encoder_8_to_3_tb;
  reg[7:0] I;
  wire[2:0] Y;
  encoder_8_to_3 encoder(.I(I),.Y(Y));
  initial begin
    $monitor(I,Y);
    $dumpfile("dump.vcd");
    $dumpvars(1);
    I= 8'b00000001;
    #10 
    I=8'b00000010;
    #10 
    I=8'b00000100;
    #10 
    I=8'b00001000;
    #10 
    I=8'b00010000;
    #10 
    I=8'b00100000;
    #10 
    I=8'b01000000;
    #10 
    I=8'b10000000;
    #10
    $finish;
  end
  always @(Y)
    $display("time =%0t \tINPUT VALUES: \t I=%b \t output value Y =%b ",$time,I, Y);
endmodule
