TARGETS=all check clean clobber distclean install uninstall
TARGET=all

PREFIX=
DISTDIR=${PREFIX}/dist
SUBDIRS=devel

ifeq	(${MAKE},gmake)
	INSTALL=ginstall
else
	INSTALL=install
endif

.PHONY: ${TARGETS} ${SUBDIRS}

all::

${TARGETS}::

clobber distclean:: clean

ifneq	(,${SUBDIRS})
${TARGETS}::
	${MAKE} TARGET=$@ ${SUBDIRS}
${SUBDIRS}::
	${MAKE} -C $@ ${TARGET}
endif
