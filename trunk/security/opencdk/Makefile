# $MidnightBSD$

PORTNAME=	opencdk
PORTVERSION=	0.6.6
PORTREVISION=	5
PORTEPOCH=	1
CATEGORIES=	security
MASTER_SITES=	http://josefsson.org/gnutls/releases/opencdk/
MASTER_SITE_SUBDIR=	alpha/gnutls/opencdk

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open Crypto Development Kit
LICENSE=	gpl2

LIB_DEPENDS=	gcrypt:${PORTSDIR}/security/libgcrypt

GNU_CONFIGURE=	yes
USE_BZIP2=	yes
USES=		pkgconfig
USE_GNOME=	ltverhack
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--with-libgcrypt-prefix=${LOCALBASE}

DOCS=		AUTHORS NEWS README THANKS doc/opencdk-api.html

post-patch:
	@${REINPLACE_CMD} -e 's,(libdir)/pkgconfig,(prefix)/libdata/pkgconfig,' \
		${WRKSRC}/src/Makefile.in

post-install:
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/tests/*.c ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/tests/*.gpg ${EXAMPLESDIR}
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
