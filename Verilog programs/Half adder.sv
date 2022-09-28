module hfa(a,b,sum,carry);
  input a,b;
  output sum,carry;
  assign sum=(a^b);
  assign carry=a&b;
endmodule

module hfa_tb;
  reg a,b;
  wire sum,carry;
  hfa hfa_tb(.a(a),.b(b),.carry(carry),.sum(sum));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    $monitor(a,b,sum,carry);
    a=1'b0;
    b=1'b0;
    #10
    a=1'b0;
    b=1'b1;
    #10
    a=1'b1;
    b=1'b0;
    #10
    a=1'b1;
    b=1'b1;
    #10
    $finish;
  end
endmodule
