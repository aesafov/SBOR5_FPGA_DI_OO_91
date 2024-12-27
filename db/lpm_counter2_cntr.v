//lpm_counter CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" DEVICE_FAMILY="Cyclone III" lpm_direction="UP" lpm_port_updown="PORT_UNUSED" lpm_width=2 clock cout q CARRY_CHAIN="MANUAL" CARRY_CHAIN_LENGTH=48
//VERSION_BEGIN 9.1 cbx_cycloneii 2009:10:21:21:22:16:SJ cbx_lpm_add_sub 2009:10:21:21:22:16:SJ cbx_lpm_compare 2009:10:21:21:22:16:SJ cbx_lpm_counter 2009:10:21:21:22:16:SJ cbx_lpm_decode 2009:10:21:21:22:16:SJ cbx_mgl 2009:10:21:21:37:49:SJ cbx_stratix 2009:10:21:21:22:16:SJ cbx_stratixii 2009:10:21:21:22:16:SJ  VERSION_END
//CBXI_INSTANCE_NAME="main_part_part_RX_inst_chanel_block_inst_lpm_counter2_inst3_lpm_counter_lpm_counter_component"
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



//synthesis_resources = lut 2 reg 2 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  lpm_counter2_cntr
	( 
	clock,
	cout,
	q) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	output   cout;
	output   [1:0]  q;

	wire  [0:0]   wire_counter_comb_bita_0combout;
	wire  [0:0]   wire_counter_comb_bita_1combout;
	wire  [0:0]   wire_counter_comb_bita_0cout;
	wire  [0:0]   wire_counter_comb_bita_1cout;
	wire	[1:0]	wire_counter_reg_bit_d;
	wire	[1:0]	wire_counter_reg_bit_asdata;
	reg	[1:0]	counter_reg_bit;
	wire	[1:0]	wire_counter_reg_bit_ena;
	wire	[1:0]	wire_counter_reg_bit_sload;
	wire  aclr_actual;
	wire clk_en;
	wire cnt_en;
	wire  cout_actual;
	wire [1:0]  data;
	wire  external_cin;
	wire  [1:0]  s_val;
	wire  [1:0]  safe_q;
	wire sclr;
	wire sload;
	wire sset;
	wire  time_to_clear;
	wire  updown_dir;

	cycloneiii_lcell_comb   counter_comb_bita_0
	( 
	.cin(external_cin),
	.combout(wire_counter_comb_bita_0combout[0:0]),
	.cout(wire_counter_comb_bita_0cout[0:0]),
	.dataa(counter_reg_bit[0]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_0.lut_mask = 16'h5A90,
		counter_comb_bita_0.sum_lutc_input = "cin",
		counter_comb_bita_0.lpm_type = "cycloneiii_lcell_comb";
	cycloneiii_lcell_comb   counter_comb_bita_1
	( 
	.cin(wire_counter_comb_bita_0cout[0:0]),
	.combout(wire_counter_comb_bita_1combout[0:0]),
	.cout(wire_counter_comb_bita_1cout[0:0]),
	.dataa(counter_reg_bit[1]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_1.lut_mask = 16'h5A90,
		counter_comb_bita_1.sum_lutc_input = "cin",
		counter_comb_bita_1.lpm_type = "cycloneiii_lcell_comb";
	// synopsys translate_off
	initial
		counter_reg_bit[0:0] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[0:0] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[0:0] == 1'b1) 
			if (wire_counter_reg_bit_sload[0:0] == 1'b1) counter_reg_bit[0:0] <= wire_counter_reg_bit_asdata[0:0];
			else  counter_reg_bit[0:0] <= wire_counter_reg_bit_d[0:0];
	// synopsys translate_off
	initial
		counter_reg_bit[1:1] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[1:1] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[1:1] == 1'b1) 
			if (wire_counter_reg_bit_sload[1:1] == 1'b1) counter_reg_bit[1:1] <= wire_counter_reg_bit_asdata[1:1];
			else  counter_reg_bit[1:1] <= wire_counter_reg_bit_d[1:1];
	assign
		wire_counter_reg_bit_asdata = ({2{(~ sclr)}} & (({2{sset}} & s_val) | ({2{(~ sset)}} & data))),
		wire_counter_reg_bit_d = {wire_counter_comb_bita_1combout[0:0], wire_counter_comb_bita_0combout[0:0]};
	assign
		wire_counter_reg_bit_ena = {2{(clk_en & (((sclr | sset) | sload) | cnt_en))}},
		wire_counter_reg_bit_sload = {2{((sclr | sset) | sload)}};
	assign
		aclr_actual = 1'b0,
		clk_en = 1'b1,
		cnt_en = 1'b1,
		cout = cout_actual,
		cout_actual = (wire_counter_comb_bita_1cout[0:0] | (time_to_clear & updown_dir)),
		data = {2{1'b0}},
		external_cin = 1'b1,
		q = safe_q,
		s_val = {2{1'b1}},
		safe_q = counter_reg_bit,
		sclr = 1'b0,
		sload = 1'b0,
		sset = 1'b0,
		time_to_clear = 1'b0,
		updown_dir = 1'b1;
endmodule //lpm_counter2_cntr
//VALID FILE
