# New ports collection makefile for:	koffice-i18n-ro
# Date created:                         06 April 2006
# Whom:                                 Michael Nottebrock <michaelnottebrock@gmx.net>
#
# $MidnightBSD$
# $FreeBSD: ports/misc/koffice-i18n-ro/Makefile,v 1.11 2007/11/08 19:12:44 lofi Exp $
#

PORTNAME=	koffice-i18n
PORTVERSION=	1.5.2
PORTREVISION=	1
CATEGORIES?=	misc kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	Attic/koffice-${PORTVERSION}/src/koffice-l10n
PKGNAMEPREFIX=	ro-
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Romanian messages and documentation for koffice
LICENSE=	unknown

BUILD_DEPENDS=	xgettext:${PORTSDIR}/devel/gettext

USE_KDELIBS_VER=3
USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
KDE_I18N=	yes

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"

.include <bsd.port.mk>
