# $MidnightBSD$

PORTNAME=	xdg
PORTVERSION=	0.25
CATEGORIES=	devel python
MASTER_SITES=	http://people.freedesktop.org/~takluyver/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	py${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A python library to access freedesktop.org standards

LICENSE=	lgpl

USE_PYTHON=	2
USE_PYDISTUTILS=yes
PYDISTUTILS_AUTOPLIST=	yes

post-patch:
	@${REINPLACE_CMD} -e \
		's|%%LOCALBASE%%|${LOCALBASE}|g' \
			${WRKSRC}/xdg/BaseDirectory.py

.include <bsd.port.mk>
