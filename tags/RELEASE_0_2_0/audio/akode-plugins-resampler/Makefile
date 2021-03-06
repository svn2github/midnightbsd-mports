# New ports collection makefile for:	mpeglib_artsplug
# Date created:				July 09 2004
# Whom:					Michael Nottebrock <lofi@FreeBSD.org>
#
# $FreeBSD: ports/audio/akode-plugins-resampler/Makefile,v 1.14 2006/09/17 19:59:22 lofi Exp $
# $MidnightBSD: mports/audio/akode-plugins-resampler/Makefile,v 1.2 2007/08/07 03:46:36 ctriv Exp $
#

PORTNAME=   akode-plugins-${PORTNAMESUFX}
PORTVERSION=    2.0.1
PORTEPOCH=  1
CATEGORIES= audio kde
MASTER_SITES=   ${MASTER_SITE_GENTOO}
MASTER_SITE_SUBDIR=distfiles
DISTNAME=   30375-akode-${PORTVERSION}.tar.bz2
EXTRACT_SUFX=   # none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Resampler plugin for akode
LICENSE=	gpl2

LIB_DEPENDS=	samplerate:${PORTSDIR}/audio/libsamplerate

CONFLICTS=	kdemultimedia-3.[1-3]*

PLUGIN=		src_resampler
PORTNAMESUFX=	${PLUGIN:S/_sink//:S/_decoder//:S/src_//}

USE_AUTOTOOLS=	libltdl
USE_AUTOTOOLS=  libtool:15
USE_BZIP2=	yes
USE_GMAKE=	yes
WRKSRC=		${WRKDIR}/akode-${PORTVERSION}
USE_LDCONFIG=	yes

CONFIGURE_ENV+=	LDFLAGS=-L${WRKSRC}/akode/lib/.libs
CONFIGURE_ARGS+=--with-extra-libs=${LOCALBASE}/lib \
		--with-extra-includes=${LOCALBASE}/include

post-patch:
	@${SETENV} TZ=UTC \
	${TOUCH} -t 200607222217.01 ${WRKSRC}/akode/lib/akode_export.h.in

pre-configure:
	@${REINPLACE_CMD} -e 's@%%SUBDIRS%%@${PLUGIN}@g' ${WRKSRC}/akode/plugins/Makefile.in

do-build:
	cd ${WRKSRC}/akode && ${GMAKE}

do-install:
	cd ${WRKSRC}/akode/plugins/${PLUGIN} && ${GMAKE} ${FAKE_MAKEARGS} install

.include <bsd.port.mk>
