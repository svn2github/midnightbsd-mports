# New ports collection makefile for:	koffice-i18n-sr
# Date created:                         21 January 2004
# Whom:                                 Brad Davis <so14k@so14k.com>
#
# $MidnightBSD$
# $FreeBSD: ports/misc/koffice-i18n-sr@Latn/Makefile,v 1.11 2007/10/29 23:48:05 lofi Exp $
#

PORTNAME=	koffice-i18n
PORTVERSION=	1.6.3
CATEGORIES?=	misc kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/koffice-${PORTVERSION}/src/koffice-l10n
PKGNAMEPREFIX=	sr-Latn-
DISTNAME=       ${PORTNAME:S/i18n/l10n/}-sr@Latn-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Serbian (latin alphabet) messages and documentation for koffice
LICENSE=	unknown

BUILD_DEPENDS=	xgettext:${PORTSDIR}/devel/gettext

DISTNAME_OVERRIDE=yes
USE_KDELIBS_VER=3
USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
KDE_I18N=	yes

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"

.include <bsd.port.mk>
