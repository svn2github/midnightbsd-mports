# New ports collection makefile for:	giFT-gnutella
# Date created:		2003-09-04
# Whom:			Stefan Ehmann <shoesoft@gmx.net>
#
# $MidnightBSD: mports/net-p2p/gift-gnutella/Makefile,v 1.1 2007/06/10 23:59:41 laffer1 Exp $
# $FreeBSD: ports/net-p2p/gift-gnutella/Makefile,v 1.9 2007/01/12 21:57:29 miwi Exp $
#

PORTNAME=	giFT-gnutella
PORTVERSION=	0.0.11
CATEGORIES=	net-p2p
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	gift
DISTNAME=	${PORTNAME:L}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A gnutella plugin for giFT
LICENSE=	gpl2

LIB_DEPENDS=	gift.0:${PORTSDIR}/net-p2p/gift

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNOME=	pkgconfig
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" \
			LDFLAGS="${LDFLAGS}"

DOC_FILES=	AUTHORS COPYING ChangeLog \
		INSTALL NEWS README TODO

post-install:
.ifndef(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for doc in ${DOC_FILES}
	@${INSTALL_DATA} ${WRKSRC}/${doc} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
