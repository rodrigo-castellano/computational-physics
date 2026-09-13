# Computational physics simulations -- Fisica Computacional, Physics BSc, UGR
#
# Fortran 77 fixed-form (.f) and Fortran 90 free-form (.f90).
# -std=legacy is required: the 77 sources use extensions modern gfortran
# rejects by default.

FC     := gfortran
FFLAGS := -O2 -std=legacy -Wall -Wno-unused-variable -Wno-unused-dummy-argument
F77    := $(FFLAGS) -ffixed-form
F90    := $(FFLAGS) -ffree-form

BIN   := bin
BUILD := build
SRC   := src

TARGETS := ising sistemasolar velocidades schrodinger nave

all: $(addprefix $(BIN)/,$(TARGETS))

$(BIN) $(BUILD):
	@mkdir -p $@

# randomnumber is a module and must be compiled before the Ising program
$(BUILD)/randomnumber.o: $(SRC)/ising/randomnumber.f | $(BUILD)
	$(FC) $(F77) -J$(BUILD) -c $< -o $@

$(BIN)/ising: $(SRC)/ising/ising.f $(BUILD)/randomnumber.o | $(BIN)
	$(FC) $(F77) -I$(BUILD) -J$(BUILD) $^ -o $@

$(BIN)/%: $(SRC)/solar-system/%.f | $(BIN)
	$(FC) $(F77) -J$(BUILD) $< -o $@
$(BIN)/%: $(SRC)/schrodinger/%.f90 | $(BIN)
	$(FC) $(F90) -J$(BUILD) $< -o $@
$(BIN)/%: $(SRC)/rocket/%.f90 | $(BIN)
	$(FC) $(F90) -J$(BUILD) $< -o $@

clean:
	rm -rf $(BIN) $(BUILD) out

.PHONY: all clean
.SECONDARY:
