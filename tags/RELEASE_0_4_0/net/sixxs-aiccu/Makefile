# $MidnightBSD: mports/net/sixxs-aiccu/Makefile,v 1.3 2011/09/27 17:20:17 laffer1 Exp $

PORTNAME=	aiccu
PORTVERSION=	20070115
PORTREVISION=	2
CATEGORIES=	net ipv6
MASTER_SITES=	http://www.sixxs.net/archive/sixxs/aiccu/unix/
PKGNAMEPREFIX=	sixxs-
DISTNAME=	aiccu_20070115

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SixXS IPv6 TIC+ tunnel broker heartbeat client
LICENSE=	bsd3

LIB_DEPENDS=	gnutls.42:${PORTSDIR}/security/gnutls

USE_RC_SUBR=	sixxs-aiccu
USE_GMAKE=	yes

CFLAGS+=	${PTHREAD_CFLAGS} -D_REENTRANT -DAICCU_GNUTLS -I${LOCALBASE}/include
LDFLAGS+=	${PTHREAD_LIBS} -L${LOCALBASE}/lib -lgnutls
MAKE_ARGS+=	CC="${CC}" LDFLAGS="${LDFLAGS}"
WRKSRC=		${WRKDIR}/aiccu
BUILD_WRKSRC=	${WRKDIR}/aiccu/unix-console
PORTDOCS=	README

post-patch:
	@${REINPLACE_CMD} \
		-e 's:verbose true:verbose false:' \
		-e 's:daemonize false:daemonize true:' \
		-e 's:automatic false:automatic true:' \
		-e 's:tunnel_id T2995:#tunnel_id TXXXX:' \
		-e 's:ipv4_interface eth0:ipv4_interface sis0:' \
		-e 's:ipv6_interface sixxs:ipv6_interface gif0:' \
		${WRKSRC}/doc/aiccu.conf

.include <bsd.port.pre.mk>

.if defined(WITH_LOG_DAEMON)
do-configure:
	@${REINPLACE_CMD} \
		-e 's:LOG_LOCAL7:LOG_DAEMON:' \
		${WRKSRC}/common/common.c
.endif

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/unix-console/aiccu ${PREFIX}/sbin/sixxs-aiccu
.ifndef(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/README ${DOCSDIR}
.endif
	${INSTALL_DATA} ${WRKSRC}/doc/aiccu.conf ${PREFIX}/etc/aiccu.conf.sample
.if !exists(${PREFIX}/etc/aiccu.conf)
	${INSTALL_DATA} -m 0644 ${WRKSRC}/doc/aiccu.conf ${PREFIX}/etc/aiccu.conf
.endif

.include <bsd.port.post.mk>
