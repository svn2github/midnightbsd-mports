# New ports collection makefile for:    libthai
# Date created:        28 March 2006
# Whom:                Thawatchai Piyawat <piyawat@usablelabs.com>
#
# $FreeBSD: ports/devel/libthai/Makefile,v 1.3 2006/03/31 10:01:33 garga Exp $
# $MidnightBSD$
#

PORTNAME=	libthai
PORTVERSION=	0.1.5
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://www.usablelabs.com/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Thai language support library

INSTALLS_SHLIB=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	automake:15 autoconf:259 libtool:15

ALL_TARGET=	all check

MAN3=	libthai.3 thctype.3 wtt.3

pre-configure:
	${SH} ${WRKSRC}/autogen.sh

post-patch:
	@${REINPLACE_CMD} -E 's,^(pkgconfigdir = ).*$$,\1$$(prefix)/libdata/pkgconfig,' \
		${WRKSRC}/Makefile.am

.include <bsd.port.mk>
