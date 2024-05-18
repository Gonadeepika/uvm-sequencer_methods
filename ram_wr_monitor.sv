/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:   ram_wr_monitor.sv

Description 	: 	Write monitor class for Dual Port RAM TB
  
Author Name		:   Putta Satish

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/

//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------

// Extend ram_wr_monitor from uvm_monitor

class ram_wr_monitor extends uvm_monitor;

  // Factory Registration
	`uvm_component_utils(ram_wr_monitor)
	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Standard UVM Methods :
	extern function new(string name = "ram_wr_monitor", uvm_component parent);
	extern task run_phase(uvm_phase phase);
	
endclass 
//-----------------  constructor new method  -------------------//
function ram_wr_monitor::new(string name = "ram_wr_monitor", uvm_component parent);
	super.new(name,parent);
 endfunction

//-----------------  run() phase method  -------------------//
//Print info message “This is write monitor run_phase” 
task ram_wr_monitor::run_phase(uvm_phase phase);
	`uvm_info("RAM_WR_MONITOR","THIS IS MONITOR IN RUN",UVM_LOW)   
endtask