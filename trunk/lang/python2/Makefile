# $MidnightBSD$

PORTNAME=	python2
PORTVERSION=	${PYTHON_MAJOR_VER}
CATEGORIES=	lang python ipv6
MASTER_SITES=	# empty
DISTFILES=	# empty
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The "meta-port" for version 2 of the Python interpreter

LICENSE=	bsd2

USE_PYTHON_RUN=	yes
PYTHON_VERSION=	${PYTHON2_DEFAULT_VERSION}
NO_BUILD=	yes
PYTHON_NO_DEPENDS=	yes

PLIST_FILES=	bin/2to3-${PYTHON_MAJOR_VER} \
		bin/idle${PYTHON_MAJOR_VER} \
		bin/pydoc${PYTHON_MAJOR_VER} \
		bin/python${PYTHON_MAJOR_VER} \
		bin/python${PYTHON_MAJOR_VER}-config \
		bin/python-shared${PYTHON_MAJOR_VER} \
		bin/python-shared${PYTHON_MAJOR_VER}-config \
		bin/smtpd${PYTHON_MAJOR_VER}.py \
		libdata/pkgconfig/python${PYTHON_MAJOR_VER}.pc

.include <bsd.port.pre.mk>

RUN_DEPENDS+=	${PYTHON_CMD}:${PYTHON_PORTSDIR}

do-install:
.for file in idle pydoc python python-shared
	${LN} -sf ${file}${PYTHON_VER} \
		${STAGEDIR}${PREFIX}/bin/${file}${PYTHON_MAJOR_VER}
.endfor
	${LN} -sf 2to3-${PYTHON_VER} \
		${STAGEDIR}${PREFIX}/bin/2to3-${PYTHON_MAJOR_VER}
	${LN} -sf smtpd${PYTHON_VER}.py \
		${STAGEDIR}${PREFIX}/bin/smtpd${PYTHON_MAJOR_VER}.py
	${LN} -sf python${PYTHON_VER}-config \
		${STAGEDIR}${PREFIX}/bin/python${PYTHON_MAJOR_VER}-config
	${LN} -sf python-shared${PYTHON_VER}-config \
		${STAGEDIR}${PREFIX}/bin/python-shared${PYTHON_MAJOR_VER}-config
	${LN} -sf python-${PYTHON_VER}.pc \
		${STAGEDIR}${PREFIX}/libdata/pkgconfig/python${PYTHON_MAJOR_VER}.pc

.include <bsd.port.post.mk>
