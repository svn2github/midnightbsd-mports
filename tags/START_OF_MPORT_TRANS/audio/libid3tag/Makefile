# New ports collection makefile for:  libid3tag
# Date created:        26 November 2003
# Whom:			Sergey Akifyev <asa@gascom.ru>
#
# $MidnightBSD$
# $FreeBSD: ports/audio/libid3tag/Makefile,v 1.9 2006/02/23 10:34:33 ade Exp $
#

PORTNAME=	libid3tag
PORTVERSION=	0.15.1b
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE} \
		ftp://ftp.mars.org/pub/mpeg/
MASTER_SITE_SUBDIR=	mad

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ID3 tags library (part of MAD project)

USE_GNOME=	pkgconfig
GNU_CONFIGURE=	yes
INSTALLS_SHLIB=	yes

post-build:
	cd ${WRKSRC} && CONFIG_FILES=id3tag.pc CONFIG_HEADERS= ${SH} ./config.status

post-install:
	${MKDIR} ${PREFIX}/libdata/pkgconfig
	${INSTALL_DATA} ${WRKSRC}/id3tag.pc ${PREFIX}/libdata/pkgconfig

.include <bsd.port.mk>
