# $FreeBSD: ports/x11-wm/kompmgr/Makefile,v 1.12 2006/09/12 23:26:51 lofi Exp $
# $MidnightBSD: mports/x11-wm/kompmgr/Makefile,v 1.5 2009/09/20 02:51:25 smultron Exp $

PORTNAME=	kompmgr
PORTVERSION=	${KDE_VERSION}
PORTREVISION=	1
CATEGORIES=	x11-wm kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION:S/.0//}/src
PKGNAMEPREFIX=	kdebase-
DISTNAME=	kdebase-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility needed to enable XComposite support in KDE
LICENSE=	gpl2

USE_KDELIBS_VER=3
PREFIX=		${KDE_PREFIX}

USE_BZIP2=	yes
USE_AUTOTOOLS=  libtool:22
USE_GMAKE=	yes
USE_XORG=	x11 xrender xfixes xdamage xcomposite
WRKSRC=		${WRKDIR}/kdebase-${PORTVERSION}
USE_LDCONFIG=	yes

CONFIGURE_ARGS+=--without-java

PLIST_FILES=	bin/kompmgr

.include <bsd.port.pre.mk>

pre-configure:
	${CP} ${FILESDIR}/configure ${WRKSRC}/

do-build:
	cd ${WRKSRC}/kwin/kompmgr && \
	${CC} ${CFLAGS} -I${LOCALBASE}/include -L${X11BASE}/lib -lX11 -lXdamage\
	-lXfixes -lXrender -lXcomposite -lm -o kompmgr kompmgr.c

do-install:
	cd ${WRKSRC}/kwin/kompmgr && ${INSTALL_PROGRAM} kompmgr\
	${PREFIX}/bin/kompmgr

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"
.include <bsd.port.post.mk>
