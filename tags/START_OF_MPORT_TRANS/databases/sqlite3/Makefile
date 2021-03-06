# ex:ts=8
# New ports collection makefile for:	sqlite
# Date created:			Feb 21, 2001
# Whom:				Ying-Chieh Liao <ijliao@FreeBSD.org>
#
# $FreeBSD: ports/databases/sqlite3/Makefile,v 1.21 2006/11/21 12:25:46 mnag Exp $
# $MidnightBSD$
#

PORTNAME=	sqlite
PORTVERSION=	3.3.8
CATEGORIES=	databases
MASTER_SITES=	http://www.sqlite.org/

MAINTAINER=	mnag@FreeBSD.org
COMMENT=	An SQL database engine in a C library w/ Tcl wrapper

USE_GMAKE=	YES
USE_GNOME=	pkgconfig
USE_AUTOTOOLS=	libtool:15
USE_DOS2UNIX=	*.pc.in
USE_LDCONFIG=	YES
GNU_CONFIGURE=	YES
CONFIGURE_ARGS=		--prefix=${PREFIX} --with-hints=freebsd.hints
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0

DOCSDIR=	${PREFIX}/share/doc/sqlite3
EXAMPLESDIR=	${PREFIX}/share/examples/sqlite3

OPTIONS=	DEBUG		"Enable debugging & verbose explain"	off \
		DOCS		"Building docs (depends on TCL)"	on \
		TCLWRAPPER	"TCL wrapper for SQLITE"		off \
		THREADS		"Enable threads support"		off

# Defaults, for building the docs:
TCL_V?=		8.4
MAKE_ARGS+=	TCLSH=tclsh${TCL_V}
MAKE_ENV+=	TCL_VER=${TCL_V}

.include <bsd.port.pre.mk>

.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=	--enable-debug
.endif

.if !defined(NOPORTDOCS) && !defined(WITHOUT_DOCS)
BUILD_DEPENDS+=		tclsh${TCL_V}:${PORTSDIR}/lang/tcl${TCL_V:S/.//}
ALL_TARGET+=		all doc
PORTDOCS=		*
.endif

.if defined(WITH_TCLWRAPPER)
CATEGORIES+=		lang tcl${TCL_V:S/.//}
LIB_DEPENDS+=		tcl${TCL_V:S/.//}:${PORTSDIR}/lang/tcl${TCL_V:S/.//}
CONFIGURE_ARGS+=	--with-tcl=${LOCALBASE}/lib/tcl${TCL_V}
PLIST_SUB+=		WITH_TCLWRAPPER=""
.else
CONFIGURE_ARGS+=	--disable-tcl
PLIST_SUB+=		WITH_TCLWRAPPER="@comment "
.endif

.if defined(WITH_THREADS)
CONFIGURE_ARGS+=	--enable-threadsafe
.endif

post-patch:
.if defined(WITH_THREADS)
	@${REINPLACE_CMD} -e "s|-lpthread|${PTHREAD_LIBS}|g" \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -E -e "s|(Libs:.*)|\1 ${PTHREAD_LIBS}|" \
		-e "s|(Cflags:.*)|\1 ${PTHREAD_CFLAGS}|" \
		${WRKSRC}/sqlite.pc.in ${WRKSRC}/sqlite3.pc.in
.endif
	@${REINPLACE_CMD} -e "s|tclsh \$$(TOP)|\$$(TCLSH) \$$(TOP)|g" \
		-e "s|./libtool|${LIBTOOL}|g" \
		-e "s|\$${HAVE_TCL:1=tcl_install}||" \
			${WRKSRC}/Makefile.in
	@${ECHO} "config_TARGET_TCL_INC=\"-I${PREFIX}/include/tcl${TCL_V}\"" \
		> ${WRKSRC}/freebsd.hints
	@${ECHO} "config_TARGET_TCL_LIBS=\"-L${PREFIX}/lib -ltcl${TCL_V:S/.//}\"" \
		>> ${WRKSRC}/freebsd.hints

post-install:
.if defined(WITH_TCLWRAPPER)
	@${MKDIR} ${PREFIX}/lib/sqlite
	@(cd ${WRKSRC} && ${LIBTOOL} --mode=install ${INSTALL_DATA} \
		libtclsqlite3.la ${PREFIX}/lib/sqlite/)
	@${INSTALL_DATA} ${FILESDIR}/pkgIndex.tcl ${PREFIX}/lib/sqlite/
	@${INSTALL_PROGRAM} ${WRKSRC}/.libs/tclsqlite3 ${PREFIX}/bin
.endif
.if !defined(NOPORTDOCS) && !defined(WITHOUT_DOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/doc/* ${DOCSDIR}
.endif
	@${MKDIR} ${EXAMPLESDIR}
	@${INSTALL_DATA} ${FILESDIR}/example.tcl ${EXAMPLESDIR}

.include <bsd.port.post.mk>
