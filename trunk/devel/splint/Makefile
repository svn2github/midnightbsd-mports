# $MidnightBSD$

PORTNAME=	splint
PORTVERSION=	3.1.2
CATEGORIES=	devel security
MASTER_SITES=	http://www.splint.org/downloads/
EXTRACT_SUFX=	.src.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool for statically checking sourcecode for security vulnerabilities

LICENSE=	gpl2

USES=		gmake
GNU_CONFIGURE=	yes
MAKE_JOBS_UNSAFE=	yes

post-patch:
	@${REINPLACE_CMD} -e \
		's|%%PREFIX%%|${PREFIX}|g' ${WRKSRC}/src/Headers/constants.h
	${FIND} ${WRKSRC} -name Makefile.in | ${XARGS} \
		 ${REINPLACE_CMD} -e '/^pkgdatadir =/s|=.*|=${DATADIR}|'

.include <bsd.port.mk>
