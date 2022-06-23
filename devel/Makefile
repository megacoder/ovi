TARGETS=all check clean clobber distclean install uninstall
TARGET=all

PREFIX=
DISTDIR=${PREFIX}/dist
SUBDIRS=

ifeq	(${MAKE},gmake)
	INSTALL=ginstall
else
	INSTALL=install
endif

.PHONY: ${TARGETS} ${SUBDIRS}

FILES	=README.md

all::	${FILES}

${TARGETS}::

clobber distclean:: clean

install:: ${FILES}
	rsync -rav ${FILES} ${DISTDIR}/

uninstall::
	${RM} ${DISTDIR}/${FILES}

ifneq	(,${SUBDIRS})
${TARGETS}::
	${MAKE} TARGET=$@ ${SUBDIRS}
${SUBDIRS}::
	${MAKE} -C $@ ${TARGET}
endif
