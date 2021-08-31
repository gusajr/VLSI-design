-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "09/29/2020 16:42:39"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          checadorParidad
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY checadorParidad_vhd_vec_tst IS
END checadorParidad_vhd_vec_tst;
ARCHITECTURE checadorParidad_arch OF checadorParidad_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL bitIn : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL paridad : STD_LOGIC;
COMPONENT checadorParidad
	PORT (
	bitIn : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	paridad : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : checadorParidad
	PORT MAP (
-- list connections between master ports and signals
	bitIn => bitIn,
	clk => clk,
	paridad => paridad
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		clk <= '0';
		WAIT FOR 40000 ps;
		clk <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	clk <= '0';
WAIT;
END PROCESS t_prcs_clk;

-- bitIn
t_prcs_bitIn: PROCESS
BEGIN
	bitIn <= '0';
	WAIT FOR 180000 ps;
	bitIn <= '1';
	WAIT FOR 40000 ps;
	bitIn <= '0';
	WAIT FOR 120000 ps;
	bitIn <= '1';
	WAIT FOR 40000 ps;
	bitIn <= '0';
	WAIT FOR 120000 ps;
	bitIn <= '1';
	WAIT FOR 40000 ps;
	bitIn <= '0';
WAIT;
END PROCESS t_prcs_bitIn;
END checadorParidad_arch;
