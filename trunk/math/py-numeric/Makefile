# $MidnightBSD$

PORTNAME=	numeric
PORTVERSION=	24.2
PORTREVISION=	3
CATEGORIES=	math python
MASTER_SITES=	http://numpy.scipy.org/:doc \
		SF/numpy/Old%20Numeric/${PORTVERSION}:source
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	Numeric-${PORTVERSION}${EXTRACT_SUFX}:source \
		numpy.pdf:doc
EXTRACT_ONLY=	Numeric-${PORTVERSION}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Numeric Extension to Python

LICENSE=	mit

USE_PYTHON=		yes
USE_PYDISTUTILS=	yes
PYDISTUTILS_AUTOPLIST=	yes

WRKSRC=		${WRKDIR}/Numeric-${PORTVERSION}

DOCSDIR=	${PREFIX}/share/doc/py-numeric
EXAMPLESDIR=	${PREFIX}/share/examples/py-numeric
PORTDOCS=	*
PORTEXAMPLES=	*

OPTIONS_DEFINE=	DOCS EXAMPLES

.include <bsd.port.pre.mk>

post-extract:
	@${CP} ${DISTDIR}/numpy.pdf ${WRKDIR}
#
# Force the setup.py file to use a specific version of Python,
# since more than one may be installed, and we want to use
# the correct one, because if one has setuptools and another
# doesn't, that could mess with how pkg-plist is constructed.
#
	@${REINPLACE_CMD} \
		-e "s|/usr/bin/env python|/usr/bin/env python${PYTHON_VER}|" \
		-e 's,distutils\.command\.install ,setuptools\.command\.install ,' \
		${WRKSRC}/setup.py

post-install:
	@${INSTALL} -d ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/Demo/*.py ${EXAMPLESDIR}
	@${INSTALL} -d ${EXAMPLESDIR}/NumTut
	${INSTALL_DATA} ${WRKSRC}/Demo/NumTut/* ${EXAMPLESDIR}/NumTut
	@${INSTALL} -d ${DOCSDIR}
	${INSTALL_DATA} ${WRKDIR}/numpy.pdf ${DOCSDIR}

.include <bsd.port.post.mk>
