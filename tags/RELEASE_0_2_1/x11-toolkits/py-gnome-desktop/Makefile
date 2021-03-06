# New ports collection makefile for:	py-gnome-desktop
# Date created:				20 January 2006
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/x11-toolkits/py-gnome-desktop/Makefile,v 1.1 2008/03/21 01:54:42 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/py-gnome-desktop/Makefile,v 1.8 2007/10/24 23:34:31 marcus Exp $
#    $MCom: ports/x11-toolkits/py-gnome-desktop/Makefile,v 1.65 2007/09/16 17:47:04 ahze Exp $
#

PORTNAME=	gnome
PORTVERSION=	2.22.0
CATEGORIES=	x11-toolkits python gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/gnome-python-desktop/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	-desktop
DISTNAME=	gnome-python-desktop-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A set of Python bindings used by modules in the GNOME Desktop
LICENSE=	gpl2

BUILD_DEPENDS=	bug-buddy:${PORTSDIR}/devel/bug-buddy
LIB_DEPENDS=	gtop-2.0.7:${PORTSDIR}/devel/libgtop \
		totem-plparser.7:${PORTSDIR}/multimedia/totem \
		gnome-media-profiles.0:${PORTSDIR}/audio/gnome-media \
		gnome-keyring:${PORTSDIR}/security/gnome-keyring
RUN_DEPENDS=	bug-buddy:${PORTSDIR}/devel/bug-buddy

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_PYTHON=	yes
USE_GNOME=	gnomehack libgnomeprintui gnomepanel gnomedesktop \
		gtksourceview libwnck nautiluscdburner pygnome2 metacity \
		evolutiondataserver
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-metacity
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

EG_SRC_DIR=	${WRKSRC}/examples
EG_DST_DIR=	${PREFIX}/share/examples/py-gnome
.if !defined(NOPORTDOCS)
DOCSDIR=	${PREFIX}/share/doc/py-gnome-desktop
.else
DOCSDIR=	${WRKSRC}/share/doc/py-gnome-desktop
.endif

.include <bsd.port.pre.mk>

post-patch:
	@${FIND} ${WRKSRC}/docs -name Makefile.in | ${XARGS} ${REINPLACE_CMD} \
		-e 's|^HTML_DIR =.*|HTML_DIR = ${DOCSDIR}|g'

.if !defined(NOPORTDOCS)
post-install:
	${MKDIR} ${EG_DST_DIR}
	${TAR} -C ${EG_SRC_DIR} -cf - . | ${TAR} -C ${EG_DST_DIR} -xf -
	${CHOWN} -R ${BINOWN}:${BINGRP} ${EG_DST_DIR}
	${CHMOD} -R go-w ${EG_DST_DIR}
.endif

.include <bsd.port.post.mk>
