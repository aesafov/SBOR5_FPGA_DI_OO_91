//lpm_add_sub CARRY_CHAIN="MANUAL" CARRY_CHAIN_LENGTH=48 DEVICE_FAMILY="Cyclone III" LPM_DIRECTION="SUB" LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=9 ONE_INPUT_IS_CONSTANT="YES" dataa datab result
//VERSION_BEGIN 9.1 cbx_cycloneii 2009:10:21:21:22:16:SJ cbx_lpm_add_sub 2009:10:21:21:22:16:SJ cbx_mgl 2009:10:21:21:37:49:SJ cbx_stratix 2009:10:21:21:22:16:SJ cbx_stratixii 2009:10:21:21:22:16:SJ  VERSION_END
//CBXI_INSTANCE_NAME="main_part_part_RX_inst_chanel_block_inst_lpm_add_sub0_inst5_lpm_add_sub_lpm_add_sub_component"
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 1991-2009 Altera Corporation
//  Your use of Altera Corporation's design tools, logic functions 
//  and other software and tools, and its AMPP partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Altera Program License 
//  Subscription Agreement, Altera MegaCore Function License 
//  Agreement, or other applicable license agreement, including, 
//  without limitation, that your use is for the sole purpose of 
//  programming logic devices manufactured by Altera and sold by 
//  Altera or its authorized distributors.  Please refer to the 
//  applicable agreement for further details.



//synthesis_resources = lut 10 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  lpm_add_sub0_add_sub
	( 
	dataa,
	datab,
	result) /* synthesis synthesis_clearbox=1 */;
	input   [8:0]  dataa;
	input   [8:0]  datab;
	output   [8:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [8:0]  dataa;
	tri0   [8:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif


	assign
		result = dataa - datab;
endmodule //lpm_add_sub0_add_sub
//VALID FILE
