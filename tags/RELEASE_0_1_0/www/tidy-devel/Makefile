# New ports collection makefile for:	tidy
# Date created:		27 Oct 1998
# Whom:			Abel Chow <achow@transoft.net>
#
# $FreeBSD: ports/www/tidy-devel/Makefile,v 1.153 2006/03/22 09:06:44 pav Exp $
# $MidnightBSD$ 
#

PORTNAME?=	tidy
PORTVERSION=	051026
PORTREVISION=	2
CATEGORIES=	www
MASTER_SITES=	http://tidy.sourceforge.net/src/%SUBDIR%/	\
		http://tidy.sourceforge.net/docs/:docs
MASTER_SITE_SUBDIR=	. old
PKGNAMESUFFIX?=	-devel
DISTNAME=	tidy_src
EXTRACT_SUFX=	.tgz
DISTFILES=	${DISTNAME}_${PORTVERSION}${EXTRACT_SUFX}

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	Utility to clean up and pretty print HTML/XHTML/XML

WRKSRC=		${WRKDIR}/${PORTNAME}

.if !defined(WITH_SHLIB)
USE_GMAKE=	yes
PLIST_SUB=	SHLIB="@comment " NSHLIB=""
.else
USE_AUTOTOOLS=	automake:15 autoconf:253 libtool:15
AUTOMAKE_ARGS+=	-a -c --foreign
CONFIGURE_TARGET=	 --target=${MACHINE_ARCH}-portbld-freebsd6.0
INSTALLS_SHLIB=	yes
PLIST_SUB=	SHLIB="" NSHLIB="@comment "
.endif

DESCR=		${.CURDIR}/pkg-descr

BIN2STRIP=	tidy tab2space

.if !defined(WITH_SHLIB)
MAN1=		tidy.1
.endif

.if !defined(NOPORTDOCS)
. if !defined(WITH_SHLIB)
BUILD_DEPENDS+=	xsltproc:${PORTSDIR}/textproc/libxslt
ALL_TARGET=	all doc
DOCFILES=	quickref.html
. endif
DOCVER=		051020
DISTFILES+=	tidy_docs_${DOCVER}${EXTRACT_SUFX}:docs
DOCFILES+=	Overview.html checked_by_tidy.gif faq.html grid.gif pending.html	\
		release-notes.html tidy.css tidy.gif
.endif

post-patch:
.if !defined(WITH_SHLIB)
	@${CP} ${WRKSRC}/build/gmake/Makefile ${WRKSRC}
.else
	@${CP} -R -f ${WRKSRC}/build/gnuauto/* ${WRKSRC}
.endif

patch-autotools::
.if defined(WITH_SHLIB)
	@(cd ${WRKSRC}				\
	&& ${LIBTOOLIZE} --force --copy		\
	&& ${ACLOCAL}				\
	&& ${REINPLACE_CMD} -e '/^_LT_AC_SHELL_INIT/d' aclocal.m4)
	@(cd ${PATCH_WRKSRC};			\
	for ltf in ${LIBTOOLFILES}; do		\
		${CP} $$ltf $$ltf.tmp;	\
		${SED} -e "s^\$$ac_aux_dir/ltconfig^${LTCONFIG}^g" \
			-e "/^ltmain=/!s^\$$ac_aux_dir/ltmain.sh^${LIBTOOLFLAGS} ${LTMAIN}^g" \
			$$ltf.tmp > $$ltf;	\
	 done);
.endif

pre-install:
	@if [ -f ${LOCALBASE}/bin/tidy ]; then \
		${ECHO_MSG} "" ; \
		${ECHO_MSG} "Conflict: another tidy has been found; please deinstall it." ; \
		${ECHO_MSG} "(`pkg_info -W ${LOCALBASE}/bin/tidy`)" ; \
		${ECHO_MSG} "" ; \
		${FALSE} ; \
	fi

post-install:
.for pgm in ${BIN2STRIP}
	@${STRIP_CMD} ${PREFIX}/bin/${pgm}
.endfor
.if defined(WITH_SHLIB)
	@${STRIP_CMD} ${PREFIX}/lib/libtidy-0.99.so.0
.endif
.if !defined(NOPORTDOCS)
	@${ECHO_MSG} "===>   Installing documentation for ${PKGNAME}"
	@${MKDIR} ${DOCSDIR}/api
	@${INSTALL_DATA} ${DOCFILES:S|^|${WRKSRC}/htmldoc/|} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/htmldoc/api/* ${DOCSDIR}/api
	@${ECHO_MSG} "===>   Documentation installed in ${DOCSDIR}."
.endif

.include <bsd.port.mk>
