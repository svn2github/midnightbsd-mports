# New ports collection makefile for:	ConsoleKit
# Date Created:				26 Aug 2006
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/sysutils/consolekit/Makefile,v 1.3 2007/09/06 10:07:40 flz Exp $
#

PORTNAME=	consolekit
PORTVERSION=	${RELVERSION}.${SNAPSHOT}
CATEGORIES=	sysutils gnome
MASTER_SITES=	http://people.freebsd.org/~flz/local/
DISTFILES=	ConsoleKit-${PORTVERSION}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework for defining and tracking users

LIB_DEPENDS=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib

RELVERSION=	0.2.2
SNAPSHOT=	20070906

WRKSRC=		${WRKDIR}/ConsoleKit-${RELVERSION}
USE_BZIP2=	yes
USE_XORG=	x11
USE_GNOME=	gnomehack gnometarget
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--with-pid-file=/var/run/${PORTNAME}.pid

USE_RC_SUBR=	consolekit
USE_GNOME_SUBR=	yes

.include <bsd.port.mk>
