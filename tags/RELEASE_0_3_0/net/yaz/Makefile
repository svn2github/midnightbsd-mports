# New ports collection makefile for:	yaz
# Date created:				16 Sep 2000
# Whom:					Dmitry Sivachenko <dima@Chg.RU>
#
# $MidnightBSD: mports/net/yaz/Makefile,v 1.3 2008/08/21 19:52:23 laffer1 Exp $
# $FreeBSD: ports/net/yaz/Makefile,v 1.45 2008/04/04 21:33:53 pav Exp $
#

PORTNAME=	yaz
PORTVERSION=	4.0.11
CATEGORIES=	net
MASTER_SITES=	http://ftp.indexdata.dk/pub/yaz/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Z39.50/SR client and API library
LICENSE=	bsd3

LIB_DEPENDS=	xml2.5:${PORTSDIR}/textproc/libxml2 \
		xslt.2:${PORTSDIR}/textproc/libxslt

USE_ICONV=	yes
USE_OPENSSL=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--enable-shared --with-openssl=${OPENSSLBASE} \
		--with-iconv=${LOCALBASE} --with-xml2=${LOCALBASE} \
		--with-xslt=${LOCALBASE} --enable-tcpd
USE_LDCONFIG=	yes

MAN1=		yaz-asncomp.1 yaz-client.1 yaz-iconv.1 \
		yaz-json-parse.1 yaz-marcdump.1 \
		zoomsh.1 yaz-icu.1 yaz-illclient.1
MAN7=		bib1-attr.7 yaz-log.7 yaz.7
MAN8=		yaz-config.8 yaz-ztest.8

post-configure:
	cd ${WRKSRC}/doc && \
		${REINPLACE_CMD} -e 's,[$$]{datarootdir}/man,${PREFIX}/man,' \
		Makefile

.include <bsd.port.mk>
