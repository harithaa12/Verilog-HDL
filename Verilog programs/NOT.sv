module notg(A, Y);
  input A;
  output Y;
  assign Y = ~A;
endmodule

module notg_tb;
  reg A;
  wire Y;
notg notg_tb(.A(A),.Y(Y));
  
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(1);
    $monitor(A,Y);
    A =1'b0;
    #10
    A =1'b1;
    #10
    $finish;
  end
  always @(Y)
    $display( "time =%0t \tINPUT VALUES: \t A=%b \t output value Y =%b",$time,A,Y);
endmodule
