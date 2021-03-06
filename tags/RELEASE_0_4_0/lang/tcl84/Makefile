# $MidnightBSD: mports/lang/tcl84/Makefile,v 1.6 2009/12/31 20:47:44 laffer1 Exp $

PORTNAME=	tcl
PORTVERSION=	8.4.19
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	lang tcl
MASTER_SITES=	SF/tcl/Tcl/${PORTVERSION}
DISTNAME=	${PORTNAME}${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool Command Language
LICENSE=	bsd3

OPTIONS=	TCLMAN	"Install Tcl function manpages" Off \
		THREADS	"Threads"	On

WRKSRC=		${WRKDIR}/${PORTNAME}${PORTVERSION}/unix

ALL_TARGET=	all
INSTALL_TARGET=	install install-libraries

USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-shared \
		--enable-man-suffix=.${MAN_SUFFIX} \
		--includedir=${PREFIX}/include/tcl${TCL_VER}
CONFIGURE_ENV=	PORTSDIR=${PORTSDIR}

TCL_VER=	8.4
SHORT_TCL_VER=	${TCL_VER:S/8./8/}
LATEST_LINK=	${PORTNAME}${SHORT_TCL_VER}
MAN_SUFFIX=	${LATEST_LINK}

MAKE_ENV=	SHORT_TCL_VER="${SHORT_TCL_VER}" \
		MAN_SUFFIX=.${MAN_SUFFIX} \
		LANG=C LC_ALL=C	# LANG=C is required for some of UTF-using tests

PLIST_SUB=	TCL_VER=${TCL_VER} \
		SHORT_TCL_VER=${SHORT_TCL_VER}

.include <bsd.mport.options.mk>

.if defined(WITH_MTCLMAN)
INSTALL_TARGET+=install-doc
.include "${.CURDIR}/Makefile.man"
.endif

.if defined(WITH_THREADS)
CONFIGURE_ARGS+=	--enable-threads
.else
CONFIGURE_ARGS+=	--disable-threads
.endif

post-configure:
	${REINPLACE_CMD} \
		-e 's,-DNO_MEMMOVE=1,,' -e 's,-DNO_STRING_H=1,,' \
		-e 's,^COMPAT_OBJS.*,,' ${WRKSRC}/Makefile

regression-test:	build
	cd ${WRKSRC} && LC_ALL=C ${MAKE} test

.include <bsd.port.mk>
