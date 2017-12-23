# w11: PDP 11/70 CPU and SoC

### Overview
The project contains the VHDL code for a **complete DEC PDP-11 system**:
a PDP-11/70 CPU with memory management unit, but without floating point unit,
a complete set of mass storage peripherals
(RK11/RK05, RL11/RL02, RK70/RP06, TM11/TU10)
and a basic set of UNIBUS peripherals
(DL11, LP11, PC11),
and last but not least a cache and memory controllers for SRAM and PSRAM.
The design is **FPGA proven**, runs currently on
Digilent Arty, Basys3, CmodA7, Nexys4, Nexys3, Nexys2 and S3board boards
and boots 5th Edition UNIX and 2.11BSD UNIX. 

For more information look into:
- w11 project [home page](https://wfjm.github.io/home/w11/)
  and [blog](https://wfjm.github.io/blogs/w11/)
- [change log](doc/CHANGELOG.md)
  and [installation notes](doc/INSTALL.md)
- guides to build bit files and test benches
  with [Xilinx Vivado](doc/README_buildsystem_Vivado.md.html)
  and [Xilinx ISE](doc/README_buildsystem_ISE.md.html)
- guides to [run test benches](doc/w11a_tb_guide.md)
  and to [boot operating systems](doc/w11a_os_guide.md)
- known issues [general](doc/README_known_issues.md)
  and [w11a CPU](doc/w11a_known_issues.md)

A short description of the directory layout
[is provided separately](https://wfjm.github.io/home/w11/impl/dirlayout.html),
the top level directories are

| Directory | Content |
| --------- | ------- |
| [doc](doc)     | documentation |
| [rtl](rtl)     | HDL sources (mostly vhdl) |
| [tools](tools) | many tools |

### Note on freecores/w11
The [freecores team](http://freecores.github.io/) created in 2014 a
copy of almost all OpenCores cores in Github under
[freecores](https://github.com/freecores). This created
[freecores/w11](https://github.com/freecores/w11)
which is 
[*outdated* and *not maintained*](https://github.com/freecores/w11/issues/1).
***Only [wfjm/w11](https://github.com/wfjm/w11) is maintained***.
