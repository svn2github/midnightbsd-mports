# New ports collection makefile for:   orbit
# Date Created:			16 Aug 1998
# Whom:				Chia-liang Kao <clkao@CirX.ORG>
#
# $MidnightBSD$
# $FreeBSD: ports/devel/ORBit/Makefile,v 1.82 2006/05/16 04:10:37 mezz Exp $
#

PORTNAME=	ORBit
PORTVERSION=	0.5.17
PORTREVISION=	3
CATEGORIES=	devel gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/ORBit/0.5
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High-performance CORBA ORB with support for the C language

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	glib12 gnometarget
INSTALLS_SHLIB=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS= --disable-indent
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

INFO=		libIDL

post-patch:
	@${TOUCH} ${WRKSRC}/configure

post-install:
	@${ECHO_CMD} "ORBIIOPIPv4=0" > ${PREFIX}/etc/orbitrc.default
	@${ECHO_CMD} "ORBIIOPIPv6=0" >> ${PREFIX}/etc/orbitrc.default
	@if [ ! -f ${PREFIX}/etc/orbitrc ]; then \
		${CP} -p ${PREFIX}/etc/orbitrc.default ${PREFIX}/etc/orbitrc ; \
	fi

.include <bsd.port.mk>
