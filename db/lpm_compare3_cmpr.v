//lpm_compare CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" DEVICE_FAMILY="Cyclone III" LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=12 ONE_INPUT_IS_CONSTANT="YES" aeb dataa datab CARRY_CHAIN="MANUAL" CARRY_CHAIN_LENGTH=48
//VERSION_BEGIN 9.1 cbx_cycloneii 2009:10:21:21:22:16:SJ cbx_lpm_add_sub 2009:10:21:21:22:16:SJ cbx_lpm_compare 2009:10:21:21:22:16:SJ cbx_mgl 2009:10:21:21:37:49:SJ cbx_stratix 2009:10:21:21:22:16:SJ cbx_stratixii 2009:10:21:21:22:16:SJ  VERSION_END
//CBXI_INSTANCE_NAME="main_part_part_RX_inst_lpm_compare3_inst14_lpm_compare_lpm_compare_component"
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



//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  lpm_compare3_cmpr
	( 
	aeb,
	dataa,
	datab) /* synthesis synthesis_clearbox=1 */;
	output   aeb;
	input   [11:0]  dataa;
	input   [11:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [11:0]  dataa;
	tri0   [11:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [0:0]  aeb_result_wire;
	wire  [0:0]  aneb_result_wire;
	wire  [31:0]  data_wire;
	wire  eq_wire;

	assign
		aeb = eq_wire,
		aeb_result_wire = (~ aneb_result_wire),
		aneb_result_wire = (data_wire[0] | data_wire[1]),
		data_wire = {datab[11], dataa[11], datab[10], dataa[10], datab[9], dataa[9], datab[8], dataa[8], datab[7], dataa[7], datab[6], dataa[6], datab[5], dataa[5], datab[4], dataa[4], datab[3], dataa[3], datab[2], dataa[2], datab[1], dataa[1], datab[0], dataa[0], ((data_wire[28] ^ data_wire[29]) | (data_wire[30] ^ data_wire[31])), ((data_wire[24] ^ data_wire[25]) | (data_wire[26] ^ data_wire[27])), ((data_wire[20] ^ data_wire[21]) | (data_wire[22] ^ data_wire[23])), ((data_wire[16] ^ data_wire[17]) | (data_wire[18] ^ data_wire[19])), ((data_wire[12] ^ data_wire[13]) | (data_wire[14] ^ data_wire[15])), ((data_wire[8] ^ data_wire[9]) | (data_wire[10] ^ data_wire[11])), (data_wire[6] | data_wire[7]), (((data_wire[2] | data_wire[3]) | data_wire[4]) | data_wire[5])},
		eq_wire = aeb_result_wire;
endmodule //lpm_compare3_cmpr
//VALID FILE
