# New ports collection makefile for:	yaz
# Date created:				16 Sep 2000
# Whom:					Dmitry Sivachenko <dima@Chg.RU>
#
# $MidnightBSD: mports/net/yaz/Makefile,v 1.1 2007/02/25 21:58:09 laffer1 Exp $
# $FreeBSD: ports/net/yaz/Makefile,v 1.42 2007/02/01 13:40:08 demon Exp $
#

PORTNAME=	yaz
PORTVERSION=	2.1.48
CATEGORIES=	net
MASTER_SITES=	http://ftp.indexdata.dk/pub/yaz/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Z39.50/SR client and API library

LIB_DEPENDS=	xml2.5:${PORTSDIR}/textproc/libxml2 \
		xslt.2:${PORTSDIR}/textproc/libxslt

USE_ICONV=	yes
USE_OPENSSL=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--enable-shared --with-openssl=${OPENSSLBASE} \
		--with-iconv=${LOCALBASE} --with-xml2=${LOCALBASE} \
		--with-xslt=${LOCALBASE} --enable-tcpd
USE_LDCONFIG=	yes

MAN1=		yaz-asncomp.1 yaz-client.1 yaz-iconv.1 yaz-marcdump.1 \
		ziffy.1 zoomsh.1
MAN7=		yaz-log.7 yaz.7
MAN8=		yaz-config.8 yaz-ztest.8

pre-fake:
	cd ${WRKSRC}/doc && \
		${REINPLACE_CMD} -e 's,[$$]{datarootdir}/man,${TARGETDIR}/man,' \
		Makefile
	cd ${WRKSRC}/ziffy && \
		${REINPLACE_CMD} -e 's,[$$]{datarootdir}/man,${TARGETDIR}/man,' \
		Makefile

.include <bsd.port.mk>
