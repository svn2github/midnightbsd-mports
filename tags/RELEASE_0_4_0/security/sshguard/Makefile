# $MidnightBSD: mports/security/sshguard/Makefile,v 1.8 2011/02/02 21:20:53 laffer1 Exp $

PORTNAME=	sshguard
DISTVERSION=	1.5
CATEGORIES=	security
MASTER_SITES=	SF/sshguard/sshguard/sshguard-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	Protect hosts from brute force attacks against ssh and other services
LICENSE=	gpl2
#author says bsdl on site, but can't find it. There seems to be GPL code.

CONFLICTS?=	sshguard-ipfw-1.[0-9]* sshguard-pf-1.[0-9]* sshguard-ipfilter-1.[0-9]*

MAN8=		sshguard.8
MANCOMPRESSED=	no
USE_AUTOTOOLS=	autoconf
USE_BZIP2=	yes
MAKE_ARGS+=     ACLOCAL="${TRUE}" AUTOCONF="${TRUE}" AUTOMAKE="${TRUE}"
USE_RC_SUBR=	sshguard
HAS_CONFIGURE=	yes

# sublist will be set afterward
SUB_FILES=	pkg-message

# backend type in { hosts, ipfw, pf }
SSHGUARDFW?=	hosts

.include <bsd.port.pre.mk>

.if defined(PREFIX)
CONFIGURE_ARGS+=	--prefix=${PREFIX}
.endif

# set path for manpages
CONFIGURE_ARGS+=	--mandir=${MANPREFIX}/man

.if ${SSHGUARDFW} == pf
PKGMSG_FWBLOCK="  To activate or configure PF see http://sshguard.sf.net/doc/setup/blockingpf.html"
.elif ${SSHGUARDFW} == ipfw
PKGMSG_FWBLOCK="  Verify that IPFW is active with \"ipfw show\"."
.elif ${SSHGUARDFW} == ipfilter
PKGMSG_FWBLOCK="Sshguard will use /etc/ipf.rules as ruleset."
.elif ${SSHGUARDFW} == hosts
PKGMSG_FWBLOCK="  Sshguard is going to use /etc/hosts.allow, I have touched it for you."
.endif

# for substitution in subfiles
SUB_LIST+=	PKGMSG_FWBLOCK=${PKGMSG_FWBLOCK}  PREFIX=${TRUE_PREFIX}

CONFIGURE_ARGS+=	--with-firewall=${SSHGUARDFW}

#post-install:
#	@PKG_PREFIX=${PREFIX} ${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL

#pre-deinstall:
#	@PKG_PREFIX=${PREFIX} ${SH} ${PKGDEINSTALL} ${PKGNAME} DEINSTALL

.include <bsd.port.post.mk>
