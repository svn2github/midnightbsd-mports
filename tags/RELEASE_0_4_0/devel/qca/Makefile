# $MidnightBSD: mports/devel/qca/Makefile,v 1.3 2011/02/02 20:17:34 laffer1 Exp $

PORTNAME=	qca
PORTVERSION=	2.0.3
CATEGORIES=	devel
MASTER_SITES=	http://delta.affinix.com/download/qca/2.0/
DISTNAME=	qca-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform crypto API for QT
LICENSE=	lgpl

USE_BZIP2=	yes
USE_QT4=	corelib qmake_build moc_build
HAS_CONFIGURE=	yes
QT_NONSTANDARD=	yes
CONFIGURE_ARGS+=--prefix=${PREFIX}
CONFIGURE_ENV+=	QMAKESPEC=${QMAKESPEC}
USE_OPENSSL=	yes
USE_LDCONFIG=	yes

MAN1=		qcatool2.1

.if defined(PACKAGE_BUILDING)
CONFIGURE_ENV+=	QC_VERBOSE=Y
.endif

.if defined(MAINTAINER_MODE)
USE_QT4+=	qtestlib
.else
CONFIGURE_ARGS+=--disable-tests
.endif

.if !defined(WITH_DEBUG)
CONFIGURE_ARGS+=--release --no-separate-debug-info
PLIST_SUB+=	DEBUG="@comment "
.else
CONFIGURE_ARGS+=--debug
PLIST_SUB+=	DEBUG=""
.endif

pre-configure:
	${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|g' ${WRKSRC}/configure
	${MKDIR} ${WRKSRC}/libdata/pkgconfig

post-install:
	${STRIP_CMD} ${PREFIX}/bin/qcatool2 ${PREFIX}/lib/libqca.so.${PORTVERSION}

.include <bsd.port.mk>
