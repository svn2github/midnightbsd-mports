# New ports collection makefile for:	zenity
# Date created:				01 Mar 2003
# Whom:					Franz Klammer <klammer@webonaut.com>
#
# $MidnightBSD: mports/x11/zenity/Makefile,v 1.3 2008/03/14 01:46:57 laffer1 Exp $
# $FreeBSD: ports/x11/zenity/Makefile,v 1.34 2007/07/23 09:36:47 rafan Exp $
#   $MCom: ports/x11/zenity/Makefile,v 1.77 2007/03/11 19:58:27 mezz Exp $
#

PORTNAME=	zenity
PORTVERSION=	2.22.1
CATEGORIES=	x11 gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Display GNOME dialogs from the command line
LICENSE=	lgpl

BUILD_DEPENDS=        rarian-sk-config:${PORTSDIR}/textproc/rarian
RUN_DEPENDS=  rarian-sk-config:${PORTSDIR}/textproc/rarian

USE_XLIB=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack libgnomecanvas gconf2 gnomedocutils
USE_BZIP2=	yes
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
INSTALLS_OMF=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include ${PTHREAD_CFLAGS}" \
		LIBS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"

MAN1=		zenity.1

CONFLICTS=	gtkada-1.2.*

pre-configure:
	@${FIND} ${WRKSRC} -name Makefile.in | ${XARGS} ${REINPLACE_CMD} -e \
		's|@DATADIRNAME@|share|'

.include <bsd.port.mk>
