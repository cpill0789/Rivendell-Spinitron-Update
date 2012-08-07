#Makefile for Rivendell - Spinitron Update
#Suggested usage: git pull
#                 sudo make install
#
#Compile without installing: make all

INSTALLDIR=/opt/wmfo/rlm_spinitron
OWNER = root
MOD = 755
FILE = rlm_spinitron

.PHONY: all install uninstall

all: $(FILE).rlm

$(FILE).rlm: $(FILE).c
	@gcc -shared -o $@ $< -Wall -Wextra -Werror -fPIC

install: $(INSTALLDIR)/$(FILE).rlm

$(INSTALLDIR)/$(FILE).rlm: $(FILE).rlm
	@mkdir -p $(INSTALLDIR)
	@if [ -f $@ ] ; \
	then \
		cp $@ $@.bak ; \
	fi;
	@cp $< $@
	@chown $(OWNER) $@
	@chmod $(MOD) $@

uninstall:
	@$(RM) $(INSTALLDIR)/$(FILE).rlm
	@if [ -f $(INSTALLDIR)/$(FILE).rlm.bak ] ; \
	then \
		cp $(INSTALLDIR)/$(FILE).rlm.bak $(INSTALLDIR)/$(FILE).rlm ; \
		$(RM) $(INSTALLDIR)/$(FILE).rlm.bak ; \
	fi;
