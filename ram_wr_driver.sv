/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:   ram_wr_driver.sv

Description 	:	Write Driver class for Dual port RAM TB
  
Author Name		:   Putta Satish

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/

//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------


// Extend ram_wr_driver from uvm driver parameterized by write_xtn
class ram_wr_driver extends uvm_driver #(write_xtn);

   // Factory Registration

	`uvm_component_utils(ram_wr_driver)


	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Standard UVM Methods:
     	
	extern function new(string name ="ram_wr_driver",uvm_component parent);
	extern task run_phase(uvm_phase phase);
	extern task send_to_dut(write_xtn xtn);
	
endclass

//-----------------  constructor new method  -------------------//
// Define Constructor new() function
function ram_wr_driver::new(string name ="ram_wr_driver",uvm_component parent);
	super.new(name,parent);
endfunction


//-----------------  run() phase method  -------------------//
// In forever loop
// Get the sequence item using seq_item_port
// Call send_to_dut task 
// send the item_done to the sequencer using seq_item_port  

task ram_wr_driver::run_phase(uvm_phase phase);
    forever 
		begin
			seq_item_port.get_next_item(req);
			send_to_dut(req);
			seq_item_port.item_done();
		end
endtask

//-----------------  task send_to_dut() method  -------------------//
// Add task send_to_dut(write_xtn handle as an input argument)
// Print the transaction
task ram_wr_driver::send_to_dut(write_xtn xtn);
	`uvm_info("DRIVER", "Displaying the Driver Data", UVM_MEDIUM)
	xtn.print();
	//Add a delay of 100
	#100;
endtask



