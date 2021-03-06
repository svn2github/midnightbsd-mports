# New ports collection makefile for: nspluginwrapper
# Date created:         30 Oct 2007
# Whom:                 Lucas Holt <luke@MidnightBSD.org>
#
# $MidnightBSD: mports/www/nspluginwrapper/Makefile,v 1.5 2008/06/18 17:56:12 laffer1 Exp $
# $FreeBSD: ports/www/nspluginwrapper/Makefile,v 1.5 2007/09/01 23:15:12 pav Exp $
#

PORTNAME=	nspluginwrapper
PORTVERSION=	0.9.91.5
PORTREVISION=	1
CATEGORIES=	www linux emulators
MASTER_SITES=	http://gwenole.beauchesne.info/projects/nspluginwrapper/files/
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${RPMFILE}
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A compatibility plugin for Netscape 4 (NPAPI) plugins
LICENSE=	gpl2

EXTRACT_DEPENDS=	rpm2cpio:${PORTSDIR}/archivers/rpm
RUN_DEPENDS=	${LINUXBASE}/usr/lib/libgtk-x11-2.0.so.0:${PORTSDIR}/x11-toolkits/linux-gtk2

RPMFILE=	${PORTNAME}-i386-${PORTVERSION}-1.x86_64.rpm

ONLY_FOR_ARCHS=	i386 amd64

USE_XORG=	x11
USE_BZIP2=	yes
USE_LINUX=	yes
USE_XLIB=	yes
USE_GNOME=	glib20 pkgconfig

CFLAGS+=	-std=c99

USE_LDCONFIG=	yes
USE_GMAKE=	yes
HAS_CONFIGURE=	yes

CONFIGURE_ARGS=	--prefix=${PREFIX} --target-os=linux --target-cpu=i386 \
		--with-x11-prefix=${LOCALBASE} --with-cc=${CC} --with-cxx=${CXX} \
		--host=${ARCH}-portbld-freebsd6.0

LIBDIR=		${PREFIX}/lib/${PORTNAME}

PLIST_SUB=	LIBDIR="${LIBDIR:C/^${PREFIX}\///}" ARCH="${ARCH}"

# We must manually extract, modify, and install the Linux version of npviewer.
post-extract:
	cd ${WRKSRC} &&	rpm2cpio ${DISTDIR}/${RPMFILE} | ${CPIO} -id
	${REINPLACE_CMD} -e 's|/usr|${PREFIX}|' \
		${WRKSRC}/usr/lib/nspluginwrapper/i386/linux/npviewer
	${RM} ${WRKSRC}/usr/lib/nspluginwrapper/i386/linux/npviewer.bak

post-patch:
	@${REINPLACE_CMD} -e 's,x86_64,amd64,g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's,/usr/X11R6,${LOCALBASE},g' ${WRKSRC}/configure

post-install:
	${MKDIR} ${LIBDIR}/i386/linux
	${INSTALL_SCRIPT} ${WRKSRC}/usr/lib/nspluginwrapper/i386/linux/* \
	     ${LIBDIR}/i386/linux/

.include <bsd.port.pre.mk>

BUILD_DEPENDS+=	${LOCALBASE}/libdata/xorg/libraries:${X_LIBRARIES_PORT}
RUN_DEPENDS+=	${LOCALBASE}/libdata/xorg/libraries:${X_LIBRARIES_PORT}

.include <bsd.port.post.mk>
