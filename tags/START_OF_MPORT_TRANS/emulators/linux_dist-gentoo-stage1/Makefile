# New ports collection makefile for:	linux_base-gentoo-stage1
# Date created:				2003-10-12
# Whom:					trevor
#
# $MidnightBSD$
# $FreeBSD: ports/emulators/linux_dist-gentoo-stage1/Makefile,v 1.39 2007/01/30 04:23:55 kris Exp $
#

PORTNAME=	gentoo-stage1
PORTVERSION=	2006.0
PORTREVISION=	3
CATEGORIES=	emulators linux
MASTER_SITES=	${MASTER_SITE_GENTOO}
MASTER_SITE_SUBDIR=	releases/x86/${PORTVERSION}/stages
DISTNAME=	stage1-x86-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Files from Gentoo distribution, for Linux compatibility

RESTRICTED=	binaries licensed under GNU GPL without accompanying source

# Does not build when jailed
MANUAL_PACKAGE_BUILD=	YES

USE_BZIP2=		YES
DIST_SUBDIR=		gentoo-linux
NO_BUILD=		YES
ONLY_FOR_ARCHS=		amd64 i386
SUB_FILES+=		pkg-message pkg-install pkg-deinstall
SUB_LIST+=		PREFIX_SUBDIR="${PREFIX_SUBDIR}"
PLIST_SUB+=		PREFIX_SUBDIR="${PREFIX_SUBDIR}"
PKGMESSAGE=		${WRKDIR}/pkg-message
PKGINSTALL=		${WRKDIR}/pkg-install
PKGDEINSTALL=		${WRKDIR}/pkg-deinstall

.if defined(WITH_LINUXBASE)
PKGNAMEPREFIX=	linux_base-
CONFLICTS=	linux_base-7* linux_base-8* linux_base-debian* \
		linux_base-rh* linux_base-suse* linux_base-fc* \
		linux_base-gentoo-stage[23]-*
USE_LINUX_PREFIX=	YES
PREFIX_SUBDIR=
.else
NO_MTREE=	YES
PKGNAMEPREFIX=	linux_dist-
PREFIX_SUBDIR=	${PORTNAME}/
.endif

.include <bsd.port.pre.mk>

.if (${ARCH} == "amd64")
LATEST_LINK=	${PORTNAME:C/linux_base/linux32_base/}
.endif

pre-fetch:
.if defined(WITH_LINUXBASE)
	@${ECHO_MSG} ""
	@${ECHO_MSG} "Note that this port doesn't completely suit our ports"
	@${ECHO_MSG} "infrastructure.  It's very good for a standalone Linux"
	@${ECHO_MSG} "distribution on a BSD system you can use for"
	@${ECHO_MSG} "cross-developing and cross-building, etc., but using it as a"
	@${ECHO_MSG} "linux_base port is not quite adequate."
	@${ECHO_MSG} "If you experience troubles with it, please use the"
	@${ECHO_MSG} "default linux_base port."
	@${ECHO_MSG} ""
.else
	@${ECHO_MSG} ""
	@${ECHO_MSG} "This port is a complete Linux distribution you can use"
	@${ECHO_MSG} "on a BSD system.  The use of this port as a linux_base"
	@${ECHO_MSG} "port is very discouraged but you can enforce it to install"
	@${ECHO_MSG} "as a linux_base if you set WITH_LINUXBASE."
	@${ECHO_MSG} ""
.endif

do-install:
	@${MKDIR} ${PREFIX}/${PREFIX_SUBDIR}
	@${SH} ${PKGINSTALL} ${PKGNAME} PRE-INSTALL
	@${TAR} --exclude=./dev -xpy --exclude=./proc --exclude=./lib/udev-state \
		-C ${PREFIX}/${PREFIX_SUBDIR} \
		-f ${DISTDIR}/${DIST_SUBDIR}/${DISTFILES}
	@${CP} -p /etc/resolv.conf ${PREFIX}/${PREFIX_SUBDIR}/etc/
	@${FIND} ${PREFIX}/${PREFIX_SUBDIR}bin ${PREFIX}/${PREFIX_SUBDIR}sbin/ \
		${PREFIX}/${PREFIX_SUBDIR}usr/bin ${PREFIX}/${PREFIX_SUBDIR}/usr/sbin \
		-type f -print0 | ${XARGS} -0 ${FILE} \
		| ${GREP} ELF | ${CUT} -d : -f 1 \
		| ${XARGS} ${BRANDELF} -t Linux
	@${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
