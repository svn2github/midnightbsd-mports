# New ports collection makefile for:	e2fsprogs-libblkid
# Date created:				2007-09-07
# Whom:					Matthias Andree <matthias.andree@gmx.de>
#
# $MidnightBSD: mports/misc/e2fsprogs-libblkid/Makefile,v 1.1 2008/05/30 19:40:51 laffer1 Exp $
# $FreeBSD: ports/misc/e2fsprogs-libblkid/Makefile,v 1.1 2007/10/02 15:50:56 timur Exp $
#
# set PORTREVISION to avoid override by master port

PORTREVISION=	0
CATEGORIES=	misc devel
PKGNAMESUFFIX=	-libblkid

COMMENT=	A blkid library from e2fsprogs package

LIB_DEPENDS=	uuid.1:${PORTSDIR}/misc/e2fsprogs-libuuid

CONFIGURE_ARGS=	--enable-elf-shlibs

WITHOUT_NLS=	yes
MASTERDIR=	${.CURDIR}/../../sysutils/e2fsprogs
MAKE_ARGS=	LIB_SUBDIRS=lib/blkid
USE_GMAKE=	yes
USE_LDCONFIG=	yes
ALL_TARGET=	libs
INSTALL_TARGET=	install install-shlibs
INSTALL_WRKSRC=	${WRKSRC}/lib/blkid
MAKE_JOBS_UNSAFE=	yes

MAN3=		libblkid.3

PKGDIR=		${.CURDIR}

pre-build:
	${MKDIR} ${WRKSRC}/lib/blkid/elfshared
	cd ${WRKSRC}/util && ${GMAKE} subst

post-build:
	cd ${WRKSRC}/lib/uuid && ${GMAKE}
	cd ${INSTALL_WRKSRC} && ${GMAKE} check

.include "${MASTERDIR}/Makefile"
