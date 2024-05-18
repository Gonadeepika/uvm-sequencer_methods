/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:   ram_test_pkg.sv

Description 	: 	Dual Port RAM TB package
  
Author Name		:   Putta Satish

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/


package ram_test_pkg;

	// import the UVM package
	import uvm_pkg::*; 

	// Declare an event e
	//include the "tb_defs.sv","write_xtn.sv", "ram_wr_agent_config.sv", 
	//"ram_wr_driver.sv", "ram_wr_monitor.sv","ram_wr_sequencer.sv", 
	//"ram_wr_agent.sv", "ram_env.sv","ram_wr_seqs.sv", "ram_test.sv"

	event e;

	// include the uvm_macros.svh
	`include "uvm_macros.svh"

	`include "tb_defs.sv"
	`include "write_xtn.sv"
	`include "ram_wr_agent_config.sv"
	`include "ram_wr_driver.sv"
	`include "ram_wr_monitor.sv"
	`include "ram_wr_sequencer.sv"
	`include "ram_wr_agent.sv"
	`include "ram_env.sv"

	// Utility Sequences
	`include "ram_wr_seqs.sv"

	// Includes:
	`include "ram_test.sv"
endpackage
