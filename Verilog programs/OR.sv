module org(A, B, Y);
  input A,B;
  output Y;
  assign Y = A | B;
endmodule

module org_tb;
  reg A,B;
  wire Y;
org org_tb(.A(A), .B(B),.Y(Y));
  
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(1);
    $monitor(A,B,Y);
    A =1'b0;
    B= 1'b0;
    #10
    A =1'b0;
    B= 1'b1;
    #10
    A =1'b1;
    B= 1'b0;
    #10 
    A =1'b1;
    B= 1'b1;
    #10
    $finish;
  end
  always @(Y)
    $display( "time =%0t \tINPUT VALUES: \t A=%b B =%b \t output value Y =%b",$time,A,B,Y);
endmodule
