# $MidnightBSD: mports/multimedia/gstreamer-plugins-good/Makefile,v 1.1 2007/10/22 02:58:06 laffer1 Exp $
# $FreeBSD: ports/multimedia/gstreamer-plugins-good/Makefile,v 1.7 2007/06/19 12:55:04 ahze Exp $

PORTREVISION=	0
CATEGORIES=	multimedia

COMMENT=	Good gstreamer-plugins

GST_PLUGIN=	good
GST_PLUGIN_SUFFIX=	-good

MASTERDIR=	${.CURDIR}/../../multimedia/gstreamer-plugins

BUILD_DEPENDS+=	gstreamer-plugins>=${GST_VERSION}${GST_MINOR_VERSION}:${PORTSDIR}/multimedia/gstreamer-plugins
RUN_DEPENDS+=	gstreamer-plugins>=${GST_VERSION}${GST_MINOR_VERSION}:${PORTSDIR}/multimedia/gstreamer-plugins

gst_good_DIST=	good
GOOD_GST_DIRS=	gst sys po
PLIST_SUB=	VERSION="${GST_VERSION}"

PLIST=	${.CURDIR}/pkg-plist
FILESDIR=${.CURDIR}/files
PATCHDIR=${.CURDIR}/files
NO_GSTREAMER_COMMON=	yes

do-build:
.for dir in ${GOOD_GST_DIRS}
	@(cd ${BUILD_WRKSRC}/${dir}; ${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} ${FAKE_MAKEARGS} ${ALL_TARGET})
.endfor

do-install:
.for dir in ${GOOD_GST_DIRS}
	@(cd ${INSTALL_WRKSRC}/${dir} && ${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} ${FAKE_MAKEARGS} ${INSTALL_TARGET})

.endfor

.include "${MASTERDIR}/Makefile"
