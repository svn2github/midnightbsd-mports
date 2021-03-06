# New ports collection makefile for:    unixODBC
# Date created:         May 11, 2000
# Whom:                 Nick Sayer <nsayer@FreeBSD.org>
#
# $FreeBSD: ports/databases/unixODBC/Makefile,v 1.47 2006/08/14 22:55:04 clsung Exp $
# $MidnightBSD$
#

PORTNAME=	unixODBC
PORTVERSION=	2.2.11
PORTREVISION=	1
CATEGORIES=	databases
MASTER_SITES=	http://www.unixodbc.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ODBC library suite for Unix

CONFLICTS=	libiodbc-*

USE_GNOME=	gnomehack gnometarget
USE_ICONV=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-static --enable-shared \
		--with-libiconv-prefix=${LOCALBASE}
USE_LDCONFIG=	yes

.if defined(WITH_GUI)
USE_QT_VER=	3
QT_NONSTANDARD=	yes
CONFIGURE_ENV=	MOC="${MOC}" \
		QTINC="${QT_PREFIX}/include" \
		QTLIB="${QT_PREFIX}/lib" \
		USER_INCLUDES="${QTCPPFLAGS}" \
		USER_LDFLAGS="${QTCFGLIBS}"
CONFIGURE_ARGS+=	--enable-gui
PLIST_SUB=	GUI:=""
.else
CONFIGURE_ARGS+=	--disable-gui
PLIST_SUB=	GUI:="@comment "
.endif

.if !defined(WITHOUT_THREADS) || defined(WITH_GUI)
CONFIGURE_ARGS+=	--enable-threads=yes
.else
CONFIGURE_ARGS+=	--enable-threads=no
.endif

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${TAR} -C ${WRKSRC}/doc --exclude '*Makefile*' -cf - . \
		| ${TAR} -C ${DOCSDIR} --unlink -xf -
	@${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${DOCSDIR}
.endif

.include <bsd.port.mk>
