# New ports collection makefile for:	SWIG
# Date created:			19 April 1996
# Whom:				jkh
#
# $MidnightBSD$
# $FreeBSD: ports/devel/swig13/Makefile,v 1.76 2007/09/30 04:46:46 linimon Exp $
#

PORTNAME=	swig
PORTVERSION=	1.3.31
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simplified Wrapper and Interface Generator
LICENSE=	bsd2

USE_AUTOTOOLS=	autoconf:261:env libtool:15

VER=		${PORTVERSION:R}
PLIST_SUB+=	PORTVERSION=${PORTVERSION}

# Supported languages: guile perl php4 python ruby tcl ocaml pike java csharp
#                      allegrocl modula3 chicken

WRKSRC=		${WRKDIR}/${DISTNAME}
CONFIGURE_ENV+=	CFLAGS="${CFLAGS} -fPIC -DPIC"
ALL_TARGET=	swig
PLIST_SUB+=	VER="${VER}"

.include <bsd.port.pre.mk>

post-patch:
	${REINPLACE_CMD} -e 's/SKIP_CHICKEN=$$/&"1"/' ${WRKSRC}/configure
	${REINPLACE_CMD} -e 's|$$RUBY |${RUBY} |' ${WRKSRC}/configure
	${REINPLACE_CMD} -e 's|malloc.h|stdlib.h|' \
		${WRKSRC}/Lib/lua/luarun.swg

post-configure:
	${REINPLACE_CMD} -e 's#null#&|| true#' ${WRKSRC}/Makefile

post-install:
	${LN} -f ${PREFIX}/bin/swig ${PREFIX}/bin/swig${VER}
	${MKDIR} ${EXAMPLESDIR}/${PORTVERSION}
	cd ${WRKSRC}/Examples && ${FIND} . -type d \
		-exec ${INSTALL} -d ${EXAMPLESDIR}/${PORTVERSION}/{} \;
	cd ${WRKSRC}/Examples && ${FIND} . -type f \
		-exec ${INSTALL_DATA} {} ${EXAMPLESDIR}/${PORTVERSION}/{} \;
.if	!defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}/${PORTVERSION}
	cd ${WRKSRC}/Doc && ${FIND} . -type d \
		-exec ${INSTALL} -d ${DOCSDIR}/${PORTVERSION}/{} \;
	cd ${WRKSRC}/Doc && ${FIND} . -type f \
		-exec ${INSTALL_DATA} {} ${DOCSDIR}/${PORTVERSION}/{} \;
.endif

.include <bsd.port.post.mk>
