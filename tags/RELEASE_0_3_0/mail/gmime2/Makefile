# $MidnightBSD: mports/mail/gmime2/Makefile,v 1.3 2008/06/23 20:14:24 laffer1 Exp $

PORTNAME=	gmime
PORTVERSION=	2.2.23
PORTREVISION?=	0
CATEGORIES?=	mail
MASTER_SITES=	http://spruce.sourceforge.net/gmime/sources/v${PORTVERSION:C/([0-9]\.[0-9]).*/\1/}/

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	Library (written in C) for parsing and creating messages using MIME
LICENSE=	lgpl

SLAVEDIRS=	mail/gmime2-sharp

USE_ICONV=	yes
USE_GMAKE=	yes
USE_GNOME?=	gnomehack gnometarget glib20
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS?=	--with-libiconv=${LOCALBASE} \
			--with-html-dir=${PREFIX}/share/doc \
			--enable-mono=no
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include ${PTHREAD_CFLAGS}" \
		LIBS="-L${LOCALBASE}/lib"

LATEST_LINK?=	${PORTNAME}2

PORTDOCS=	*

post-patch:
	@${REINPLACE_CMD} -e "s|stdint.h|inttypes.h|" ${WRKSRC}/zentimer.h

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for i in docs/reference/html/*
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
