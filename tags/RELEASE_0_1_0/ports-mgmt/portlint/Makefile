# New ports collection makefile for:	portlint
# Date created:		13 Jun 1997
# Whom:			Jun-ichiro itojun Hagino <itojun@itojun.org>
#
# $MidnightBSD: mports/devel/portlint/Makefile,v 1.1 2006/11/02 19:01:35 laffer1 Exp $
# $FreeBSD: ports/devel/portlint/Makefile,v 1.112 2006/08/11 15:52:23 marcus Exp $
#
# This port is self contained in the src directory.
#

PORTNAME=	portlint
PORTVERSION=	2.9.1
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A verifier for mports directory

NO_BUILD=	yes
WRKSRC=		${WRKDIR}/src
USE_PERL5_RUN=	yes

SRC=		${.CURDIR}/src

MAN1=		portlint.1

do-fetch:
	@${DO_NADA}

pre-patch:
	@${CP} -R ${SRC} ${WRKDIR}

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/bin/perl|${PERL}|' ${WRKSRC}/portlint.pl
	@${REINPLACE_CMD} -e 's|/usr/bin/perl|${PERL}|' \
		${WRKSRC}/portlintgrep.pl

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/portlint.pl ${TARGETDIR}/bin/portlint
	${INSTALL_MAN} ${WRKSRC}/portlint.1 ${MAN1PREFIX}/man/man1
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/portlintgrep.pl ${EXAMPLESDIR}/portlintgrep

.include <bsd.port.mk>
