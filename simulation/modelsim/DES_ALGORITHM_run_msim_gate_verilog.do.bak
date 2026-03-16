transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {DES_ALGORITHM.vo}

vlog -vlog01compat -work work +incdir+E:/HE_THONG_SO_HDL/DO_AN/DES_ALGORITHM_64_QUATUS {E:/HE_THONG_SO_HDL/DO_AN/DES_ALGORITHM_64_QUATUS/DES_TESTBENCH.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L cycloneii_ver -L gate_work -L work -voptargs="+acc"  DES_TESTBENCH

add wave *
view structure
view signals
run -all
