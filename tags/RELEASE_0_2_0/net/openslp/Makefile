# New ports collection makefile for:    OpenSLP 1.0
# Date created:		15 Sep 2001
# Whom:			Joe Clarke
#
# $FreeBSD: ports/net/openslp/Makefile,v 1.17 2006/02/23 10:38:26 ade Exp $
# $MidnightBSD: mports/net/openslp/Makefile,v 1.1 2007/01/20 15:53:31 laffer1 Exp $
#

PORTNAME=	openslp
PORTVERSION=	1.2.1
PORTREVISION=	3
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	openslp

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open-source implementation of the Service Location Protocol

USE_AUTOTOOLS=	libtool:15
GNU_CONFIGURE=	yes
USE_OPENSSL=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--sysconfdir=${PREFIX}/etc/openslp \
		--localstatedir=/var
CONFIGURE_TARGET=--target=${MACHINE_ARCH}-unknown-freebsd6.0

USE_RC_SUBR=	yes
RC_SCRIPTS_SUB=	PREFIX=${PREFIX} RC_SUBR=${RC_SUBR}

OPTIONS=	SLP_SECURITY "Turn on SLPv2 security support" off \
		ASYNC_API "Enable asynchronous communication API" off

.include <bsd.port.pre.mk>

.if defined(WITH_SLP_SECURITY)
CONFIGURE_ARGS+=	--enable-slpv2-security
.endif

.if defined(WITH_ASYNC_API)
CONFIGURE_ARGS+=	--enable-async-api
.endif

post-extract:
	@(cd ${WRKSRC}; \
		${FIND} doc -type f -path '*/CVS/*' -delete; \
		${FIND} doc -type d -name CVS -delete)
	@${SED} ${RC_SCRIPTS_SUB:S/$/!g/:S/^/ -e s!%%/:S/=/%%!/} \
		${FILESDIR}/slpd.sh.sample > ${WRKSRC}/slpd.sh

post-install:
.for FILE in slp.conf slp.reg slp.spi
	${INSTALL_DATA} ${WRKSRC}/etc/${FILE} ${PREFIX}/etc/openslp/${FILE}.default
.endfor
	${INSTALL_SCRIPT} ${WRKSRC}/slpd.sh ${PREFIX}/etc/rc.d/001slpd.sh
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	(cd ${INSTALL_WRKSRC}/doc; \
		${FIND} . -type d -exec ${MKDIR} ${DOCSDIR}/\{} \; ;\
		${FIND} . -type f -exec ${INSTALL_DATA} \{} ${DOCSDIR}/\{} \;)
.endif

.include <bsd.port.post.mk>
