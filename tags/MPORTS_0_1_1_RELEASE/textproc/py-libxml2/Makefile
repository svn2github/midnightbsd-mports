# New ports collection makefile for:	py-libxml2
# Date created:				30 Jun 2004
# Whom:					Alexander Nedotsukov <bland@FreeBSD.org>
#
# $FreeBSD: ports/textproc/py-libxml2/Makefile,v 1.7 2006/04/28 21:15:20 marcus Exp $
#

PORTREVISION=	0
CATEGORIES=	textproc gnome python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	gnome@FreeBSD.org
COMMENT=	Python interface for XML parser library for GNOME

MASTERDIR=	${.CURDIR}/../libxml2
BUILD_WRKSRC=	${WRKSRC}/python
INSTALL_WRKSRC=	${BUILD_WRKSRC}
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist

USE_GNOME=	gnomehack gnometarget libxml2
USE_PYTHON=	yes
CONFIGURE_ARGS=	--with-iconv=${LOCALBASE} \
		--with-html-dir=${PREFIX}/share/doc \
		--with-html-subdir=${PORTNAME} \
		--with-python=${LOCALBASE}

DOCSDIR=	${PREFIX}/share/doc/py-libxml2
EXAMPLESDIR=	${PREFIX}/share/examples/py-libxml2

post-install:
	${PYTHON_CMD} ${PYTHON_LIBDIR}/compileall.py -l -d ${LOCALBASE} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} 
	${PYTHON_CMD} -O ${PYTHON_LIBDIR}/compileall.py -l -d ${LOCALBASE} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}

.include "${MASTERDIR}/Makefile"
