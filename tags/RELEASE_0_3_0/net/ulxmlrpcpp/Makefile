# ex:ts=8
# Ports collection makefile for:	ulxmlrpcpp
# Date created:			Feb 26, 2008
# Whom:				Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/net/ulxmlrpcpp/Makefile,v 1.2 2009/06/27 23:22:58 laffer1 Exp $
#

PORTNAME=	ulxmlrpcpp
PORTVERSION=	1.7.4
CATEGORIES=	net devel
MASTER_SITES=	SF
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An ultra lightweight xml-rpc library written in C++
LICENSE=	lgpl

LIB_DEPENDS=	expat.6:${PORTSDIR}/textproc/expat2

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

USE_BZIP2=	yes
USE_GNOME=	gnomehack gnometarget
USE_ICONV=	yes
USE_OPENSSL=	yes
USE_AUTOTOOLS=	libtool:22
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}" \
		PTHREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		PTHREAD_LIBS="${PTHREAD_LIBS}"
USE_LDCONFIG=	yes

CPPFLAGS=	-I${LOCALBASE}/include
LDFLAGS=	-L${LOCALBASE}/lib

post-patch:
	@${REINPLACE_CMD} -e \
		'/^SUBDIRS/s| docs | |g' ${WRKSRC}/ulxmlrpcpp/Makefile.in

.include <bsd.port.mk>
