# $MidnightBSD$

PORTNAME=	db
PORTVERSION=	20140725
CATEGORIES=	print
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	danilo
		
PKGNAMEPREFIX=	foomatic-
DISTNAME=	${PKGNAMEPREFIX}${PORTNAME}-${FOOMATICVER}-${PORTVERSION}

MAINTAINER=	danilo@FreeBSD.org
COMMENT=	Database for integrating printer drivers with common spoolers

LICENSE=	gpl2

LIB_DEPENDS=	libxml2.so:${PORTSDIR}/textproc/libxml2 \
		libcurl.so:${PORTSDIR}/ftp/curl

USES=		gmake
USE_AUTOTOOLS=	automake:env autoconf
GNU_CONFIGURE=	yes

FOOMATICVER=	4.0
WRKSRC=	${WRKDIR}/${PKGNAMEPREFIX}${PORTNAME}-${PORTVERSION}
NO_ARCH=	yes

.include <bsd.port.mk>
