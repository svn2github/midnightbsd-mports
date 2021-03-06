# $MidnightBSD$

PORTNAME=	tarsnap
PORTVERSION=	1.0.35
CATEGORIES=	sysutils
MASTER_SITES=	http://www.tarsnap.com/download-http/
DISTNAME=	${PORTNAME}-autoconf-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Online encrypted backup service (client)

LICENSE=	tarsnap
LICENSE_NAME=	The Tarsnap License
LICENSE_FILE=	${WRKSRC}/COPYING
LICENSE_PERMS=	dist-mirror pkg-mirror

GNU_CONFIGURE=	yes
USES=		gmake

MAN1=		tarsnap.1 tarsnap-keygen.1 tarsnap-keymgmt.1	\
		tarsnap-keyregen.1 tarsnap-recrypt.1
MAN5=		tarsnap.conf.5

OPTIONS_DEFINE=	SSE2
SSE2_DESC=	Use SSE2-optimized code

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MSSE2}
CONFIGURE_ARGS+=	--enable-sse2
CFLAGS+=		-msse2
.else
CONFIGURE_ARGS+=	--disable-sse2
.endif

# safety check to ensure that we don't violate the license
.if exists(${PATCHDIR})
LICENSE_PERMS=	no-dist-mirror no-pkg-mirror
RESTRICTED=	license only allows redistribution and use of unmodified source and binaries
.endif

post-install:
	@if [ ! -f ${PREFIX}/etc/tarsnap.conf ]; then \
	    ${CP} -p ${PREFIX}/etc/tarsnap.conf.sample ${PREFIX}/etc/tarsnap.conf ; \
	fi

.include <bsd.port.mk>
