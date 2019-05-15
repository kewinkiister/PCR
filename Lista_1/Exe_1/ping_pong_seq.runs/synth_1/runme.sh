#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/home/parallels/Desktop/Downloads/SDK/2018.3/bin:/home/parallels/Desktop/Downloads/Vivado/2018.3/ids_lite/ISE/bin/lin64:/home/parallels/Desktop/Downloads/Vivado/2018.3/bin
else
  PATH=/home/parallels/Desktop/Downloads/SDK/2018.3/bin:/home/parallels/Desktop/Downloads/Vivado/2018.3/ids_lite/ISE/bin/lin64:/home/parallels/Desktop/Downloads/Vivado/2018.3/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/home/parallels/Desktop/Downloads/Vivado/2018.3/ids_lite/ISE/lib/lin64
else
  LD_LIBRARY_PATH=/home/parallels/Desktop/Downloads/Vivado/2018.3/ids_lite/ISE/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/parallels/Desktop/ProjetosVivado/ping_pong_seq/ping_pong_seq.runs/synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log ping_pong_leds.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source ping_pong_leds.tcl
