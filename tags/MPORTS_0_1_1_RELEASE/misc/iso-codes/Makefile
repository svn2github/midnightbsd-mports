# New ports collection makefile for:   iso-codes
# Date created:			02 April 2005
# Whom:				Koop Mast <kwm@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/misc/iso-codes/Makefile,v 1.21 2007/07/30 03:59:42 beech Exp $
#

PORTNAME=	iso-codes
DISTVERSION=	1.3
CATEGORIES=	misc
MASTER_SITES=	ftp://pkg-isocodes.alioth.debian.org/pub/pkg-isocodes/ \
		http://freebsd.powered.net/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lists of the country, language and currency iso names

BUILD_DEPENDS=	xmlproc_parse:${PORTSDIR}/textproc/py-xml

USE_BZIP2=	yes
USE_PYTHON_BUILD=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes

post-patch:
	@${REINPLACE_CMD} -e '/^pkgconfigdir =/s|=.*|=${PREFIX}/libdata/pkgconfig|'\
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
