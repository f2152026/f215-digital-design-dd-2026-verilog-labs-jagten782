module tb;

  reg  [1:0] t_A;
  reg  [1:0] t_B;

  wire t_GT;
  wire t_LT;
  wire t_EQ;

  // Instantiate DUT
  comp2 DUT (
    .A(t_A),
    .B(t_B),
    .GT(t_GT),
    .LT(t_LT),
    .EQ(t_EQ)
  );

  integer i, j;

  initial begin

    // Test all 16 combinations
    for (i = 0; i < 4; i = i + 1) begin
      for (j = 0; j < 4; j = j + 1) begin

        t_A = i;
        t_B = j;

        #1;

        if (t_GT === (i > j) &&
            t_LT === (i < j) &&
            t_EQ === (i == j))
          $display("PASS: A=%d B=%d | GT=%b LT=%b EQ=%b",
                   t_A, t_B, t_GT, t_LT, t_EQ);
        else
          $display("FAIL: A=%d B=%d | GT=%b LT=%b EQ=%b",
                   t_A, t_B, t_GT, t_LT, t_EQ);

      end
    end

    $finish;
  end

endmodule