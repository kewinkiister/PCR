#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/home/parallels/Downloads/SDK/2017.4/bin:/home/parallels/Downloads/Vivado/2017.4/ids_lite/ISE/bin/lin64:/home/parallels/Downloads/Vivado/2017.4/bin
else
  PATH=/home/parallels/Downloads/SDK/2017.4/bin:/home/parallels/Downloads/Vivado/2017.4/ids_lite/ISE/bin/lin64:/home/parallels/Downloads/Vivado/2017.4/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/home/parallels/Downloads/Vivado/2017.4/ids_lite/ISE/lib/lin64
else
  LD_LIBRARY_PATH=/home/parallels/Downloads/Vivado/2017.4/ids_lite/ISE/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/parallels/Desktop/ProjetosVivado/PCR_Projeto/PCR_Projeto.runs/synth_1'
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

EAStep vivado -log FFT.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source FFT.tcl
