# $MidnightBSD$

PORTNAME=	rtmpdump
PORTVERSION=	2.4.20130923
CATEGORIES=	multimedia net
MASTER_SITES=	FREEBSD_LOCAL/hrs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RTMP streams download utility

LICENSE=	gpl2

LIB_DEPENDS=	librtmp.so:${PORTSDIR}/multimedia/librtmp

USES=		pkgconfig
USE_OPENSSL=	yes
MAKE_ENV=	THREADLIB="${PTHREAD_LIBS}"
CFLAGS+=	${PTHREAD_CFLAGS} -I${OPENSSLINC}
LDFLAGS+=	-L${LOCALBASE}/lib -L${OPENSSLLIB}
PORTDOCS=	ChangeLog README

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDOCS}
post-install:
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
