# New ports collection makefile for:	clearlooks-metacity
# Date created:		2005-03-20
# Whom:			Michael Johnson <ahze@FreeBSD.org>
#
# $MidnightBSD: mports/x11-themes/clearlooks-metacity/Makefile,v 1.1 2008/06/14 02:10:38 laffer1 Exp $
# $FreeBSD: ports/x11-themes/clearlooks-metacity/Makefile,v 1.14 2008/06/06 14:14:11 edwin Exp $
#   $MCom: ports/x11-themes/clearlooks-metacity/Makefile,v 1.3 2007/09/10 15:44:29 mezz Exp $
#

PORTNAME=	clearlooks-metacity
PORTVERSION=	2.0
PORTREVISION=	0
CATEGORIES=	x11-themes
MASTER_SITES=	http://www.stellingwerff.com/
#MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
#MASTER_SITE_SUBDIR=	clearlooks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Clearlooks Metacity theme
LICENSE=	unknown

CONFLICTS=	gnome-themes-2.11.9[1-9]* gnome-themes-2.*

WRKSRC=		${WRKDIR}/Clearlooks/metacity-1/
USE_GNOME=	metacity gnomeprefix
DATADIR=	share/themes/Clearlooks/metacity-1
NO_BUILD=	yes

PLIST_FILES=	%%DATADIR%%/metacity-theme-1.xml
PLIST_DIRS=	%%DATADIR%% \
		share/themes/Clearlooks

do-install:
	${MKDIR} ${PREFIX}/${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/metacity-theme-1.xml ${PREFIX}/${DATADIR}

.include <bsd.port.mk>
