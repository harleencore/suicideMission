set projDir "C:/Users/1001819/Downloads/PortableGit/suicideMission/work/planAhead"
set projName "vgatest"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
<<<<<<< HEAD
set verilogSources [list "C:/Users/1001819/Downloads/PortableGit/suicideMission/work/verilog/mojo_top_0.v" "C:/Users/1001819/Downloads/PortableGit/suicideMission/work/verilog/reset_conditioner_1.v" "C:/Users/1001819/Downloads/PortableGit/suicideMission/work/verilog/edge_detector_2.v" "C:/Users/1001819/Downloads/PortableGit/suicideMission/work/verilog/user_3.v" "C:/Users/1001819/Downloads/PortableGit/suicideMission/work/verilog/enemy_4.v" "C:/Users/1001819/Downloads/PortableGit/suicideMission/work/verilog/projectile_5.v"]
=======
set verilogSources [list "/home/ada/Documents/SUTD/Term4/compstruc/Workspace/suicideMission/work/verilog/mojo_top_0.v" "/home/ada/Documents/SUTD/Term4/compstruc/Workspace/suicideMission/work/verilog/reset_conditioner_1.v" "/home/ada/Documents/SUTD/Term4/compstruc/Workspace/suicideMission/work/verilog/aluLogic_2.v" "/home/ada/Documents/SUTD/Term4/compstruc/Workspace/suicideMission/work/verilog/user_3.v" "/home/ada/Documents/SUTD/Term4/compstruc/Workspace/suicideMission/work/verilog/enemy_4.v" "/home/ada/Documents/SUTD/Term4/compstruc/Workspace/suicideMission/work/verilog/aluADD_5.v" "/home/ada/Documents/SUTD/Term4/compstruc/Workspace/suicideMission/work/verilog/aluBOOL_6.v" "/home/ada/Documents/SUTD/Term4/compstruc/Workspace/suicideMission/work/verilog/aluCOMP_7.v" "/home/ada/Documents/SUTD/Term4/compstruc/Workspace/suicideMission/work/verilog/aluSHIFT_8.v"]
>>>>>>> 15905c84366596e4d896036833bdbc7d29eac06b
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/1001819/Downloads/PortableGit/suicideMission/constraint/button.ucf" "C:/Users/1001819/Downloads/PortableGit/suicideMission/constraint/vga.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
