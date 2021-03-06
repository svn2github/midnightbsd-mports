# $MidnightBSD: mports/x11-fonts/fontconfig/Makefile,v 1.13 2013/01/19 04:23:09 laffer1 Exp $

PORTNAME=	fontconfig
PORTVERSION=	2.9.0
PORTEPOCH?=	1
CATEGORIES=	x11-fonts
MASTER_SITES=	http://www.freedesktop.org/software/fontconfig/release/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An XML-based font configuration API for X Windows
LICENSE=	x11

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	freetype:${PORTSDIR}/print/freetype2 \
		expat:${PORTSDIR}/textproc/expat2

USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
USE_GNOME=	gnomehack pkgconfig ltverhack
CONFIGURE_ARGS=	--with-confdir=${PREFIX}/etc/fonts \
		--with-expat-includes=${LOCALBASE}/include \
		--with-expat-lib=${LOCALBASE}/lib \
		--with-default-fonts=${PREFIX}/share/fonts \
		--with-add-fonts=${LOCALBASE}/lib/X11/fonts \
		--with-cache-dir=/var/db/fontconfig \
		--disable-docs
MAKE_ENV=	LC_ALL=C
MAKE_JOBS_SAFE=	yes
PKGINSTALL=	${WRKDIR}/pkg-install

MAN1=		fc-cache.1 fc-cat.1 fc-list.1 fc-match.1 fc-query.1 fc-scan.1
MAN5=		fonts-conf.5
PORTDOCS=	fontconfig-user.html fontconfig-user.pdf fontconfig-user.txt

.include <bsd.port.pre.mk>

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/doc/|} ${DOCSDIR}
.endif
	${INSTALL_MAN} ${MAN5:S|^|${WRKSRC}/doc/|} ${PREFIX}/man/man5
.for manpage in ${MAN1}
	${INSTALL_MAN} ${FILESDIR}/${manpage} ${PREFIX}/man/man1
.endfor
	if [ ! -f ${PREFIX}/etc/fonts/fonts.conf ]; then \
		${INSTALL_DATA} ${WRKSRC}/fonts.conf ${PREFIX}/etc/fonts/fonts.conf; \
		${INSTALL_DATA} ${WRKSRC}/fonts.conf ${PREFIX}/etc/fonts/fonts.conf.default; \
	else \
		${INSTALL_DATA} ${WRKSRC}/fonts.conf ${PREFIX}/etc/fonts/fonts.conf.default; \
	fi
	@${SED} -e 's|%%PREFIX%%|${PREFIX}| ; \
		s|%%LOCALBASE%%|${LOCALBASE}|' < ${FILESDIR}/pkg-install.in \
		> ${PKGINSTALL}

.include <bsd.port.post.mk>

.endif
