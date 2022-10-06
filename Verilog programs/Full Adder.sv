module ffa(sum,carry,a,b,cin);
  input a,b,cin;
  output sum,carry;
  assign sum= (a^b)^cin;
  assign carry= (a & b)|(b & cin)|(a & cin);
endmodule

module ffa_tb;
  reg a,b,cin;
  wire sum,carry;
  ffa ffa_tb(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    $monitor(a,b,cin,sum,carry);
    a=1'b0;
    b=1'b0;
    cin=1'b0;
    #10
    a=1'b0;
    b=1'b0;
    cin=1'b1;
    #10
    a=1'b0;
    b=1'b1;
    cin=1'b0;
    #10
    a=1'b0;
    b=1'b1;
    cin=1'b1;
    #10
    a=1'b1;
    b=1'b0;
    cin=1'b0;
    #10
    a=1'b1;
    b=1'b0;
    cin=1'b1;
    #10
    a=1'b1;
    b=1'b1;
    cin=1'b0;
    #10
    a=1'b1;
    b=1'b1;
    cin=1'b1;
    #10
    $finish;
  end
endmodule
