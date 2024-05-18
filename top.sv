/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:   top.sv

Description 	: 	Top Module
  
Author Name		:   Putta Satish

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/




module top;
  

	// import ram_test_pkg
   
	import ram_test_pkg::*;

	// import the UVM package
   import uvm_pkg::*; 

	// include the uvm_macros.svh
	`include "uvm_macros.svh"


 
    //Within initial begin
	// Call run_test()
	initial
		begin
			run_test();
		end

 initial

 begin

  #20;
	->e;
	end
endmodule : top

