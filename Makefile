VERSION=1.0

SYSCONFDIR = /etc
SVDIR = $(SYSCONFDIR)/s6/sv

PKG ?=

SRVDIR=$(SYSCONFDIR)/s6/sv/$(PKG)_srv
LOGDIR=$(SYSCONFDIR)/s6/sv/$(PKG)_log

PKG_SRV = \
	$(wildcard ${PKG}/${PKG}-srv-*)

PKG_LOG = \
	$(wildcard ${PKG}/${PKG}-log-*)

PKG_SV = \
	$(wildcard ${PKG}/${PKG}.*)

DIRMODE = -dm0755
FILEMODE = -m0644

SV = \%$(PKG).
SRV =
LOG =

RESULT= $(subst $(PKG),$(SV),$(PKG_SRV))

install:
	@echo $(RESULT)

# ifeq ($(PKG_SRV),)
# 	install $(DIRMODE) $(DESTDIR)$(SRVDIR)
# 	install $(FILEMODE) $(PKG_SRV) $(DESTDIR)$(SRVDIR)
# endif
#
# ifeq ($(PKG_LOG),)
# 	install $(DIRMODE) $(DESTDIR)$(LOGDIR)
# 	install $(FILEMODE) $(PKG_LOG) $(DESTDIR)$(LOGDIR)
# endif
#
# ifeq ($(PKG_SV),)
# 	install $(DIRMODE) $(DESTDIR)$(SVDIR)/${PKG}
# 	install $(FILEMODE) $(PKG_SV) $(DESTDIR)$(SVDIR)/${PKG}
# endif

PHONY: install
