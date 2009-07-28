ERL=erl
ERLC=erlc
ERLCFLAGS+=-W +debug_info
ERLS=test.erl
MXMLC=mxmlc
MXMLFLAGS=-services "services-config.xml"
MXMLS=dynamic.mxml
BEAMS=$(ERLS:.erl=.beam)
SWFS=$(MXMLS:.mxml=.swf)

.PHONY: clean
.SUFFIXES: .beam .erl .swf .mxml

all: $(BEAMS) $(SWFS)

.erl.beam:
	$(ERLC) $(ERLCFLAGS) $<

.mxml.swf:
	$(MXMLC) $(MXMLFLAGS) $<

dynamic.swf: dynamic.as

clean:
	rm -f $(BEAMS) $(SWFS)

