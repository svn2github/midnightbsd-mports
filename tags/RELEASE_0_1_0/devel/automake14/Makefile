# New ports collection makefile for:	automake
# Date created:		15 March 1997
# Whom:			FUJIMOTO Kensaku <fujimoto@oscar.elec.waseda.ac.jp>
#
# $MidnightBSD: mports/devel/automake14/Makefile,v 1.1 2006/09/20 02:13:36 archite Exp $
# $FreeBSD: ports/devel/automake14/Makefile,v 1.60 2006/05/04 21:40:24 edwin Exp $
#

PORTNAME=	automake
PORTVERSION=	1.4.6
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	automake
DISTNAME=	automake-1.4-p6

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Standards-compliant Makefile generator (1.4)

RUN_DEPENDS=	${AUTOCONF_DEPENDS}

USE_AUTOTOOLS=	autoconf:213:env
BUILD_VERSION=	14
PLIST_SUB=	BUILD_VERSION=${BUILD_VERSION}
LATEST_LINK=	automake${BUILD_VERSION}
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	PERL=${PERL}
CONFIGURE_ARGS=	--program-suffix=${BUILD_VERSION}
USE_PERL5=	yes
INFO=		automake${BUILD_VERSION}

STRIP=		# none

post-patch:
	@${MV} ${WRKSRC}/automake.texi ${WRKSRC}/automake${BUILD_VERSION}.texi
	@${RM} ${WRKSRC}/*.info* ${WRKSRC}/*.dvi >/dev/null 2>&1 || true

pre-configure:
	@${REINPLACE_CMD} -i -e "s,%%X11BASE%%,${X11BASE}," \
		${WRKSRC}/aclocal.in

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
