
# Build C static archive
libcsquare.a:
	cc -c -o square.c.o square.c
	ar rcs libcsquare.a square.c.o

# Build D static archive that depend on the C archive.
# As we are building a static lib, the dependency is loose
# and we can build without libcsquare.a being around
libdsquare.a:
	dmd -c -ofsquare.d.o square.d
	ar rcs libdsquare.a square.d.o

# Build actual executable that depends on libdsquare and libcsquare
app: libcsquare.a libdsquare.a
	dmd -ofapp app.d libdsquare.a -L-L. -L-lcsquare

clean:
	rm -f *.o *.a app
