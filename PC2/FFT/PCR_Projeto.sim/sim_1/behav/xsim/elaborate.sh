#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2017.4 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Fri May 17 08:15:54 -03 2019
# SW Build 2086221 on Fri Dec 15 20:54:30 MST 2017
#
# Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep xelab -wto 07feeb0c81a544e7a791061fe26feddf --incr --debug typical --relax --mt 8 -L xbip_utils_v3_0_8 -L axi_utils_v2_0_4 -L c_reg_fd_v12_0_4 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_pipe_v3_0_4 -L xbip_dsp48_addsub_v3_0_4 -L xbip_addsub_v3_0_4 -L c_addsub_v12_0_11 -L c_mux_bit_v12_0_4 -L c_shift_ram_v12_0_11 -L xbip_bram18k_v3_0_4 -L mult_gen_v12_0_13 -L cmpy_v6_0_14 -L floating_point_v7_0_14 -L xfft_v9_0_14 -L xil_defaultlib -L secureip -L xpm --snapshot TB_behav xil_defaultlib.TB -log elaborate.log