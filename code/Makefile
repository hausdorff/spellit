all: spellit.ml histogram.mli histogram.ml text.ml text.mli
	corebuild spellit.native

run: all
	./spellit.native

clean:
	rm -rf _build
	rm *.cmo *.cmi *.native *.byte
