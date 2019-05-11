onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ROMmenXul_opt

do {wave.do}

view wave
view structure
view signals

do {ROMmenXul.udo}

run -all

quit -force
