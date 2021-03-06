# New ports collection makefile for:	automake
# Date created:		15 March 1997
# Whom:			FUJIMOTO Kensaku <fujimoto@oscar.elec.waseda.ac.jp>
#
# $MidnightBSD$
# $FreeBSD: ports/devel/automake15/Makefile,v 1.51 2006/05/04 21:40:24 edwin Exp $
#

PORTNAME=	automake
PORTVERSION=	1.5
PORTREVISION=	2
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	automake

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Standards-compliant Makefile generator (1.5)

RUN_DEPENDS=	${AUTOCONF_DEPENDS}

USE_AUTOTOOLS=	autoconf:253:env
BUILD_VERSION=	15
PLIST_SUB=	BUILD_VERSION=${BUILD_VERSION}
LATEST_LINK=	automake${BUILD_VERSION}
USE_PERL5=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	AUTOCONF=autoconf253 AUTOHEADER=autoheader253 MAKEINFO=makeinfo
CONFIGURE_ARGS=	--program-suffix=${BUILD_VERSION}
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
INFO=		automake${BUILD_VERSION}

post-patch:
	@(cd ${WRKSRC} && \
		${RM} -f *.info && \
		${MV} automake.texi automake${BUILD_VERSION}.texi && \
		${REINPLACE_CMD} -E 's,(automake)\.(info),\1${BUILD_VERSION}\.\2,g' automake${BUILD_VERSION}.texi && \
		${REINPLACE_CMD} -E 's,(automake)\.(info|texi),\1${BUILD_VERSION}\.\2,g' Makefile.in  && \
		${REINPLACE_CMD} -e 's,%%BUILD_VERSION%%,${BUILD_VERSION},g; \
				     s,%%X11BASE%%,${X11BASE},g' aclocal.in \
	)

pre-su-install:
	@${RM} -fr ${PREFIX}/share/automake${BUILD_VERSION}
	@${MKDIR} ${PREFIX}/share/automake${BUILD_VERSION}
	@${MKDIR} ${PREFIX}/share/aclocal${BUILD_VERSION}
	@${MKDIR} ${PREFIX}/libexec/automake${BUILD_VERSION}

post-install:
.for i in aclocal automake
	@${LN} -sf ${PREFIX}/bin/${i}${BUILD_VERSION} \
		${PREFIX}/libexec/automake${BUILD_VERSION}/${i}
.endfor

.include <bsd.port.mk>
