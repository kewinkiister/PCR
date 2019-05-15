create_clock -period 5 -waveform {0 2.5} -name clkin [get_ports clk]

set_input_delay -clock clkin -max 2 [get_ports reset]
set_input_delay -clock clkin -min 1 [get_ports reset]

set_input_delay -clock clkin -max 0.750 [get_ports en]
set_input_delay -clock clkin -min 0.500 [get_ports en]

set_output_delay -clock clkin 2 [get_ports led]