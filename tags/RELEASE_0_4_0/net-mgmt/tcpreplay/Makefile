# $MidnightBSD: mports/net-mgmt/tcpreplay/Makefile,v 1.6 2011/01/08 15:04:06 laffer1 Exp $

PORTNAME=	tcpreplay
PORTVERSION=	3.4.4
CATEGORIES=	net-mgmt
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A tool to replay saved packet capture files
LICENSE=	bsd3

BUILD_DEPENDS=	pcapnav-config:${PORTSDIR}/net/libpcapnav

GNU_CONFIGURE=	yes
MAKE_JOBS_SAFE=	yes

CONFIGURE_ARGS=	--program-transform-name='s|.*\(tcp.*\)|\1|' \
		--with-pcapnav-config=${LOCALBASE}/bin/pcapnav-config \
		--enable-tcpreplay-edit

MAN1=		tcpreplay.1 tcpprep.1 tcprewrite.1 tcpbridge.1 tcpreplay-edit.1
PLIST_FILES=	bin/tcpreplay bin/tcpprep bin/tcprewrite bin/tcpbridge \
		bin/tcpreplay-edit

post-patch:
	@${REINPLACE_CMD} -e 's|-Wall -O3||' ${WRKSRC}/${CONFIGURE_SCRIPT}

.include <bsd.port.mk>
