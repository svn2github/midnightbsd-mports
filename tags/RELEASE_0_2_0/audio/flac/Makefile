# New ports collection makefile for:	flac
# Date created:		Mar 18, 2001
# Whom:			Ying-Chieh Liao <ijliao@FreeBSD.org>
#
# $MidnightBSD: mports/audio/flac/Makefile,v 1.4 2008/03/24 23:04:25 ctriv Exp $
# $FreeBSD: ports/audio/flac/Makefile,v 1.38 2006/05/03 05:14:16 edwin Exp $
#

PORTNAME=	flac
PORTVERSION=	1.1.2
PORTREVISION=	2
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:S/$/:sf/} \
		${MASTER_SITE_FREEBSD_LOCAL:S/$/:local/}
MASTER_SITE_SUBDIR=	${PORTNAME}/:sf naddy/:local
DISTFILES=	${EXTRACT_ONLY}:sf flac-alloc.h:local
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free lossless audio codec
LICENSE=	gpl2

LIB_DEPENDS=	ogg.5:${PORTSDIR}/audio/libogg

USE_AUTOTOOLS=	libtool:15
USE_ICONV=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--target=${ARCH}-unknown-freebsd6.0
CONFIGURE_ARGS=	--enable-sse \
		--with-libiconv-prefix="${LOCALBASE}" \
		--with-ogg="${LOCALBASE}"
CONFIGURE_ENV=	CPPFLAGS="-I${WRKSRC}/include" \
		ac_cv_path_XMMS_CONFIG=no

.if defined(NOPORTDOCS)
MAKE_ENV=	DOC=""
.else
MAKE_ENV=	DOC=doc
.endif

USE_LDCONFIG=	yes
MAN1=		flac.1 metaflac.1

.include <bsd.port.pre.mk>

.if ${ARCH} == "i386"
BUILD_DEPENDS=	nasm:${PORTSDIR}/devel/nasm
.endif

post-extract:
	@${CP} ${DISTDIR}/flac-alloc.h ${WRKSRC}/include/share/alloc.h

# "obj" is magic to our make(1)
post-configure:
	@${RM} -rf ${WRKSRC}/obj

post-build:
	${REINPLACE_CMD} 's:%%PREFIX%%:${PREFIX}:' ${WRKSRC}/man/flac.1

test: build
	@cd ${WRKSRC}; ${MAKE} check

.include <bsd.port.post.mk>
