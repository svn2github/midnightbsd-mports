# $MidnightBSD$

PORTNAME=	alsa-lib
PORTVERSION=	1.0.28
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	ALSA/lib \
		GENTOO/distfiles

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ALSA compatibility library

LICENSE=	lgpl2.1

USES=		tar:bzip2 libtool:keepla
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--with-pkgconfdir="${PREFIX}/libdata/pkgconfig"
INSTALL_TARGET=	install-strip
CPPFLAGS+=	-I${FILESDIR}

OPTIONS_DEFINE=	PYTHON
OPTIONS_SUB=	yes

PYTHON_CONFIGURE_ENABLE=python
PYTHON_USE=	PYTHON=2

post-patch:	.SILENT
	${REINPLACE_CMD} -e '/LIBS/ { s/-ldl//g; s/-lrt//g; }' \
		-e 's/python-config/${PYTHON_CMD:T}-config/g' \
		-e '/pythonlibs/s/--libs/--ldflags/' \
		-e '/-D_GNU_SOURCE/d' \
		-e '/lt_cv_dlopen/s/-ldl//g' ${WRKSRC}/configure
	${REINPLACE_CMD} '/LIBADD/s/-ldl//g' \
		${WRKSRC}/modules/mixer/simple/Makefile.in
	${REINPLACE_CMD} 's|/etc|${PREFIX}&|g' \
		${WRKSRC}/src/conf/alsa.conf

post-install:
	${INSTALL_DATA} ${FILESDIR}/asound.conf.sample ${PREFIX}/etc
	@if [ ! -f ${PREFIX}/etc/asound.conf ]; then \
		${CP} -p ${PREFIX}/etc/asound.conf.sample \
			${PREFIX}/etc/asound.conf ; \
	fi

.include <bsd.port.mk>
