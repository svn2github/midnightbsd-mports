# New ports collection makefile for:	courieruserinfo
# Date created:				27th July 2006
# Whom:					Andrew St. Jean <andrew@arda.homeunix.net>
#
# $FreeBSD: ports/security/courieruserinfo/Makefile,v 1.1 2006/07/27 08:07:23 clsung Exp $
# $MidnightBSD$
#

PORTNAME=	courieruserinfo
PORTVERSION=	1.1.2
CATEGORIES=	security mail
MASTER_SITES=	http://www.arda.homeunix.net/store/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	User account information retrieval utility

BUILD_DEPENDS=	courierauthconfig:${PORTSDIR}/security/courier-authlib-base
RUN_DEPENDS=	courierauthconfig:${PORTSDIR}/security/courier-authlib-base

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ENV=	CPPFLAGS='${CPPFLAGS}' LDFLAGS='${LDFLAGS}'

CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd${OSREL}

MAN8=		courieruserinfo.8

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/AUTHORS ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/ChangeLog ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/COPYING ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/INSTALL ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/NEWS ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
.endif
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
