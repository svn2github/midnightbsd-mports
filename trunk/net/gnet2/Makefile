# $MidnightBSD$

PORTNAME=	gnet
PORTVERSION=	2.0.8
PORTREVISION=	2
CATEGORIES=	net ipv6
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A simple network library built upon Glib-2

LICENSE=	lgpl

USES=		pkgconfig
USES=	libtool
USE_GNOME=	gnomehack glib20
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

.if !defined(NOPORTDOCS)
CONFIGURE_ARGS+=	--with-html-dir=${DOCSDIR}
.else
CONFIGURE_ARGS+=	--without-html-dir
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|GNET_INTERFACE_AGE=0|GNET_INTERFACE_AGE=8|g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
