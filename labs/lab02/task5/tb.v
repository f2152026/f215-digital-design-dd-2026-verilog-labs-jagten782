module tb;

  reg  [3:0] t_a;
  reg  [3:0] t_b;
  reg        t_op;

  wire [3:0] t_result;

  alu DUT (
    .a(t_a),
    .b(t_b),
    .op(t_op),
    .result(t_result)
  );

  reg [3:0] expected;

  task check;
    begin
      #1;

      if (t_result !== expected)
        $display("FAIL: a=%d b=%d op=%b | result=%d expected=%d",
                 t_a, t_b, t_op, t_result, expected);
      else
        $display("PASS: a=%d b=%d op=%b | result=%d",
                 t_a, t_b, t_op, t_result);
    end
  endtask

  initial begin

    // Addition
    t_op = 0;
    t_a = 4;
    t_b = 3;
    expected = 4 + 3;
    check;

    // Change only b
    t_b = 5;
    expected = 4 + 5;
    check;

    // Change only a
    t_a = 7;
    expected = 7 + 5;
    check;

    // Subtraction
    t_op = 1;
    t_a = 7;
    t_b = 3;
    expected = 7 - 3;
    check;

    // Change only b
    t_b = 5;
    expected = 7 - 5;
    check;

    // Change only a
    t_a = 10;
    expected = 10 - 5;
    check;

    // More subtraction cases
    t_a = 3;
    t_b = 7;
    expected = 3 - 7;
    check;

    $finish;
  end

endmodule