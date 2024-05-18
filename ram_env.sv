/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:	ram_env.sv

Description 	: 	Environment class for Dual Port RAm testbench
  
Author Name		:   Putta Satish

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/

//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------


// Extend ram_env from uvm_env
class ram_env extends uvm_env;

   // Factory Registration
	`uvm_component_utils(ram_env)

	// Declare the ram_wr_agent handle as wr_agnth
ram_wr_agent wr_agnth;


	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Standard UVM Methods:
	extern function new(string name = "ram_env",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	

endclass
	
//-----------------  constructor new method  -------------------//
function ram_env::new(string name="ram_env",uvm_component parent);
	super.new(name,parent);
endfunction

       

   

 //-----------------  Add UVM build() phase   -------------------//
function void ram_env::build_phase(uvm_phase phase);	
	super.build_phase(phase);
	// Create the instance of agent in the build phase
	wr_agnth=ram_wr_agent::type_id::create("wr_agnth",this);
	`uvm_info("RAM_ram_env","THIS IS BUILD PHASE OF ram_env",UVM_LOW)
endfunction
   




   
  
   


