# New ports collection makefile for:	wu-ftpd
# Date created:		18 Oct 1994
# Whom:			torstenb
#
# $MidnightBSD$
# $FreeBSD: ports/ftp/wu-ftpd/Makefile,v 1.58 2006/05/27 00:27:22 ache Exp $
#
# REMINDER: to use ftpaccess(5) you need to specify -a in command line,
# it is changed from previous versions

PORTNAME=	wu-ftpd
PORTVERSION=	2.6.2
PORTREVISION=	6
CATEGORIES=	ftp
MASTER_SITES=	ftp://ftp.wu-ftpd.org/pub/wu-ftpd/
PATCH_SITES=	ftp://ftp.wu-ftpd.org/pub/wu-ftpd/patches/apply_to_2.6.2/
PATCHFILES=	connect-dos.patch realpath.patch

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A replacement ftp server for Un*x systems

CONFLICTS=	wu-ftpd+ipv6-[0-9]* heimdal-[0-9]*

USE_AUTOTOOLS=	autoconf:213
CONFIGURE_ARGS=	--enable-rfc931 --disable-pasvip \
		--enable-noop --disable-numericuid  --enable-nlst-dirs \
		--prefix=${PREFIX} --with-etc-dir=${PREFIX}/etc

.if !defined(WITH_PAM)
CONFIGURE_ARGS+= --enable-opie
.else
CONFIGURE_ARGS+= --enable-pam
EXTRA_PATCHES+=	${FILESDIR}/ftpd.c-pam
.endif

MAKE_ENV+=	WARNINGS=-DSPT_TYPE=SPT_BUILTIN

MAN1=		ftpcount.1 ftpwho.1
MAN5=		ftpaccess.5 ftphosts.5 ftpconversions.5 xferlog.5 \
		ftpservers.5
MAN8=		ftpd.8 ftpshut.8 ftprestart.8 privatepw.8

.include <bsd.port.mk>
