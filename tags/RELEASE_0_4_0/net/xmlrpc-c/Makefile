# $MidnightBSD: mports/net/xmlrpc-c/Makefile,v 1.15 2013/03/03 13:39:19 laffer1 Exp $

PORTNAME=	xmlrpc-c
PORTVERSION=	1.16.44
CATEGORIES=	net
MASTER_SITES=	SF/${PORTNAME}/Xmlrpc-c%20Super%20Stable/${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	luke@MidnightBSD.org
COMMENT=	XML-RPC library for C and C++
LICENSE=	bsd3

OPTIONS=	DEBUG "Compile with debugging information" off \
		CURL "Compile with curl support" on \
		LIBWWW "Compile with libwww support" on

CONFLICTS=	xmlrpc-epi-0.*

USE_PERL5=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:env
GNU_CONFIGURE=	yes
MAKEFILE=	GNUmakefile
MAKE_ARGS=	LIBTOOL="${LIBTOOL}" \
		CFLAGS_COMMON="${CFLAGS}"
MAKE_JOBS_UNSAFE=	yes
USE_LDCONFIG=	yes

.include <bsd.port.pre.mk>

.if !defined(WITH_DEBUG)
CFLAGS+=	-DNDEBUG
.endif

.if defined(WITH_CURL)
LIB_DEPENDS+=	curl:${PORTSDIR}/ftp/curl
CONFIGURE_ARGS+=	--enable-curl-client
.else
CONFIGURE_ARGS+=	--disable-curl-client
.endif

.if defined(WITH_LIBWWW)
LIB_DEPENDS+=	wwwcore:${PORTSDIR}/www/libwww
CONFIGURE_ARGS+=	--enable-libwww-client
.else
CONFIGURE_ARGS+=	--disable-libwww-client
.endif

pre-patch:
	@${ECHO} "Port will not build with older version installed."
	@sleep 3

post-extract:
	@${FIND} ${WRKSRC} -type l -name blddir -delete
	@${FIND} ${WRKSRC} -type l -name srcdir -delete

post-patch:
	@${GREP} -lR '\-lpthread' ${WRKSRC} 2>/dev/null | \
		${XARGS} ${REINPLACE_CMD} -e 's|-lpthread|${PTHREAD_LIBS}|g'
	@${REINPLACE_CMD} -e '/#include.*features.h/d' \
		${WRKSRC}/tools/xmlrpc_pstream/xmlrpc_pstream.cpp
	@${REINPLACE_CMD} -e '/<curl\/types.h>/d' \
		${WRKSRC}/lib/curl_transport/curltransaction.c \
		${WRKSRC}/lib/curl_transport/xmlrpc_curl_transport.c \
		${WRKSRC}/lib/curl_transport/curlmulti.c

.include <bsd.port.post.mk>
