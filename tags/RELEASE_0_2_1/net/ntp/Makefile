# New ports collection makefile for:	ntp
# Date created:		Di   5 Mai 1998 21:31:03 CEST
# Whom:			andreas
#
# $MidnightBSD$
# $FreeBSD: ports/net/ntp/Makefile,v 1.50 2008/01/13 04:17:07 cy Exp $
#

PORTNAME=	ntp
PORTVERSION=	4.2.4p4
CATEGORIES=	net ipv6
MASTER_SITES=	ftp://ftp.udel.edu/pub/ntp/ntp4/ \
		http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ \
		ftp://ftp.archive.de.uu.net/pub/unix/ntp/ntp4/ \
		ftp://ftp.netlab.is.tsukuba.ac.jp/pub/network/ntp/ntp4/
DISTNAME=	${PORTNAME}-${PORTVERSION:S/.r/-rc/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Network Time Protocol Distribution

LATEST_LINK=	${PORTNAME}

USE_GCPIO=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.0
USE_AUTOTOOLS=	automake:19

.if defined(ENABLE_RAWDCF)
CONFIGURE_ARGS+=	--enable-RAWDCF
.endif

.if defined(WITHOUT_SSL)
CONFIGURE_ARGS+=	--without-crypto
PLIST_SUB+=		SSL="@comment "
.else
USE_OPENSSL=		yes
CONFIGURE_ARGS+=	--with-openssl-incdir=${OPENSSLINC} \
			--with-openssl-libdir=${OPENSSLLIB}
PLIST_SUB+=		SSL=""
.endif
CONFIGURE_ARGS+=	--enable-ipv6

MAN1=		sntp.1 \
		ntpd.1 \
		ntpdsim.1 \
		ntpdc.1 \
		ntpq.1 \
		ntp-keygen.1 \

.include <bsd.port.pre.mk>

post-install:
	@${MKDIR} ${EXAMPLESDIR}
	@${INSTALL_DATA} ${WRKSRC}/conf/* ${EXAMPLESDIR}
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${FIND} ${WRKSRC}/html -type f | ${XARGS} ${CHMOD} ${SHAREMODE}
	@cd ${WRKSRC}/html && ${FIND} . -print | \
		${CPIO} -pdu -R ${SHAREOWN}:${SHAREGRP} --quiet ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
