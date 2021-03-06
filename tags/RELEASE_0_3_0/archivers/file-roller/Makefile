# New ports collection makefile for:	fileroller
# Date created:				18 May 2002
# Whom:					Anders Nordby <anders@FreeBSD.org>
#
# $MidnightBSD: mports/archivers/file-roller/Makefile,v 1.6 2008/09/30 23:39:12 laffer1 Exp $
# $FreeBSD: ports/archivers/file-roller/Makefile,v 1.65 2007/07/03 06:38:06 marcus Exp $
#

PORTNAME=	file-roller
PORTVERSION=	2.26.3
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	archivers gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An archive manager for zip files, tar, etc
LICENSE=	gpl2

OPTIONS=	NAUTILUS	"Enable Nautilus extension"	on

RUN_DEPENDS=	${LOCALBASE}/bin/gtar:${PORTSDIR}/archivers/gtar

USE_LDCONFIG=	yes
USE_BZIP2=	yes
USE_GETTEXT=	yes
INSTALLS_OMF=	yes
INSTALLS_ICONS=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix intlhack gnomehack desktopfileutils gnomedocutils \
		gtk20 gconf2
USE_XORG=	sm
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

PORTDOCS=	AUTHORS NEWS README TODO ChangeLog
GCONF_SCHEMAS=	file-roller.schemas

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_NAUTILUS)
USE_GNOME+=	nautilus2
PLIST_SUB+=	NAUTILUS=""
.else
PLIST_SUB+=	NAUTILUS="@comment "
CONFIGURE_ARGS+=	--disable-nautilus-actions
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' \
		${WRKSRC}/src/fr-command-tar.c

post-install:
	@-update-desktop-database
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.post.mk>
