# $MidnightBSD$

PORTNAME=	libtasn1
PORTVERSION=	4.1
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	libtasn1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ASN.1 structure parser library

LICENSE=	gpl3

USE_LDCONFIG=	yes
USES=		pkgconfig pathfix gmake libtool
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	DOCS

DOCS=		AUTHORS NEWS README THANKS doc/TODO \
		doc/libtasn1.html doc/libtasn1.pdf doc/libtasn1.ps

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
