# $MidnightBSD: mports/archivers/rpm/Makefile,v 1.5 2011/02/02 20:03:22 laffer1 Exp $

PORTNAME=	rpm
PORTVERSION=	3.0.6
PORTREVISION=	15
CATEGORIES=	archivers
MASTER_SITES=	http://rpm5.org/files/rpm/rpm-3.0/ \
		http://rpm.org/releases/historical/rpm-3.0.x/ \
		http://www.mirrorservice.org/sites/ftp.rpm.org/pub/rpm/dist/rpm-3.0.x/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Red Hat Package Manager
LICENSE=	gpl2

LIB_DEPENDS=	popt.0:${PORTSDIR}/devel/popt

CONFLICTS=	rpm-4.*

USE_GETTEXT=	yes
USE_GMAKE=	yes
MAKE_JOBS_SAFE=	yes
USE_AUTOTOOLS=	automake14 autoconf213 libtool
CONFIGURE_ARGS=	--with-glob
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib -lintl -liconv"
USE_LDCONFIG=	yes
MAKE_ENV=	OLD_PO_FILE_INPUT=1

MAN1=		gendiff.1
MAN8=		rpm.8 rpm2cpio.8

post-patch:
.for file in rpm.c doc/rpm.8 lib/macro.c lib/rpmrc.c
	@${REINPLACE_CMD} -e "s|%%PREFIX%%|${PREFIX}|g" ${WRKSRC}/${file}
.endfor

post-install:
		${INSTALL_MAN} ${WRKSRC}/doc/gendiff.1 ${PREFIX}/man/man1
		${INSTALL_MAN} ${WRKSRC}/doc/rpm.8 ${PREFIX}/man/man8
		${INSTALL_MAN} ${WRKSRC}/doc/rpm2cpio.8 ${PREFIX}/man/man8

.include <bsd.port.mk>
