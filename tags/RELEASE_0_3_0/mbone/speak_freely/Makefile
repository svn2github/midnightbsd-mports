# $MidnightBSD: mports/mbone/speak_freely/Makefile,v 1.1 2007/04/05 00:41:03 laffer1 Exp $

PORTNAME=	speak_freely
PORTVERSION=	7.6a
CATEGORIES=	mbone audio security
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME:S/_/-/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Voice communication over data networks
LICENSE=	agg

LIB_DEPENDS=	gsm.1:${PORTSDIR}/audio/gsm

UTILS=		sfspeaker sfmike sflwl sflaunch
DEMNS=		sfecho sflwld sfreflect
DDEMNS=		sfvod
SFLIB=		${PREFIX}/lib/speak_freely
MAN1=		${UTILS:S/$/.1/} ${DEMNS:S/$/.1/} ${DDEMNS:S/$/.1/}

MAKE_ENV=	"OPTFLAGS=${CFLAGS}"

do-install:
	if [ ! -d ${SFLIB} ]; then \
		${INSTALL} -d -o ${BINOWN} -g ${BINGRP} -m 755 ${SFLIB}; \
	fi
	cd ${WRKSRC}; \
	$(INSTALL_DATA) busy.au ring.au ${SFLIB}
	cd ${WRKSRC}; \
	for p in ${UTILS}; do \
		$(INSTALL_PROGRAM) $$p ${PREFIX}/bin; \
		$(INSTALL_MAN) $$p.1 ${PREFIX}/man/man1; \
	done;
	cd ${WRKSRC}; \
	for p in ${DEMNS}; do \
		$(INSTALL_PROGRAM) $$p ${PREFIX}/sbin; \
		$(INSTALL_MAN) $$p.1 ${PREFIX}/man/man1; \
	done;
	cd ${WRKSRC}; \
	for p in ${DDEMNS}; do \
		$(INSTALL_SCRIPT) $$p ${PREFIX}/sbin; \
		$(INSTALL_MAN) $$p.1 ${PREFIX}/man/man1; \
	done;

.include <bsd.port.mk>
