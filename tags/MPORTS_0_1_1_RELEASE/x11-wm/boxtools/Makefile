# New ports collection makefile for:	boxtools
# Date created:		September 11, 2002
# Whom:			Stijn Hoop <stijn@win.tue.nl>
#
# $MidnightBSD: mports/x11-wm/boxtools/Makefile,v 1.1 2006/09/17 04:48:51 archite Exp $
# $FreeBSD: ports/x11-wm/boxtools/Makefile,v 1.7 2006/07/04 01:49:04 rafan Exp $
#

PORTNAME=	boxtools
PORTVERSION=	0.70.1
PORTREVISION=	1
CATEGORIES=	x11-wm
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	blackboxwm
DISTNAME=	blackbox-${PORTVERSION}

MAINTAINER=	A.J.Caines@halplant.com
COMMENT=	Style tools for the blackbox family of window managers

CONFLICTS=	blackbox-0.[7-9]*

MAN1=		bsetbg.1 bsetroot.1
PORTDOCS=	README.bbtools README.bsetbg
PLIST_FILES=	bin/bsetbg bin/bsetroot

USE_XLIB=	yes
GNU_CONFIGURE=	yes
USE_ICONV=	yes
USE_GCC=	3.3+

pre-patch:
	@${REINPLACE_CMD} -e 's#PACKAGE=blackbox#PACKAGE=boxtools#' \
		-e 's#-pedantic##' ${WRKSRC}/configure

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/util/bsetbg ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/util/bsetroot ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/doc/bsetbg.1 ${PREFIX}/man/man1
	${INSTALL_MAN} ${WRKSRC}/doc/bsetroot.1 ${PREFIX}/man/man1

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
