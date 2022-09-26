module decoder_2_to_4_df(EN, A0, A1, D0, D1, D2, D3);
  input EN, A0, A1;
  output D0, D1, D2, D3;
  assign D0 =(EN & ~A0& ~A1);
  assign D1 =(EN & ~A0 & A1);
  assign D2 =(EN & A0 & ~A1);
  assign D3 =(EN & A0 & A1);
endmodule

module decoder_2_to_4_tb;
  reg EN,A0,A1;
  wire D0, D1, D2, D3;
  decoder_2_to_4_df decoder(.EN(EN), .A0(A0), .A1(A1), .D0(D0), .D1(D1),.D2(D2), .D3(D3));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    $monitor(EN,A0,A1,D0,D1,D2,D3);
    EN=1'b0; A0=1'bX ; A1 =1'bX;
    #10 
    EN=1'b1; A0 =1'b0 ; A1 =1'b0;
    #10 
    EN=1'b1; A0 =1'b0 ; A1 =1'b1;
    #10 
    EN=1'b1; A0 =1'b1 ; A1 =1'b0;
    #10 
    EN=1'b1; A0 =1'b1 ; A1 =1'b1;
    #10
    $finish;
  end
  always @(D0, D1, D2, D3)
    $display( "time =%0t \tINPUT VALUES: \t EN=%b \tA1 =%b \t A0 =%b \t output value D3 D2 D1 D0 =%b%b%b%b",$time,EN,A1, A0, D3,D2, D1, D0);
endmodule
