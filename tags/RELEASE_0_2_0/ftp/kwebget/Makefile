# New ports collection makefile for:	kwebget
# Date created:				21 September 2001
# Whom:					David <ddavid_3@yahoo.com>
#
# $MidightBSD$
# $FreeBSD: ports/ftp/kwebget/Makefile,v 1.14 2006/05/07 11:09:19 edwin Exp $
#

PORTNAME=	kwebget
PORTVERSION=	0.8.1
PORTREVISION=	2
CATEGORIES=	ftp kde
MASTER_SITES=	http://www.kpage.de/download/
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A KDE frontend to wget

RUN_DEPENDS=	${LOCALBASE}/bin/wget:${PORTSDIR}/ftp/wget

WRKSRC=		${WRKDIR}/${PORTNAME}

USE_BZIP2=	yes
USE_KDELIBS_VER=3
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:15

post-patch:
	@${REINPLACE_CMD} -e 's|-O2||g ; \
		 s|-lpthread|${PTHREAD_LIBS}|g' ${WRKSRC}/${CONFIGURE_SCRIPT}
	@${REINPLACE_CMD} -e \
		's|$$(LIBSOCKET)$$|$$(LIBSOCKET) $$(LIBPTHREAD)|g' \
			${WRKSRC}/kwebget/Makefile.in

.include <bsd.port.mk>
