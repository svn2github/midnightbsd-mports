# $MidnightBSD: mports/misc/getopt/Makefile,v 1.3 2012/03/02 01:14:42 laffer1 Exp $

PORTNAME=	getopt
PORTVERSION=	1.1.5
PORTREVISION=	1
CATEGORIES=	misc
MASTER_SITES=	http://software.frodo.looijaard.name/getopt/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A getopt(1) replacement that supports GNU-style long options
LICENSE=	gpl2

FAKE_OPTS+=	trueprefix

USE_GETTEXT=		yes
USE_GMAKE=		yes

CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -lintl
MAKE_ENV=	LIBCGETOPT=0

MAN1=		getopt.1
DOCS=		Changelog README

post-patch:
	@${REINPLACE_CMD} -e 's|CC=gcc|CC=${CC}|' ${WRKSRC}/Makefile

.if !defined(NOPORTDOCS)
post-install:
	@${MKDIR} ${DOCSDIR}
	@cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
