# $MidnightBSD$

PORTNAME=	libggz
PORTVERSION=	${GGZ_VERSION}
PORTREVISION=	4
CATEGORIES=	games

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The GGZ Gaming Zone - Base Library

LICENSE=	gpl2

LIB_DEPENDS=	gcrypt:${PORTSDIR}/security/libgcrypt

USE_AUTOTOOLS=	libtool
USE_GNOME=	gnomehack 
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
CONFIGURE_ARGS=	--disable-debug
USE_LDCONFIG=	yes

MAN3=	ggz.h.3

CPPFLAGS=	-I${LOCALBASE}/include ${PTHREAD_CFLAGS}
LDFLAGS=	-L${LOCALBASE}/lib ${PTHREAD_LIBS}

.if defined(WITH_GNUTLS)
LIB_DEPENDS+=	gnutls:${PORTSDIR}/security/gnutls
CONFIGURE_ARGS+=	--with-tls=GnuTLS
.else
USE_OPENSSL=	yes
CONFIGURE_ARGS+=	--with-tls=OpenSSL
.endif

.include <bsd.port.pre.mk>
.include "${PORTSDIR}/games/libggz/bsd.ggz.mk"
.include <bsd.port.post.mk>
