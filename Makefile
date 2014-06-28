all: spellit.ml
	corebuild spellit.native

clean:
	rm -rf _build
	rm *.cmo *.cmi *.native *.byte
