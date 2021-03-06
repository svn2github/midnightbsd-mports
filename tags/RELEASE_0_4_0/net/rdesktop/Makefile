# New ports collection makefile for:  rdesktop
# Date created:               13 December 2000
# Whom:                       mwest@uct.ac.za
#
# $MidnightBSD: mports/net/rdesktop/Makefile,v 1.5 2008/09/17 21:17:38 laffer1 Exp $
# $FreeBSD: ports/net/rdesktop/Makefile,v 1.41 2007/06/19 08:55:10 pav Exp $
#

PORTNAME=	rdesktop
PORTVERSION=	1.6.0
PORTREVISION?=	1
CATEGORIES=	net comms ipv6
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RDP client for Windows NT/2000/2003 Terminal Server
LICENSE=	gpl2

USE_XORG=	x11
USE_GMAKE=	yes
USE_OPENSSL=	yes
GNU_CONFIGURE=	yes
DOCS=		doc/AUTHORS doc/TODO doc/*.txt
MAN1=		rdesktop.1

.if !defined(WITHOUT_RDESKTOP_IPV6) && !defined(WITHOUT_IPV6)
CONFIGURE_ARGS+=	--with-ipv6
.endif

.if defined(WITH_ICONV)
USE_ICONV=	yes
CONFIGURE_ARGS+=	--with-libiconv-prefix=${LOCALBASE}
.endif

.if defined(WITH_RDESKTOP_DEBUG)
CONFIGURE_ARGS+=	--with-debug\
			--with-debug-kbd\
			--with-debug-rdp5\
			--with-debug-clipboard\
			--with-debug-sound\
			--with-debug-channel\
			--with-debug-seamless

post-configure:
	${ECHO} "#define WITH_DEBUG_SERIAL 1" >> ${WRKSRC}/rdesktop.h
.endif

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/rdesktop ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/doc/rdesktop.1 ${MAN1PREFIX}/man/man1
	@${MKDIR} ${DATADIR}/keymaps
	${INSTALL_DATA} ${WRKSRC}/keymaps/* ${DATADIR}/keymaps
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
