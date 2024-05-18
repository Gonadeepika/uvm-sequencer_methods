#Makefile for UVM Testbench - Lab 05

# SIMULATOR = Questa for Mentor's Questasim
# SIMULATOR = VCS for Synopsys's VCS

SIMULATOR = VCS



RTL= ../rtl/*
work= work #library name
SVTB1= ../tb/top.sv
INC = +incdir+../tb +incdir+../test +incdir+../wr_agt_top +incdir+../rd_agt_top
SVTB2 = ../test/ram_test_pkg.sv
VSIMOPT= -vopt -voptargs=+acc 
VSIMCOV= -coverage -sva 
VSIMBATCH1= -c -do  " log -r /* ;coverage save -onexit mem_cov1;run -all; exit"
VSIMBATCH2= -c -do  " log -r /* ;coverage save -onexit mem_cov2;run -all; exit"
VSIMBATCH3= -c -do  " log -r /* ;coverage save -onexit mem_cov3;run -all; exit"
VSIMBATCH4= -c -do  " log -r /* ;coverage save -onexit mem_cov4;run -all; exit"


help:
	@echo =============================================================================================================
	@echo "! USAGE   	--  make target                             											!"
	@echo "! clean   	=>  clean the earlier log and intermediate files.       								!"
	@echo "! sv_cmp    	=>  Create library and compile the code.                   								!"
	@echo "! run_test	=>  clean, compile & run the simulation for ram_seqr_arb_test in batch mode.		!" 
	@echo ====================================================================================================================

clean : clean_$(SIMULATOR)
sv_cmp : sv_cmp_$(SIMULATOR)
run_test : run_test_$(SIMULATOR)

# ----------------------------- Start of Definitions for Mentor's Questa Specific Targets -------------------------------#

sv_cmp_Questa:
	vlib $(work)
	vmap work $(work)
	vlog -work $(work) $(INC) $(SVTB2) $(SVTB1) 	
	
run_test_Questa: clean sv_cmp
	vsim  $(VSIMOPT) $(VSIMCOV) $(VSIMBATCH1)  -l test1.log  -sv_seed random  work.top +UVM_TESTNAME=ram_seqr_arb_test
	
clean_Questa: 
	rm -rf transcript* *log* fcover* covhtml* mem_cov* *.wlf modelsim.ini work
	clear

# ----------------------------- End of Definitions for Mentor's Questa Specific Targets -------------------------------#

# ----------------------------- Start of Definitions for Synopsys's VCS Specific Targets -------------------------------#

sv_cmp_VCS:
	vcs -l vcs.log -timescale=1ns/1ps -sverilog -ntb_opts uvm -debug_access+all -full64 $(INC) $(SVTB2) $(SVTB1)
	      
run_test_VCS:	clean  sv_cmp_VCS
	./simv -a test.log +ntb_random_seed_automatic +UVM_TESTNAME=ram_seqr_arb_test
	
clean_VCS:
	rm -rf simv* csrc* *.tmp *.vdb *.key *.log *hdrs.h urgReport* novas* vdCov*
	clear

# ----------------------------- END of Definitions for Synopsys's VCS Specific Targets -------------------------------#
