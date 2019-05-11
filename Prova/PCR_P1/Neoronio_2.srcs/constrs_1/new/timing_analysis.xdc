create_clock -period 11 -waveform {0 5.5} -name clkin [get_ports clk]

set_input_delay -clock clkin -max 2 [get_ports start]
set_input_delay -clock clkin -min 1 [get_ports start]

set_output_delay -clock clkin -max 2 [get_ports led]
set_output_delay -clock clkin -min 1 [get_ports led]

#clock, start, led, saida ==> delay