# Ports collection makefile for:	giblib
# Date created:				12 Nov 2000
# Whom:					Jeremy Norris <ishmael27@home.com>
#
# $MidnightBSD: mports/graphics/giblib/Makefile,v 1.1 2006/09/26 15:45:34 archite Exp $
# $FreeBSD: ports/graphics/giblib/Makefile,v 1.20 2006/05/07 23:46:02 edwin Exp $
#

PORTNAME=	giblib
PORTVERSION=	1.2.4
PORTREVISION=	3
CATEGORIES=	graphics devel
MASTER_SITES=	http://linuxbrit.co.uk/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A utility library that includes a wrapper for imlib2

LIB_DEPENDS=	Imlib2.3:${PORTSDIR}/graphics/imlib2

USE_GNOME=	gnomehack gnometarget pkgconfig
GNU_CONFIGURE=	yes
INSTALLS_SHLIB=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|: install-docsDATA|:|g' ${WRKSRC}/Makefile.in

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in AUTHORS ChangeLog README TODO
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
