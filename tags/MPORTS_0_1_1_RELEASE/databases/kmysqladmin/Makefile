# New ports collection makefile for:	kmysqladmin
# Date created:				Aug 12, 2005
# Whom:					Igor Leonenko <bananaz@bk.ru>
#
# $MidnightBSD$
# $FreeBSD: ports/databases/kmysqladmin/Makefile,v 1.4 2007/06/17 06:25:04 itetcu Exp $
#

PORTNAME=	kmysqladmin
PORTVERSION=	0.7.2
CATEGORIES=	databases
MASTER_SITES=	http://www.alwins-world.de/programs/download/kmysqladmin/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A graphical frontend for administration of mysql servers

USE_AUTOTOOLS=	libtool:15
USE_MYSQL=	yes
USE_XLIB=	yes
USE_QT_VER=	3
USE_KDELIBS_VER=3
USE_GETTEXT=	yes
INSTALLS_ICONS=	yes

CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0

.include <bsd.port.mk>
