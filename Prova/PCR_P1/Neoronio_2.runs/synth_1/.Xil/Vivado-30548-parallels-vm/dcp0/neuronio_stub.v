// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module neuronio(clk, reset, start, x_ir, x_ul, saida, ready);
  input clk;
  input reset;
  input start;
  input [26:0]x_ir;
  input [26:0]x_ul;
  output [26:0]saida;
  output ready;
endmodule
