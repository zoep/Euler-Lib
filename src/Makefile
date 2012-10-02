MODULES = \
	  euler

MLI = $(MODULES:=.mli)
CMI = $(MODULES:=.cmi)
CMX = $(MODULES:=.cmx)
SRC = $(MLI) $(MODULES:=.ml)

.PHONY: all opt cmxs doc install uninstall clean

all: 
	ocamlc -a -o euler.cma $(SRC)

opt: 
	ocamlopt -a -o euler.cmxa $(SRC)

cmxs: opt
	ocamlopt -shared -linkall euler.cmxa -o euler.cmxs

doc:
	ocamlc -c $(MLI)
	ocamldoc -sort -html -colorize-code -d ../doc/ $(MLI)

install:
	ocamlfind install euler META euler.cma $(MLI) $(CMI) -optional euler.cmxa $(CMX) euler.cmxs euler.a euler.lib

uninstall:
	ocamlfind remove euler


clean:
	rm -f *.cmo *.cmx *.o *.obj *.cmi *.cma *.cmxa *.cmxs *.a *.lib ../doc/*.html


