# New ports collection makefile for:    gnustep-gui
# Date created:         19 April 2001
# Whom:                 Thomas Gellekum <tg@FreeBSD.org>
#
# $MidnightBSD: mports/x11-toolkits/gnustep-gui/Makefile,v 1.8 2007/11/07 20:20:18 ctriv Exp $
# $FreeBSD: ports/x11-toolkits/gnustep-gui/Makefile,v 1.83 2006/08/31 05:37:04 dinoex Exp $
#

PORTNAME=	gnustep-gui
.if defined(WITH_GNUSTEP_DEVEL)
PORTVERSION=	0.13.2
.else
PORTVERSION=	0.12.1
.endif
CATEGORIES=	x11-toolkits gnustep
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	core

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep GUI library
LICENSE=	gpl3

LIB_DEPENDS+=	tiff.4:${PORTSDIR}/graphics/tiff
LIB_DEPENDS+=	png.5:${PORTSDIR}/graphics/png
LIB_DEPENDS+=	audiofile.0:${PORTSDIR}/audio/libaudiofile
LIB_DEPENDS+=	ungif.5:${PORTSDIR}/graphics/libungif

GNU_CONFIGURE=	yes
CPPFLAGS+=	"-I/usr/local/include"
LDFLAGS+=	"-L/usr/local/lib"
CONFIGURE_TARGET=
CONFIGURE_ARGS+=	--with-tiff-library=${LOCALBASE}/lib
CONFIGURE_ARGS+=	--with-tiff-include=${LOCALBASE}/include
CONFIGURE_ARGS+=	--with-jpeg-library=${LOCALBASE}/lib
CONFIGURE_ARGS+=	--with-jpeg-include=${LOCALBASE}/include
CONFIGURE_ARGS+=	--with-x
CONFIGURE_ARGS+=	--with-x-include=${LOCALBASE}/include
CONFIGURE_ARGS+=	--with-x-include=${LCOALBASE}/lib
CONFIGURE_ENV+=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_CONFIGURE=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_BASE=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}
USE_XORG=	x11 xt

EXTRA_PATCHES+=	${FILESDIR}/GNUmakefile.patch
MAKE_FLAGS+=	OPTFLAG="${CFLAGS}"
BREAKS_IF_PEDANTIC=	yes

PLIST_SUB+=	BASEVERSION=${PORTVERSION:C/[.][0-9]*$//1}

.if defined(WITHOUT_GNUSTEP_FAKEMAIN)
.if !exists(/proc/curproc)
IGNORE=		requires procfs mounted to build or run, for details see procfs(5)
.endif
.endif

.if !defined(WITHOUT_PORTAUDIO2) && !defined(WITHOUT_PORTAUDIO)
LIB_DEPENDS+=	portaudio:${PORTSDIR}/audio/portaudio2
CPPFLAGS+=	-I${LOCALBASE}/include/portaudio2 ${PTHREAD_CFLAGS}
CFLAGS+=	${PTHREAD_CFLAGS}
LDFLAGS+=	-L${LOCALBASE}/lib/portaudio2 ${PTHREAD_LIBS}
ADDITIONAL_INCLUDE_DIRS+=	-I${LOCALBASE}/include/portaudio2
ADDITIONAL_LDFLAGS+=	-L${LOCALBASE}/lib/portaudio2
PLIST_SUB+=	WITH_PORTAUDIO=""
.else
PLIST_SUB+=	WITH_PORTAUDIO="@comment "
.endif

.if !defined(WITHOUT_CUPS)
LIB_DEPENDS+=	cups.2:${PORTSDIR}/print/cups-base
PLIST_SUB+=	WITH_CUPS=""
.else
PLIST_SUB+=	WITH_CUPS="@comment "
.endif

ASPELL_PORT?=	textproc/aspell
.if !defined(WITHOUT_ASPELL)
LIB_DEPENDS+=	aspell:${PORTSDIR}/${ASPELL_PORT}
PLIST_SUB+=	WITH_ASPELL=""
.else
PLIST_SUB+=	WITH_ASPELL="@comment "
.endif

pre-configure:
.for file in config.guess config.sub install-sh
	@${CP} ${PREFIX}/System/Library/Makefiles/${file} ${WRKSRC}
.endfor
.if !defined(NOPORTDOCS)
	${REINPLACE_CMD} -e "s|doc=no|doc=yes|" ${WRKSRC}/GNUmakefile
.endif

.include <bsd.port.mk>
