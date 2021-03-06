# New ports collection makefile for:	freetype
# Date created:		January 24, 1998
# Whom:			jseger@FreeBSD.org
#
# $MidnightBSD: mports/print/freetype/Makefile,v 1.5 2011/02/02 21:18:50 laffer1 Exp $
# $FreeBSD: ports/print/freetype/Makefile,v 1.40 2007/01/26 15:46:46 shaun Exp $
#

PORTNAME=	freetype
PORTVERSION=	1.3.1
PORTREVISION=	6
CATEGORIES=	print
MASTER_SITES=	SF \
		http://sunsite.cnlab-switch.ch/ftp/mirror/freetype/freetype1/ \
		http://www.funet.fi/pub/mirrors/ftp.freetype.org/freetype1/ \
		http://ftp.sunet.se/pub/text-processing/freetype/freetype1/ \
		${MASTER_SITE_RINGSERVER:S,%SUBDIR%,graphics/freetype/&,} \
		ftp://ftp.freetype.org/freetype/freetupe1/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A free and portable TrueType font rendering engine
LICENSE=	restricted
#apple patent whore

FAKE_OPTS+=	prefixhack

USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--disable-nls --enable-static --enable-shared

PORTSCOUT=	limit:^1\.

.ifdef USE_FREETYPE
IGNORE=	cannot be installed: you have the 'USE_FREETYPE' variable defined either in environment or in make(1) arguments. Please undefine and try again
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|$${CONFIG_SHELL-/bin/sh} $$ac_aux_dir|$$ac_aux_dir|' \
		${WRKSRC}/configure
	@${FIND} ${WRKSRC} -name Makefile.in | ${XARGS} ${REINPLACE_CMD} -e \
		's|LIBTOOL =.*|LIBTOOL = ${LIBTOOL}|'

# Older versions of freetype installed include files in ${PREFIX}/include
# this is a compatibility hack for now

#post-install:
#	${LN} -fs ${PREFIX}/include/freetype/*.h ${PREFIX}/include

.include <bsd.port.mk>
