# $MidnightBSD$
# $FreeBSD: head/x11-toolkits/py-tkinter/Makefile 326662 2013-09-07 17:21:55Z sunpoet $

PORTNAME=	tkinter
PORTVERSION=	${PYTHON_PORTVERSION}
CATEGORIES=	x11-toolkits python
MASTER_SITES=	${PYTHON_MASTER_SITES}
MASTER_SITE_SUBDIR=	${PYTHON_MASTER_SITE_SUBDIR}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${PYTHON_DISTFILE}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings to the Tk widget set

USE_PYTHON=	yes
USE_PYDISTUTILS=yes
USE_TK=		yes
USE_XZ=		yes

DIST_SUBDIR=	python
DISTINFO_FILE=	${PORTSDIR}/lang/python${PYTHON_SUFFIX}/distinfo
WRKSRC=		${PYTHON_WRKSRC}/Modules

PYDISTUTILS_INSTALLARGS+=	--install-lib ${PYTHON_LIBDIR}/lib-dynload
PYDISTUTILS_NOEGGINFO=	yes
PYDISTUTILS_PKGNAME=	Tkinter

PLIST_FILES=	%%PYTHON_LIBDIR%%/lib-dynload/_tkinter.so

.include <bsd.port.pre.mk>

post-extract:
.if ${PYTHON_REL} < 300
	@${SED} -e "s|%%TK_VER%%|${TK_VER}|" ${FILESDIR}/setup.py > ${WRKSRC}/setup.py
.else
	@${SED} -e "s|%%TK_VER%%|${TK_VER}|" ${FILESDIR}/setup3.py > ${WRKSRC}/setup.py
.endif

.include <bsd.port.post.mk>
