# New ports collection makefile for: midnightbsd-desktop
# Date created:		July 4, 2008
# Whom:			Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/x11/windowmaker-desktop/Makefile,v 1.5 2007/11/08 23:34:06 laffer1 Exp $
#

PORTNAME=	midnightbsd-desktop
PORTVERSION=	1.0
CATEGORIES=	misc
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=     luke@MidnightBSD.org
COMMENT=        MidnightBSD desktop environment
LICENSE=	agg

# needs firefox ?
# gimp:${PORTSDIR}/graphics/gimp-app \
# gdm:${PORTSDIR}/x11/gdm \

RUN_DEPENDS=	startkde:${PORTSDIR}/x11/kde-lite \
		bash:${PORTSDIR}/shells/bash \
		kword:${PORTSDIR}/editors/koffice-kde3 \
		smbd:${PORTSDIR}/net/samba3 \
		cupsd:${PORTSDIR}/print/cups-base \
		pidgin:${PORTSDIR}/net-im/pidgin \
		${LOCALBASE}/etc/rc.d/bsdstats.sh:${PORTSDIR}/sysutils/bsdstats

USE_XORG=	x11
USE_PERL5_RUN=	yes
USE_PYTHON_RUN=	yes

NO_WRKSUBDIR=	YES
NO_BUILD=	YES

do-install: # empty

.include <bsd.port.mk>
