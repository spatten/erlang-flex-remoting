SUBDIRS = stock persons dynamic
ERL = erl
SERVICES = '[stock,persons,test]'

.PHONY: subdirs $(SUBDIRS)

subdirs: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

run: subdirs
	@$(ERL) -boot http -http docroot '"."' flex_services $(SERVICES) \
		-pa stock -pa persons -pa dynamic
