# New ports collection makefile for:	nut
# Date created:		Tue Apr 29 12:45:30 GMT 2003
# Whom:			Kirill Ponomarew <ponomarew@oberon.net>
#
# $MidnightBSD: mports/misc/nut/Makefile,v 1.1 2008/03/24 22:12:43 laffer1 Exp $
# $FreeBSD: ports/misc/nut/Makefile,v 1.78 2008/03/19 17:32:43 sat Exp $
#

PORTNAME=	nut
PORTVERSION=	13.7
CATEGORIES=	misc
MASTER_SITES=	SF
PKGNAMEPREFIX=	health-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Nutrition software to record what you eat
LICENSE=        gpl
USE_GMAKE=	yes
PORTDOCS=	CREDITS LICENSE README nut.html
DOCSDIR=	${PREFIX}/share/doc/${UNIQUENAME}
ALL_TARGET=	${PORTNAME}
PORTDATA=	FOOD_DES.txt NUT_DATA.txt WEIGHT.lib WEIGHT.txt sr20.nut
PLIST_FILES=	bin/${PORTNAME}
MAN1=		${PORTNAME}.1
.undef		NOPORTDATA

post-patch:
	@${REINPLACE_CMD} -e "s|/usr/local/lib/nut|${DATADIR}|" \
		-e 's|^CFLAGS=|CFLAGS+=|g;s|-Os||;s|gcc|$${CC}|' ${WRKSRC}/Makefile

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin/
	@${INSTALL} -d ${DATADIR}/
	@cd ${WRKSRC}/raw.data/&&${INSTALL_DATA} ${PORTDATA} ${DATADIR}/
	@${INSTALL_MAN} ${WRKSRC}/${MAN1} ${MAN1PREFIX}/man/man1/
.ifndef NOPORTDOCS
	@${INSTALL} -d ${DOCSDIR}/
	@cd ${WRKSRC}/&&${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR}/
.endif

.include <bsd.port.mk>
