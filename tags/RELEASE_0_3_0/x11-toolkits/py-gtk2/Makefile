# $MidnightBSD: mports/x11-toolkits/py-gtk2/Makefile,v 1.5 2010/08/14 03:19:12 laffer1 Exp $

PORTNAME=	py-gtk
PORTVERSION=	2.17.0
PORTREVISION=	5
CATEGORIES=	x11-toolkits python
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/pygtk/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DISTNAME=	pygtk-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A set of Python bindings for GTK+
LICENSE=	gpl2

BUILD_DEPENDS=	${PYTHON_SITELIBDIR}/cairo/__init__.py:${PORTSDIR}/graphics/py-cairo \
		${PYTHON_SITELIBDIR}/gtk-2.0/gobject/_gobject.so:${PORTSDIR}/devel/py-gobject
RUN_DEPENDS=	\
		${PYTHON_SITELIBDIR}/cairo/__init__.py:${PORTSDIR}/graphics/py-cairo \
		${PYTHON_SITELIBDIR}/gtk-2.0/gobject/_gobject.so:${PORTSDIR}/devel/py-gobject

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack libglade2
USE_PYTHON=	yes
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-lintl" \
		PYTHON="${PYTHON_VERSION}"
CONFIGURE_ARGS=	--disable-docs
LDFLAGS+=	-L${LOCALBASE}/lib

DOCSDIR=	${PREFIX}/share/doc/py-gtk
EG_SRC_DIR=	${WRKSRC}/examples
EXAMPLESDIR=	${PREFIX}/share/examples/py-gtk

CONFLICTS=	py*-gtk-0*

OPTIONS=	NUMPY "Enable numpy support (pulls in gcc44)" off

.include <bsd.port.pre.mk>

.if defined(WITH_NUMPY)
BUILD_DEPENDS+=	${PYNUMPY}
RUN_DEPENDS+=	${PYNUMPY}
CONFIGURE_ARGS+=--enable-numpy
.else
CONFIGURE_ARGS+=--disable-numpy
.endif

#
# Use the same way as the Python port to determine if we want
# threading support.
#
.if !defined(WITHOUT_THREADS)
CONFIGURE_ARGS+=	--enable-thread
CFLAGS+=		${PTHREAD_CFLAGS}
CONFIGURE_ENV+=		LDFLAGS="${PTHREAD_LIBS} ${LDFLAGS}"
.else
CONFIGURE_ARGS+=	--disable-thread
.if defined(LDFLAGS)
CONFIGURE_ENV+=		LDFLAGS="${LDFLAGS}"
.endif
.endif

post-install:
.if !defined(NOPORTEXAMPLES)
	${MKDIR} ${EXAMPLESDIR}
	${TAR} -C ${EG_SRC_DIR} -cf - . | ${TAR} -C ${EXAMPLESDIR} -xf -
	${CHOWN} -R ${BINOWN}:${BINGRP} ${EXAMPLESDIR}
	${FIND} ${EXAMPLESDIR} -type d -print | ${XARGS} ${CHMOD} 0555
	${FIND} ${EXAMPLESDIR} -type f -print | ${XARGS} ${CHMOD} 0444
.endif
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/MAPPING ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/THREADS ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
