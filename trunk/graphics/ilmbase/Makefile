# $MidnightBSD$

PORTNAME=	ilmbase
PORTVERSION=	1.0.1
PORTREVISION=	1
CATEGORIES=	graphics devel
MASTER_SITES=	${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=	openexr

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ILM Base libraries a.k.a. Half, IlmThread, Imath and Iex
LICENSE=	ilm

OPTIONS=	THREAD	"Enable multithreaded file I/O support"	on

USE_GNOME=	pkgconfig
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
USE_AUTOTOOLS=	libtool

regression test check:	build
	@(cd ${WRKSRC}; ${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} check)

.include <bsd.port.pre.mk>

.if defined(WITH_THREAD)
CONFIGURE_ENV+=	PTHREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		PTHREAD_LIBS="${PTHREAD_LIBS}"
.else
CONFIGURE_ARGS+=--disable-threading
.endif

.include <bsd.port.post.mk>
