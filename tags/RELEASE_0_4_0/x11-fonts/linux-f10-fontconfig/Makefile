# $MidnightBSD$
# $FreeBSD: ports/x11-fonts/linux-f10-fontconfig/Makefile,v 1.27 2011/03/07 15:08:23 ehaupt Exp $

PORTNAME=	fontconfig
PORTVERSION=	2.6.0
CATEGORIES=	x11-fonts linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An XML-based font configuration API for X Windows (Linux Fedora 10)
LICENSE=	x11

CONFLICTS=	linux-fontconfig-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	expat
LINUX_DIST_VER=	10
RPMVERSION=	3.fc10
BRANDELF_DIRS=	usr/bin
USE_LDCONFIG=	yes

# We will use some other configuration file, so delete a linux one
# Don't let the linux fc-cache mess up the native cache file
post-extract:
		@${RM} -r ${WRKSRC}/etc ${WRKSRC}/usr/share/fonts ${WRKSRC}/var \
			${WRKSRC}/usr/bin/fc-cache \
			${WRKSRC}/usr/share/man/man1/fc-cache.1.gz

post-install:
		@${LN} -s ${LOCALBASE}/etc/fonts ${PREFIX}/etc/

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
