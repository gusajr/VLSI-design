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
-- Generated on "01/20/2021 10:34:34"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          newFreq
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY newFreq_vhd_vec_tst IS
END newFreq_vhd_vec_tst;
ARCHITECTURE newFreq_arch OF newFreq_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL f25 : STD_LOGIC;
SIGNAL f50 : STD_LOGIC;
COMPONENT newFreq
	PORT (
	f25 : OUT STD_LOGIC;
	f50 : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : newFreq
	PORT MAP (
-- list connections between master ports and signals
	f25 => f25,
	f50 => f50
	);

-- f50
t_prcs_f50: PROCESS
BEGIN
	FOR i IN 1 TO 16
	LOOP
		f50 <= '0';
		WAIT FOR 30000 ps;
		f50 <= '1';
		WAIT FOR 30000 ps;
	END LOOP;
	f50 <= '0';
	WAIT FOR 30000 ps;
	f50 <= '1';
WAIT;
END PROCESS t_prcs_f50;
END newFreq_arch;
