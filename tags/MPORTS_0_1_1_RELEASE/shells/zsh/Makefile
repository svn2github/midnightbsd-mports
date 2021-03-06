# New ports collection makefile for:	zsh
# Date created:			11 Feb. 1995
# Whom:				torstenb
#
# $MidnightBSD: mports/shells/zsh/Makefile,v 1.7 2007/08/05 16:49:22 laffer1 Exp $
# $FreeBSD: ports/shells/zsh/Makefile,v 1.81 2006/05/02 09:03:06 sergei Exp $
#

# The following compile-time options are available:
# NO_SHARED=yes		compile a static version of zsh
#			(default: use dynamically loadable modules)
# ZSH_ETCDIR=<dir>	directory for zsh system-wide configuration files:
#			zshenv, zlogin, zprofile, zshrc, zlogout.
#			(default: /etc)
#			NOTE: does NOT have to be inside ${PREFIX} tree
# ZSH_FNDIR=<dir>	directory for zsh functions (part of distribution)
#			(default: ${PREFIX}/share/zsh/${ZSH_VER}/functions)
#			NOTE: should be inside ${PREFIX} tree
# ZSH_SITEFNDIR=<dir>	directory for zsh site functions (locally developed)
#			(default: ${PREFIX}/share/zsh/site-functions)
#			NOTE: does NOT have to be inside ${PREFIX} tree

PORTNAME=	zsh
PORTVERSION=	4.3.4
CATEGORIES=	shells
MASTER_SITES=	SF \
		http://www.zsh.org/pub/ \
		ftp://ftp.zsh.org/zsh/ \
		http://mirrors.dotsrc.org/zsh/ \
		ftp://mirrors.dotsrc.org/zsh/ \
		ftp://ftp.funet.fi/pub/unix/shells/zsh/ \
		ftp://nephtys.lip6.fr/pub/unix/shells/zsh/ \
		ftp://ftp.fu-berlin.de/pub/unix/shells/zsh/ \
		http://www.cs.elte.hu/pub/zsh/ \
		ftp://ftp.cs.elte.hu/pub/zsh/ \
		ftp://ftp.kfki.hu/pub/packages/zsh/ \
		ftp://ftp.math.technion.ac.il/pub/zsh/ \
		ftp://ftp.demon.nl/pub/mirrors/zsh/ \
		ftp://ftp.kappa.ro/pub/mirrors/ftp.zsh.org/pub/zsh/ \
		ftp://ftp.lysator.liu.se/pub/unix/zsh/ \
		ftp://sunsite.org.uk/package/zsh/ \
		http://zsh.open-mirror.com/
DISTNAME=	${PORTNAME}-${ZSH_VER}
.if !defined(NOPORTDOCS)
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}-doc${EXTRACT_SUFX}
.endif

MAINTAINER?=	ports@MidnightBSD.org
COMMENT=	The Z shell

ZSH_VER=	${PORTVERSION}

USE_BZIP2=	yes
USE_ICONV=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=  ${PREFIX}/lib/${PORTNAME}

CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS} -I${LOCALBASE}/include" \
        	LDFLAGS="${LDFLAGS} -L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--with-curses-terminfo --with-tcsetpgrp \
		--enable-etcdir=${ZSH_ETCDIR} \
		--enable-fndir=${ZSH_FNDIR} --enable-function-subdirs \
		--enable-site-fndir=${ZSH_SITEFNDIR}

OPTIONS=	ZSH_MEM         "Enable zsh-mem and zsh-secure-free options" on \
		ZSH_MAILDIR     "Enable support for Maildirs in MAIL(PATH)" on \
		ZSH_MULTIBYTE   "Enable multibyte character support" on \
		ZSH_PCRE        "Enable PCRE support" off

# These variables can be overriden by user
ZSH_ETCDIR?=	/etc
ZSH_FNDIR?=	${DATADIR}/${ZSH_VER}/functions
ZSH_SITEFNDIR?=	${DATADIR}/site-functions

PLIST_SUB+=	ZSH_VER="${ZSH_VER}" ZSH_ETCDIR="${ZSH_ETCDIR}" \
		ZSH_FNDIR="${ZSH_FNDIR:S!${PREFIX}/!!}" \
		ZSH_SITEFNDIR="${ZSH_SITEFNDIR}"

MAN1=		zsh.1 zshbuiltins.1 zshcompctl.1 zshcompwid.1 zshcompsys.1 \
		zshcontrib.1 zshexpn.1 zshmisc.1 zshmodules.1 zshoptions.1 \
		zshparam.1 zshroadmap.1 zshtcpsys.1 zshzftpsys.1 zshzle.1 \
		zshall.1 zshcalsys.1
DOCS=		LICENCE META-FAQ README Etc/BUGS Etc/CONTRIBUTORS Etc/FAQ \
		Etc/completion-style-guide Doc/zsh*.html Doc/zsh.dvi
EXAMPLES=	zlogin zshenv zshrc

.include <bsd.port.pre.mk>

.if defined(WITH_ZSH_PCRE)
CONFIGURE_ARGS+=	--enable-pcre
LIB_DEPENDS+=		pcre.0:${PORTSDIR}/devel/pcre
PLIST_SUB+=		PCRE=""
.else
CONFIGURE_ARGS+=	--disable-pcre
PLIST_SUB+=		PCRE="@comment "
.endif

.if defined(WITH_ZSH_MEM)
CONFIGURE_ARGS+=        --enable-zsh-mem --enable-zsh-secure-free
.endif

.if defined(WITH_ZSH_MAILDIR)
CONFIGURE_ARGS+=	--enable-maildir-support
.endif

.if defined(NO_SHARED)
CONFIGURE_ENV=         LDFLAGS="${LDFLAGS} -static"
CONFIGURE_ARGS+=       --disable-dynamic
PLIST_SUB+=            NO_STATIC="@comment "
.else
CONFIGURE_ARGS+=       --enable-dynamic
PLIST_SUB+=            NO_STATIC=""
.endif

.if !defined(WITHOUT_ZSH_MULTIBYTE)
CONFIGURE_ARGS+=	--enable-multibyte
.endif

EXTRA_PATCHES=	${FILESDIR}/extra-patch-bsdtar

post-patch:
	@${SED} -i "" -e "s,link=dynamic,link=either," \
		${WRKSRC}/Src/Modules/*.mdd
	@${SED} -i "" -e "s,/etc/,${LOCALBASE}/etc/," \
		${WRKSRC}/Functions/MIME/zsh-mime-setup
	@${FIND} ${WRKSRC}/Completion -type f -iname '*.orig' -delete

post-build:
	# Fix ".so" macro problem by using "soelim" command.
	${LN} -sf ${WRKSRC}/Doc ${WRKSRC}/man1
	${MV} ${WRKSRC}/Doc/zshall.1 ${WRKSRC}/Doc/zshall.1.source
	cd ${WRKSRC} && /usr/bin/soelim ${WRKSRC}/Doc/zshall.1.source > \
		${WRKSRC}/Doc/zshall.1
.if !defined(NOPORTDOCS)
	@${MKDIR} ${PREFIX}/info
	makeinfo --no-split --output=${WRKSRC}/Doc/zsh.info \
		${WRKSRC}/Doc/zsh.texi
INFO=	zsh
.endif

post-install:
	${LN} ${PREFIX}/bin/zsh ${PREFIX}/bin/rzsh
	${TEST} -d ${ZSH_ETCDIR} || ${MKDIR} ${ZSH_ETCDIR}
	${TEST} -d ${ZSH_SITEFNDIR} || ${MKDIR} ${ZSH_SITEFNDIR}
	@${MKDIR} ${EXAMPLESDIR}
	cd ${WRKSRC}/StartupFiles && ${INSTALL_DATA} ${EXAMPLES} ${EXAMPLESDIR}
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/Doc/zsh.info ${PREFIX}/info/zsh.info
.endif

.include <bsd.port.post.mk>
