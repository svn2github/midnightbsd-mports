# $MidnightBSD$

PORTNAME=	udns
PORTVERSION=	0.4
CATEGORIES=	dns
MASTER_SITES=	http://www.corpit.ru/mjt/udns/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DNS resolver library with sync and async queries

LICENSE=	lgpl2.1

HAS_CONFIGURE=	yes
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	IPV6 DOCS

ALL_TARGET=	staticlib shared

PORTDOCS=	*

SHLIB_MAJOR=	0

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MIPV6}
CONFIGURE_ARGS+=	--enable-ipv6
.else
CONFIGURE_ARGS+=	--disable-ipv6
.endif

post-build:
	@cd ${WRKSRC} && ${STRIP_CMD} dnsget_s ex-rdns_s rblcheck_s

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/libudns.so.${SHLIB_MAJOR} \
		${PREFIX}/lib/libudns.so.${SHLIB_MAJOR}
	${LN} -sf ${PREFIX}/lib/libudns.so.${SHLIB_MAJOR} \
		${PREFIX}/lib/libudns.so
	${INSTALL_DATA} ${WRKSRC}/udns.h ${PREFIX}/include/udns.h
	${INSTALL_DATA} ${WRKSRC}/libudns.a ${PREFIX}/lib/libudns.a
	${INSTALL_PROGRAM} ${WRKSRC}/dnsget_s ${PREFIX}/bin/dnsget
	${INSTALL_PROGRAM} ${WRKSRC}/rblcheck_s ${PREFIX}/bin/rblcheck
.for FILE in dnsget.1 rblcheck.1
	${INSTALL_MAN} ${WRKSRC}/${FILE} ${MANPREFIX}/man/man1/${FILE}
.endfor
.for FILE in udns.3
	${INSTALL_MAN} ${WRKSRC}/${FILE} ${MANPREFIX}/man/man3/${FILE}
.endfor

post-install:
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
.for FILE in NEWS NOTES TODO
	${INSTALL_DATA} ${WRKSRC}/${FILE} ${DOCSDIR}/${FILE}
.endfor
.endif

.include <bsd.port.mk>
