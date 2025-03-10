transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/edwin/Desktop/Practicas\ Clase/Clock {C:/Users/edwin/Desktop/Practicas Clase/Clock/OneShot.v}

vlog -sv -work work +incdir+C:/Users/edwin/Desktop/Practicas\ Clase/Clock {C:/Users/edwin/Desktop/Practicas Clase/Clock/OneShot_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  OneShot_tb

add wave *
view structure
view signals
run -all
