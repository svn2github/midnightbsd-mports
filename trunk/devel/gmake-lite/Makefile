# $MidnightBSD$

PORTNAME=	make
PORTVERSION=	3.82
CATEGORIES=	devel ports-mgmt
MASTER_SITES=	GNU
PKGNAMEPREFIX=	g
PKGNAMESUFFIX=	-lite

MAINTAINER=	bapt@FreeBSD.org
COMMENT=	Minimalist version of gnu make

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

GNU_CONFIGURE=  yes
CONFIGURE_ARGS+=	--program-prefix=g \
			--program-suffix=-lite \
			--disable-nls

USES=	tar:bzip2

PLIST_FILES=	bin/gmake-lite \
		man/man1/gmake-lite.1.gz

post-patch:
	${REINPLACE_CMD} -e "s/ doc / /g" ${WRKSRC}/Makefile.in

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/make ${PREFIX}/bin/gmake-lite
	${INSTALL_MAN} ${WRKSRC}/make.1 ${PREFIX}/man/man1/gmake-lite.1

.include <bsd.port.mk>

