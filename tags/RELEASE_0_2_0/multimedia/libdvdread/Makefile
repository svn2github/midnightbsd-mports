# New ports collection makefile for:	libdvdread
# Date created:				24 Jun 2001
# Whom:					Marc van Woerkom <3d@freebsd.org>
#
# $MidnightBSD: mports/multimedia/libdvdread/Makefile,v 1.2 2007/06/11 02:13:42 laffer1 Exp $
# $FreeBSD: ports/multimedia/libdvdread/Makefile,v 1.20 2006/05/10 22:37:31 edwin Exp $
#

PORTNAME=	libdvdread
PORTVERSION=	0.9.7
PORTREVISION=	2
CATEGORIES=	multimedia
MASTER_SITES=	http://www.dtek.chalmers.se/groups/dvd/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	This is needed by ogle, which is a DVD player that supports DVD menus and libxine.

LIB_DEPENDS=	dvdcss.${DVDCSS_LIBVERSION}:${PORTSDIR}/multimedia/libdvdcss

GNU_CONFIGURE=	yes
INSTALLS_SHLIB=	yes

DOC_FILES=	AUTHORS COPYING NEWS README TODO

# allow build with more warnings enabled
.if defined(NO_WERROR)
CONFIGURE_ARGS+=	--disable-warnings
.endif

# ugly hack to have libdvdread directly depend on libdvdcss since
# it already does for practical reasons even though not for compile
# time ones
DVDCSS_LIBVERSION=	2

post-patch:
.for p in Makefile.in dvdread/Makefile.in src/Makefile.in
	@${REINPLACE_CMD} -E -e 's|cd \$$\(top_srcdir\) && \$$\(AUTOMAKE\)|\#|; \
		s|cd \$$\(srcdir\) && \$$\(ACLOCAL\)|\#|' ${WRKSRC}/${p}
.endfor
# update this in sync with libdvdcss shared library version
	@${REINPLACE_CMD} -E -e 's|(libdvdcss.so).2|\1.${DVDCSS_LIBVERSION}|' \
		${WRKSRC}/dvdread/dvd_input.c

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in ${DOC_FILES}
	@${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
