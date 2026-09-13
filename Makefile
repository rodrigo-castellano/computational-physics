# Computational physics -- UGR, Fisica Computacional
#
# Fortran 77 fixed-form (.f) and Fortran 90 free-form (.f90) sources compiled
# with gfortran. -std=legacy is required: the 77 sources use extensions that
# modern gfortran rejects by default.

FC      := gfortran
FFLAGS  := -O2 -std=legacy -Wall -Wno-unused-variable -Wno-unused-dummy-argument
F77     := $(FFLAGS) -ffixed-form
F90     := $(FFLAGS) -ffree-form

BIN   := bin
BUILD := build
SRC   := src

ISING   := ising_v2 ising_v3_observables ising_v4_observables
TARGETS := $(ISING) ising_v1_standalone sistemasolar velocidades \
           schrodinger_v1 schrodinger_v2 cuanticadef nave_v1 nave_v2 \
           circulo integral rodrigo

all: $(addprefix $(BIN)/,$(TARGETS))

$(BIN) $(BUILD):
	@mkdir -p $@

# randomnumber is a module: it must be compiled before any ising that USEs it
$(BUILD)/randomnumber.o: $(SRC)/ising/randomnumber.f | $(BUILD)
	$(FC) $(F77) -J$(BUILD) -c $< -o $@

define ising_rule
$(BIN)/$(1): $(SRC)/ising/$(1).f $(BUILD)/randomnumber.o | $(BIN)
	$$(FC) $$(F77) -I$(BUILD) -J$(BUILD) $$^ -o $$@
endef
$(foreach p,$(ISING),$(eval $(call ising_rule,$(p))))

$(BIN)/ising_v1_standalone: $(SRC)/ising/ising_v1_standalone.f | $(BIN)
	$(FC) $(F77) -J$(BUILD) $< -o $@

$(BIN)/%: $(SRC)/solar-system/%.f | $(BIN)
	$(FC) $(F77) -J$(BUILD) $< -o $@
$(BIN)/%: $(SRC)/exercises/%.f | $(BIN)
	$(FC) $(F77) -J$(BUILD) $< -o $@
$(BIN)/%: $(SRC)/schrodinger/%.f | $(BIN)
	$(FC) $(F77) -J$(BUILD) $< -o $@
$(BIN)/%: $(SRC)/schrodinger/%.f90 | $(BIN)
	$(FC) $(F90) -J$(BUILD) $< -o $@
$(BIN)/%: $(SRC)/rocket/%.f90 | $(BIN)
	$(FC) $(F90) -J$(BUILD) $< -o $@

clean:
	rm -rf $(BIN) $(BUILD)

.PHONY: all clean
.SECONDARY:
