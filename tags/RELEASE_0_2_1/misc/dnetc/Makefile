# New ports collection makefile for:    dnetc
# Date created:         26 Dec 1999
# Whom:                 dbaker
#
# $MidnightBSD: mports/misc/dnetc/Makefile,v 1.1 2008/04/17 17:45:39 crash Exp $
# $FreeBSD: ports/misc/dnetc/Makefile,v 1.58 2007/10/27 17:49:48 tdb Exp $
#

PORTNAME=	dnetc
PORTVERSION=	${VERSION}
PORTREVISION=	$(REVISION}
PORTEPOCH=	1
CATEGORIES=	misc
MASTER_SITES=	ftp://ftp.distributed.net/pub/dcti/%SUBDIR%/ \
		http://http.distributed.net/pub/dcti/%SUBDIR%/
MASTER_SITE_SUBDIR=	${PORTVERSION:S/^/v/:R}
# This is architecture dependent
DISTNAME=	dnetc${PORTVERSION:E}-freebsd-${ARCH:S/i386/x86/}-elf

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Distributed.net distributed computing project client
LICENSE=        unknown

# These are architecture dependent
WRKSRC=		${WRKDIR}/dnetc${PORTVERSION:E}-freebsd-${ARCH:S/i386/x86/}-elf
MD5_FILE=	${MASTERDIR}/distinfo.${ARCH}

ONLY_FOR_ARCHS=	i386 sparc64 amd64

USE_RC_SUBR=	dnetc.sh
NO_BUILD=	yes

BINDIR=		${PREFIX}/distributed.net

CLIENTUSER=	dnetc
CLIENTGROUP=	${CLIENTUSER}
CLIENTUID=	105

PKGINSTALL=	${WRKDIR}/pkg-install
PKGDEINSTALL=	${WRKDIR}/pkg-deinstall
PKGMESSAGE=	${WRKDIR}/pkg-message

MAN1=		dnetc.1

SUB_FILES=	pkg-install pkg-deinstall pkg-message
SUB_LIST=	BINDIR="${BINDIR}" \
		CLIENTUSER="${CLIENTUSER}" \
		CLIENTGROUP="${CLIENTGROUP}" \
		CLIENTUID="${CLIENTUID}"

.include <bsd.port.pre.mk>

.if ${ARCH} == i386
REVISION=	0
VERSION=	2.9015.503
DISTNAME=	dnetc${PORTVERSION:E}-freebsd6-${ARCH:S/i386/x86/}-elf
WRKSRC=		${WRKDIR}/dnetc${PORTVERSION:E}-freebsd6-${ARCH:S/i386/x86/}-elf
.endif

.if ${ARCH} == amd64
REVISION=	3
VERSION=	2.9012.497
DISTNAME=	dnetc${PORTVERSION:E}-freebsd6-${ARCH:S/i386/x86/}-elf
WRKSRC=		${WRKDIR}/dnetc${PORTVERSION:E}-freebsd6-${ARCH:S/i386/x86/}-elf
.endif

.if ${ARCH} == sparc64
REVISION=	3
VERSION=	2.9003.481
.endif

do-configure:
	@if [ ! -f ${PREFIX}/dnetc.ini ]; then \
		${INSTALL} -c -m 644 ${FILESDIR}/dnetc.ini ${WRKSRC}; \
	fi

pre-install:
	@${ECHO} "==>  Creating custom user to run dnetc..."
	@${SH} ${PKGINSTALL} ${PKGNAME} PRE-INSTALL

do-install:
	if [ ! -d ${BINDIR} ]; then \
		${MKDIR} ${BINDIR}; \
	fi
	${CHOWN} ${CLIENTUSER}:${CLIENTGROUP} ${BINDIR}
	${CHMOD} 775 ${BINDIR}

	${INSTALL} -c -m 755 -o ${CLIENTUSER} -g ${CLIENTGROUP} ${WRKSRC}/dnetc ${BINDIR}

	${INSTALL_MAN} ${WRKSRC}/${MAN1} ${PREFIX}/man/man1

	${INSTALL} -c -m 644 -o ${CLIENTUSER} -g ${CLIENTGROUP} ${WRKSRC}/dnetc.ini ${BINDIR}/dnetc.ini.sample
.if !exists(${BINDIR}/dnetc.ini)
	${INSTALL} -c -m 644 -o ${CLIENTUSER} -g ${CLIENTGROUP} ${WRKSRC}/dnetc.ini ${BINDIR}/dnetc.ini
.endif

.include <bsd.port.post.mk>
