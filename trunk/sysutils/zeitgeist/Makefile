# $MidnightBSD$

PORTNAME=	zeitgeist
PORTVERSION=	0.8.2
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	http://launchpad.net/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}/${PORTVERSION}/+download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Event logging framework - engine

LICENSE=	lgpl

BUILD_DEPENDS=	rapper:${PORTSDIR}/textproc/raptor2 \
		${PYTHON_SITELIBDIR}/rdflib/__init__.py:${PORTSDIR}/textproc/py-rdflib
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sqlite3>0:${PORTSDIR}/databases/py-sqlite3 \
		${PYTHON_SITELIBDIR}/xdg/__init__.py:${PORTSDIR}/devel/py-xdg \
		${PYTHON_SITELIBDIR}/dbus/__init__.py:${PORTSDIR}/devel/py-dbus

USE_GNOME=	intlhack pygobject
USE_PYTHON=	yes
GNU_CONFIGURE=	yes
USES=		gmake gettext pathfix
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/bin/python|${PYTHON_CMD}|g' \
		${WRKSRC}/extra/rdfxml2py

.include <bsd.port.mk>
