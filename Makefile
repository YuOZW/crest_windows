PROG = 'bin/crest'

OBJDIR = build
#--------------------------------------------------------------------------

MODULES += classes.o 
MODULES += setdg.o
MODULES += atmasses.o
MODULES += ls_rmsd.o
MODULES += iomod.o
MODULES += filemod.o
MODULES += syscheck.o
MODULES += axis_module.o
MODULES += zdata.o
MODULES += strucreader.o
MODULES += msmod.o
MODULES += thermo.o

CFILES += symmetry2.o
CFILES += symmetry_i.o
CFILES += signal.o
CFILES += sigterm.o

OBJS1 += data.o
OBJS1 += io.o

OBJS2 += flexi.o
OBJS2 += trialmd.o
OBJS2 += neighbor.o
OBJS2 += prmat.o
OBJS2 += readl.o
OBJS2 += scratch.o
OBJS2 += sdfio.o
OBJS2 += shortpath.o

OBJS3 += cleanup.o
OBJS3 += confcross.o
OBJS3 += confopt.o
OBJS3 += confparse.o
OBJS3 += constraining.o
OBJS3 += cregen.o
OBJS3 += ccegen.o
OBJS3 += deprotonate.o
OBJS3 += dft_propcalc.o
OBJS3 += ensemblecomp.o
OBJS3 += eval_timer.o
OBJS3 += freqmasses.o
OBJS3 += identifiers.o
OBJS3 += intmodes.o
OBJS3 += ligands.o
OBJS3 += minitools.o
OBJS3 += ncigeo.o
OBJS3 += newcregen.o
OBJS3 += normmd.o
OBJS3 += ompmklset.o
OBJS3 += printouts.o
OBJS3 += progressbar.o
OBJS3 += propcalc.o
OBJS3 += protonate.o
OBJS3 += quicksort.o
OBJS3 += rotcompare.o
OBJS3 += select.o
OBJS3 += sortens.o
OBJS3 += spline.o
OBJS3 += tautomerize.o
OBJS3 += thermocalc.o
OBJS3 += trackorigin.o
OBJS3 += utilities.o
OBJS3 += xtbmodef.o
OBJS3 += zsort.o

OBJS4 += geo.o
OBJS4 += ztopology.o
OBJS4 += floydwarshall.o
OBJS4 += bondconstraint.o
OBJS4 += stereoisomers.o
OBJS4 += marqfit.o
OBJS4 += entropy.o
OBJS4 += entropic.o
OBJS4 += reactor.o
OBJS4 += compress.o
OBJS4 += relaxensemble.o
OBJS4 += acidbase.o
OBJS4 += biasmerge.o
OBJS4 += volume.o
OBJS4 += solvtool.o
OBJS4 += solvtool_misc.o

#mainfile for crest binary
MAINFILES += confscript1.o
MAINFILES += confscript2_main.o
MAINFILES += confscript2_misc.o
MAINFILES += confscript3.o
MAINFILES += msreact.o
MAINFILES += pka.o
MAINFILES += crest_main.o 

OBJS := $(MODULES) $(CFILES) $(OBJS1) $(OBJS2) $(OBJS3) $(OBJS4) $(MAINFILES)
#--------------------------------------------------------------------------

SUBDIRS = . qcg

vpath % $(SUBDIRS)
OBJS := $(addprefix $(OBJDIR)/, $(OBJS))
#--------------------------------------------------------------------------

FC := x86_64-w64-mingw32-gfortran
CC := x86_64-w64-mingw32-gcc

LINKER := $(FC) -fopenmp
LIBS := '$(HOME)/bin/OpenBLAS-0.3.17/lib/libopenblas.a' '$(HOME)/bin/OpenBLAS-0.3.17/lib/libopenblas.dll.a'

FFLAGS := -O2 -fopenmp -I'$(HOME)/bin/OpenBLAS-0.3.17/include'
CCFLAGS := -O2

.PHONY: all
.PHONY: setup
.PHONY: clean

all: setup
all: $(PROG)
setup: $(OBJDIR)

#--------------------------------------------------------------------------
# Setting the rules to make the object files:
#--------------------------------------------------------------------------

# aus *.f mache ein *.o
$(OBJDIR)/%.o: %.f
	@echo "making $@ from $<"
	$(FC) $(FFLAGS) $(INC) -c $< -o $@

$(OBJDIR)/%.o: %.f90
	@echo "making $@ from $<"
	$(FC) $(FFLAGS) -c $< -o $@

$(OBJDIR)/%.o: %.F90
	@echo "making $@ from $<"
	$(FC) $(FFLAGS) -c $< -o $@

# aus *.c mache ein *.o
$(OBJDIR)/%.o: %.c
	@echo "making $@ from $<"
	$(CC) $(CCFLAGS) -c $< -o $@

# linken
$(PROG): $(OBJS)
	$(LINKER) $(OBJS) $(LIBS) -o $(PROG)

$(OBJDIR):
	mkdir -p $@

#aufraeumen
clean:
	rm -f $(filter %.o,$(OBJS)) $(PROG)
	rm -f $(OBJDIR)/*.mod *.mod $(PROG)
	rm -f $(patsubst %.F, %.f, $(wildcard *.F))

