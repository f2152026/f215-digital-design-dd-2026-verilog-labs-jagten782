// tb.v

// Starter testbench template -- YOU complete this file.

module tb;

  // Declare the inputs and outputs
  reg  [1:0] t_sel;
  wire [7:0] t_dout;

  // Instantiate DUT
  lut DUT (
    .sel(t_sel),
    .dout(t_dout)
  );

  // Waveform dump configuration (DO NOT CHANGE)

  string vcd_file;

  initial begin

    if ($value$plusargs("vcd=%s", vcd_file)) begin

      $dumpfile(vcd_file);

      $dumpvars(0, DUT);

    end

  end

  initial begin
    // Apply all possible input combinations
    t_sel = 2'b00; #5;
    t_sel = 2'b01; #5;
    t_sel = 2'b10; #5;
    t_sel = 2'b11; #5;

    $finish;
  end

  initial
    $monitor($time, " sel=%b | dout=%b", t_sel, t_dout);

endmodule