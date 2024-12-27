## 
## Copyright (C) 1991-2009 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions
## and other software and tools, and its AMPP partner logic
## functions, and any output files from any of the foregoing
## (including device programming or simulation files), and any
## associated documentation or information are expressly subject
## to the terms and conditions of the Altera Program License
## Subscription Agreement, Altera MegaCore Function License
## Agreement, or other applicable license agreement, including,
## without limitation, that your use is for the sole purpose of
## programming logic devices manufactured by Altera and sold by
## Altera or its authorized distributors.  Please refer to the
## applicable agreement for further details.

##
## Instance name: sdi
## Version: SDI 9.1
##


#*******************
# Time Information *
#*******************

derive_pll_clocks
derive_clock_uncertainty

#***************
# Create Clock *
#***************

set tx_pclk_name "tx_pclk"
set tx_sd_refclk_270_name "tx_sd_refclk_270"
create_clock -name $tx_pclk_name -period 37.037 -waveform { 0.000 18.518 } [get_ports $tx_pclk_name]
create_clock -name $tx_sd_refclk_270_name -period 3.703 -waveform { 0.000 1.851 } [get_ports $tx_sd_refclk_270_name]

#*************************
# Create Generated Clock *
#*************************


#********************
# Set Clock Latency *
#********************


#************************
# Set Clock Uncertainty *
#************************


#*******************
# Set Clock Groups *
#*******************


#******************
# Set Input Delay *
#******************


#*******************
# Set Output Delay *
#*******************


#*****************
# Set False Path *
#*****************


#**********************
# Set Multicycle Path *
#**********************


#********************
# Set Maximum Delay *
#********************


#********************
# Set Minimum Delay *
#********************


#***********************
# Set Input Transition *
#***********************

