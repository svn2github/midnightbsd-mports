# $MidnightBSD$

PORTNAME=	alsa-plugins-oss
PORTVERSION=	1.0.21
PORTREVISION=	3
CATEGORIES=	audio linux
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OSS plugin for ALSA (Linux Fedora 10)
LICENSE=	unknown

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	alsalib
LINUX_DIST_VER=	10
RPMVERSION=	3.fc10
SRC_DISTFILES=	${PORTNAME:S/-oss//}-${PORTVERSION}-${RPMVERSION}${SRC_SUFX}
USE_LDCONFIG=	yes

CONF_FILE=	etc/alsa/pcm/pcm-oss.conf

post-patch:
	@${RM} ${WRKSRC}/${CONF_FILE}.orig
	@${MV} ${WRKSRC}/${CONF_FILE} ${WRKSRC}/${CONF_FILE}-dist

post-install:
	@if [ ! -f ${PREFIX}/${CONF_FILE} ]; then \
		${CP} -p ${PREFIX}/${CONF_FILE}-dist ${PREFIX}/${CONF_FILE} ; \
	fi

.include <bsd.port.mk>
