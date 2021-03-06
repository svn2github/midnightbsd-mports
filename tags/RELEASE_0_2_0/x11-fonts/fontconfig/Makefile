# New ports collection makefile for:	fontconfig
# Date created:		06 October 2002
# Whom:			Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $FreeBSD: ports/x11-fonts/fontconfig/Makefile,v 1.69 2007/07/28 18:19:09 marcus Exp $
# $MidnightBSD: mports/x11-fonts/fontconfig/Makefile,v 1.6 2007/10/04 20:00:20 ctriv Exp $
#   $MCom: ports/x11-fonts/fontconfig/Makefile,v 1.12 2007/02/02 19:49:43 mezz Exp $
#

PORTNAME=	fontconfig
PORTVERSION=	2.5.0
PORTEPOCH?=	1
CATEGORIES=	x11-fonts
MASTER_SITES=	http://fontconfig.org/release/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An XML-based font configuration API for X Windows
LICENSE=	x11

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	freetype.9:${PORTSDIR}/print/freetype2 \
		expat.6:${PORTSDIR}/textproc/expat2

USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:15
USE_GNOME=	gnomehack gnometarget pkgconfig ltverhack
CONFIGURE_ARGS=	--with-confdir=${PREFIX}/etc/fonts \
		--with-expat-includes=${LOCALBASE}/include \
		--with-expat-lib=${LOCALBASE}/lib \
		--with-default-fonts=${LOCALBASE}/lib/X11/fonts \
		--with-cache-dir=/var/db/fontconfig \
		--without-add-fonts \
		--disable-docs
MAKE_ENV=	LC_ALL=C
SUB_FILES=	pkg-install
PKGINSTALL=	${WRKDIR}/pkg-install

MAN1=		fc-cache.1 fc-cat.1 fc-list.1 fc-match.1
MAN5=		fonts-conf.5
PORTDOCS=	fontconfig-user.html fontconfig-user.pdf fontconfig-user.txt

.include <bsd.port.pre.mk>

.if exists(${LOCALBASE}/bin/docbook2man)
USE_DOCBOOK2MAN=	yes
BUILD_DEPENDS+=		${LOCALBASE}/share/sgml/docbook/4.1:${PORTSDIR}/textproc/docbook-410
.endif

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/doc/|} ${DOCSDIR}
.endif
	${INSTALL_MAN} ${MAN5:S|^|${WRKSRC}/doc/|} ${PREFIX}/man/man5
.if !defined(USE_DOCBOOK2MAN)
.for manpage in ${MAN1}
	${INSTALL_MAN} ${FILESDIR}/${manpage} ${PREFIX}/man/man1
.endfor
.endif
	if [ ! -f ${PREFIX}/etc/fonts/fonts.conf ]; then \
		${INSTALL_DATA} ${WRKSRC}/fonts.conf ${PREFIX}/etc/fonts/fonts.conf; \
		${INSTALL_DATA} ${WRKSRC}/fonts.conf ${PREFIX}/etc/fonts/fonts.conf.default; \
	else \
		${INSTALL_DATA} ${WRKSRC}/fonts.conf ${PREFIX}/etc/fonts/fonts.conf.default; \
	fi

.include <bsd.port.post.mk>

.endif
