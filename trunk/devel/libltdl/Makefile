# $MidnightBSD$
# $FreeBSD: ports/devel/libltdl/Makefile,v 1.6 2010/12/08 19:58:46 ade Exp $

PORTNAME=	libltdl
PORTREVISION=	0

COMMENT=	System independent dlopen wrapper

.include "${.CURDIR}/../libtool/Makefile.common"

LICENSE=	lgpl2.1

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-ltdl-install
INSTALL_TARGET=	install-strip
USES+=		libtool:keepla # .la file used in ltdl.m4
USE_LDCONFIG=	yes
WRKSRC_SUBDIR=	libltdl

.include <bsd.port.mk>
