# $MidnightBSD$

PORTNAME=	faac
PORTVERSION=	1.28
CATEGORIES=	audio
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}-src/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MPEG-2 and MPEG-4 AAC audio encoder

LICENSE=	restricted

LIB_DEPENDS=	mp4v2.0:${PORTSDIR}/multimedia/mpeg4ip-libmp4v2

RESTRICTED=	Distribution in binary form is prohibited

USES=		gmake tar:bzip2
USE_DOS2UNIX=	yes
USES=	aclocal autoheader automake autoconf libtool
ACLOCAL_ARGS=	-I . -I ${LOCALBASE}/share/aclocal
AUTOMAKE_ARGS=	--add-missing
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		LIBS="-lmp4v2"
USE_LDCONFIG=	yes

.include <bsd.port.pre.mk>

post-patch:
	@${ECHO_CMD} "" >> ${WRKSRC}/libfaac/psych.h

pre-configure:
	@cd ${WRKSRC}; ${SETENV} ${AUTOTOOLS_ENV} ${LIBTOOLIZE} --automake

.include <bsd.port.post.mk>
