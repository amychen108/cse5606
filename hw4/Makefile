
CXX        = mpic++

LIBS      = -lX11 -lm

CFLAGS    = 
LDFLAGS   = -L/usr/X11R6/lib $(LIBS)

PROGRAM   = Nbody			# name of the binary
SRCS      = Gal.cpp derivs.cpp diffeq.cpp modeldata.cpp point.cpp derivs_client.cpp

default: all

all: $(PROGRAM) 

$(PROGRAM): $(SRCS)
	$(CXX) $(SRCS) $(CFLAGS) $(LDFLAGS) -o $(PROGRAM)

clean:
	/bin/rm -f $(PROGRAM)
