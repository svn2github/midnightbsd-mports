# New ports collection makefile for:	nodebrain
# Date created:		2 January 2007
# Whom:			Phil Pereira <phil@bsdnexus.com>
#
# $MidnightBSD$
#

PORTNAME=	nodebrain
PORTVERSION?=	0.6.5
CATEGORIES?=	sysutils
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	nodebrain
DISTNAME=	nb-0.6.5-source
WRKSRC=		${WRKDIR}/nb-0.6.5

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open Source Agent for Event Monitoring Applications

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=       --build=${MACHINE_ARCH}-portbld-midnightbsd
CONFIGURE_ENV+=		LIBS=-lm

MAN1=		NodeBrain.1 nb.1 nodebrain.1
MAN3=		nb.3 nb.lib.3
MAN5=		nb.5 nb.cfg.5 nb.syn.5 private.nb.5 host.nb.5
MAN7=		nb.man.7 nb.7 nb.mod.7

.include <bsd.port.mk>
