# $MidnightBSD$

PORTNAME=	mpg123
PORTVERSION=	1.20.1
CATEGORIES=	audio ipv6
MASTER_SITES=	SF \
		http://www.mpg123.de/download/

MAINTAINER=	ports@midnightbsd.org
COMMENT=	Command-line player for MPEG layer 1, 2 and 3 audio

LICENSE=	lgpl2.1

USES=		tar:bzip2 gmake libtool:keepla pathfix
USES=	libltdl
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-optimization=0 \
		--with-audio=oss \
		--with-default-audio=oss
CONFIGURE_ENV=	CONFIG_SHELL=${SH}
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.pre.mk>

.if ${ARCH} == "i386"
.if ${MACHINE_CPU:M3dnow}
WITH_CPU=	3dnow
.elif ${MACHINE_CPU:Msse}
WITH_CPU=	sse
.elif ${MACHINE_CPU:Mi586}
WITH_CPU=	i586
.elif ${MACHINE_CPU:Mi486}
WITH_CPU=	i486
.endif
.elif ${ARCH} == "amd64"
WITH_CPU=	x86-64
.endif

.if defined(WITH_CPU)
CONFIGURE_ARGS+=	--with-cpu=${WITH_CPU}
.endif

.include <bsd.port.post.mk>
