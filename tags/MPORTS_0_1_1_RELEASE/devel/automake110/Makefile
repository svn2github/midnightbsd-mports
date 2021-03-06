# New ports collection makefile for:	automake110
# Date created:		5th December 2006
# Whom:			Ade Lovett <ade@FreeBSD.org>
#
# $MidnightBSD: mports/devel/automake110/Makefile,v 1.1 2007/04/07 04:01:59 laffer1 Exp $
# $FreeBSD: ports/devel/automake110/Makefile,v 1.70 2007/02/07 10:04:31 ade Exp $
#

PORTNAME=	automake
PORTVERSION=	1.10
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	automake
DISTNAME=	automake-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Standards-compliant Makefile generator (1.10)
LICENSE=	gpl2

RUN_DEPENDS=	${AUTOCONF_DEPENDS}

USE_AUTOTOOLS=	autoconf:261:env
BUILD_VERSION=	110
PLIST_SUB=	BUILD_VERSION=${BUILD_VERSION}
LATEST_LINK=	automake${BUILD_VERSION}
USE_BZIP2=	yes
USE_PERL5=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--program-suffix=${BUILD_VERSION} \
		--infodir=${PREFIX}/info --mandir=${PREFIX}/man
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
INFO=		automake${BUILD_VERSION}

.include <bsd.port.pre.mk>

CONFIGURE_ENV+=	MAKEINFO="makeinfo --no-split"

post-patch:
	@(cd ${WRKSRC}/doc && \
		${RM} -f *.info && \
		${MV} automake.texi automake${BUILD_VERSION}.texi && \
		${REINPLACE_CMD} -E 's,(automake)\.(info),\1${BUILD_VERSION}\.\2,g' automake${BUILD_VERSION}.texi && \
		${REINPLACE_CMD} -E 's,(automake)\.(info|texi),\1${BUILD_VERSION}\.\2,g' Makefile.in \
	)
	@${REINPLACE_CMD} -e 's,%%X11BASE%%,${X11BASE},g' ${WRKSRC}/aclocal.in

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

.include <bsd.port.post.mk>
