# New ports collection makefile for:	dopewars
# Date created:			16 May 1999
# Whom:				Jim Mock <jim@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/games/dopewars/Makefile,v 1.35 2007/05/19 20:05:49 flz Exp $
#

PORTNAME=	dopewars
PORTVERSION=	1.5.12
PORTREVISION=	1
CATEGORIES=	games
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A UNIX rewrite of a game originally based on "Drug Wars"
LICENSE=	gpl2

USE_GETTEXT=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	gtk12
USE_X_PREFIX=	yes

CONFIGURE_ARGS=	--enable-networking --disable-plugins --localstatedir=${DATADIR}
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

PORTDOCS=	ABOUT-NLS AUTHORS COPYING ChangeLog INSTALL LICENCE NEWS README TODO
MAN6=	dopewars.6

post-patch:
	@${REINPLACE_CMD} -e 's!/pixmaps!/dopewars/pixmaps!' \
		${WRKSRC}/src/Makefile.in
	@${REINPLACE_CMD} -e 's!^CFLAGS =!CFLAGS = \@GLIB_CFLAGS\@!' \
		${WRKSRC}/src/gui_client/Makefile.in \
		${WRKSRC}/src/curses_client/Makefile.in
	@${REINPLACE_CMD} -e 's!install-recursive!!g' ${WRKSRC}/doc/Makefile.in

post-install:
.ifndef NOPORTDOCS
	@${INSTALL} -d ${DOCSDIR}/help
	@${INSTALL_DATA} ${WRKSRC}/doc/*html ${WRKSRC}/doc/example* ${DOCSDIR}/
	@${INSTALL_DATA} ${WRKSRC}/doc/help/*html ${DOCSDIR}/help/
	@${INSTALL_DATA} ${PORTDOCS:S.^.${WRKSRC}/.} ${DOCSDIR}/
	@${INSTALL_MAN} ${WRKSRC}/doc/dopewars.6 ${MAN6PREFIX}/man/man6/
.endif

.include <bsd.port.mk>
