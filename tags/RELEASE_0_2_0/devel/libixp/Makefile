# New ports collection makefile for:	libixp
# Date created:				31 December 2006
# Whom:					Phil Pereira <phil@bsdnexus.com>
#
# $MidnightBSD: mports/devel/libixp/Makefile,v 1.6 2007/12/06 00:38:31 laffer1 Exp $
#

PORTNAME=	libixp
PORTVERSION=	0.4
CATEGORIES=	devel
MASTER_SITES=	http://www.suckless.org/download/
FAKE_OPTS=	prefixhack

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A stand-alone client/server 9P library
LICENSE=	unknown

USE_LDCONFIG=	yes
CFLAGS+=	-I. -I${WRKSRC}/include -fPIC
LDFLAGS+=	-L. -L${WRKSRC}/lib
MAKE_ARGS=	PREFIX="${PREFIX}" CC="${CC} -c" LD="${CC}" \
		CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" \
		MANPREFIX="${MANPREFIX}/man"

MAN1=		ixpc.1

post-patch: .SILENT
	${REINPLACE_CMD} -e 's|\.a|.so|g; s|{AR}|{LD} -shared -fPIC -o|' \
		${WRKSRC}/mk/lib.mk ${WRKSRC}/mk/hdr.mk
# Fix garbled "awk" strings after previous sed(1) invocation
	${REINPLACE_CMD} -e 's|\.sowk|.awk|' ${WRKSRC}/mk/hdr.mk
	${REINPLACE_CMD} -e 's|\(echo.*\)AR|\1LD|' ${WRKSRC}/mk/lib.mk
	${REINPLACE_CMD} -e 's|$${ROOT}/lib/libixp.a|-lixp|' \
		${WRKSRC}/cmd/Makefile
	${REINPLACE_CMD} -e 's|VERSION|"${PORTVERSION}"|' \
		${WRKSRC}/cmd/ixpc.c

# XXX Apparently, vendor's install: target is broken for us XXX
do-install:
	${INSTALL_DATA} ${WRKSRC}/include/ixp.h ${PREFIX}/include
	${INSTALL_DATA} ${WRKSRC}/include/ixp_fcall.h ${PREFIX}/include
	${INSTALL_PROGRAM} ${WRKSRC}/lib/libixp.so ${PREFIX}/lib/libixp.so.1
	${INSTALL_PROGRAM} ${WRKSRC}/lib/libixp_pthread.so \
		${PREFIX}/lib/libixp_pthread.so.1
	${LN} -sf libixp.so.1 ${PREFIX}/lib/libixp.so
	${LN} -sf libixp_pthread.so.1 ${PREFIX}/lib/libixp_pthread.so
	${INSTALL_PROGRAM} ${WRKSRC}/cmd/ixpc.O ${PREFIX}/bin/ixpc
	${INSTALL_MAN} ${WRKSRC}/man/ixpc.1 ${MANPREFIX}/man/man1

.include <bsd.port.mk>
