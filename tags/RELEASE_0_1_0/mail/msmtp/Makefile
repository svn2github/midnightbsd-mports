# Ports collection makefile for:  msmtp
# Date created:                   22 Aug 2003
# Whom:                           R.I.Pienaar <rip@devco.net>
#
# $MidnightBSD: mports/mail/msmtp/Makefile,v 1.2 2007/02/18 01:45:35 laffer1 Exp $
# $FreeBSD: ports/mail/msmtp/Makefile,v 1.25 2006/08/21 07:35:52 novel Exp $
#

PORTNAME=	msmtp
PORTVERSION=	1.4.10
CATEGORIES=	mail ipv6
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	msmtp

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SMTP plugin for MUAs

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_GETOPT_LONG=yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS+=	--infodir="${PREFIX}/info" --mandir="${PREFIX}/man"
MAN1=	msmtp.1
INFO=	msmtp

.if defined(WITH_GNUTLS)
LIB_DEPENDS+=	gnutls.13:${PORTSDIR}/security/gnutls
CONFIGURE_ARGS+=	--with-ssl=gnutls
.elif defined(WITH_OPENSSL)
USE_OPENSSL=	yes
CONFIGURE_ARGS+=	--with-ssl=openssl
.else
CONFIGURE_ARGS+=	--without-ssl
.endif

.if defined(WITH_GSASL)
LIB_DEPENDS+=	gsasl.9:${PORTSDIR}/security/gsasl
.else
CONFIGURE_ARGS+=	--without-gsasl
.endif

.if !defined(WITHOUT_IDN)
LIB_DEPENDS+=	idn.16:${PORTSDIR}/dns/libidn
CONFIGURE_ARGS+=	--with-libidn
.else
CONFIGURE_ARGS+=	--without-libidn
.endif

.if !defined(WITHOUT_NLS)
USE_GETTEXT=		yes
CONFIGURE_ARGS+=	--enable-nls
PLIST_SUB=		NLS=""
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB=		NLS="@comment "
.endif

.include <bsd.port.mk>
