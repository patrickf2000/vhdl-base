# The files
FILES		= src/or.vhdl src/and.vhdl src/not.vhdl
SIMDIR		= sim
SIMTOP		= gates_tb
SIMFILES	= test/gates_tb.vhdl

# GHDL
GHDL_CMD	= ghdl
GHDL_FLAGS	= --ieee=synopsys --warn-no-vital-generic
GHDL_WORKDIR = --workdir=sim --work=work
GHDL_STOP	= --stop-time=40ns

# For visualization
VIEW_CMD        = /usr/bin/gtkwave

# The commands
all:
	make compile
	make run
	make view

compile:
	mkdir -p sim
	ghdl -a $(GHDL_FLAGS) $(GHDL_WORKDIR) $(FILES)
	ghdl -a $(GHDL_FLAGS) $(GHDL_WORKDIR) $(SIMFILES)
	ghdl -e $(GHDL_FLAGS) $(GHDL_WORKDIR) $(SIMTOP)

run:
	ghdl -r $(GHDL_FLAGS) $(GHDL_WORKDIR) $(SIMTOP) $(GHDL_STOP) --wave=sim/wave.ghw

view:
	gtkwave sim/wave.ghw

clean:
	$(GHDL_CMD) --clean --workdir=sim
