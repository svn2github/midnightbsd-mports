# $MidnightBSD: mports/x11/nvidia-xconfig/Makefile,v 1.6 2013/01/15 01:16:37 laffer1 Exp $

PORTNAME=	nvidia-xconfig
PORTVERSION=	310.14
CATEGORIES=	x11
MASTER_SITES=	ftp://download.nvidia.com/XFree86/nvidia-xconfig/ \
		ftp://download1.nvidia.com/XFree86/nvidia-xconfig/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool to manipulate X configuration files for the NVidia driver
LICENSE=	gpl2

USE_BZIP2=	yes
USE_GMAKE=	yes

MAKE_ENV=	NV_VERBOSE= \
		STRIP_CMD=${TRUE} \
		INSTALL_PROGRAM="${INSTALL_PROGRAM}" \
		INSTALL_MAN="${INSTALL_MAN}" \
		prefix=${TRUE_PREFIX}

MAN1=		nvidia-xconfig.1
MANCOMPRESSED=	yes
PLIST_FILES=	bin/nvidia-xconfig

post-patch:   .SILENT
	${REINPLACE_CMD} -e '/^prefix/s/=/?&/' \
		-e '/^MANDIR/s|share/||' ${WRKSRC}/utils.mk

.include <bsd.port.mk>
