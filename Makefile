# Flexible Makefile for compiling Verilog code with Icarus Verilog and viewing with GTKWave

# Phony target to handle any base name
.PHONY: all clean $(MAKECMDGOALS)

# Default target
all:
	@echo "Usage: make <base_file_name_without_extension>"
	@echo "Example: make test (for test.v and test_tb.v)"

# Rule to compile, run simulation and open GTKWave
$(MAKECMDGOALS):
	@echo "Processing $@..."
	iverilog -o $@_dsn $@_tb.v $@.v && vvp $@_dsn && gtkwave $@.vcd

# Clean rule
clean:
	@echo "Cleaning up..."
	rm -f *_dsn *.vcd

