# $MidnightBSD$

PORTNAME=	libspf2
PORTVERSION=	1.2.10
CATEGORIES=	mail
MASTER_SITES=	http://www.libspf2.org/spf/ \
		FREEBSD_LOCAL/sunpoet

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sender Rewriting Scheme 2 C Implementation

LICENSE=	bsd2
# dual license

CONFLICTS=	${PORTNAME}-1.0.* p5-Mail-SPF-[0-9]* p5-Mail-SPF-Query-[0-9]*

GNU_CONFIGURE=	yes
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|-lpthread|-pthread|g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e '/__VA_ARGS__/ s|format, ||g' ${WRKSRC}/src/include/spf_log.h

.include <bsd.port.mk>
