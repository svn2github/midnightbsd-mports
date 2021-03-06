# $MidnightBSD: mports/www/tidy-devel/Makefile,v 1.5 2009/09/20 00:27:08 laffer1 Exp $

PORTNAME?=	tidy
DISTVERSION=	090315-cvs
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
#MASTER_SITES=	http://tidy.sourceforge.net/src/%SUBDIR%/	\
#		http://tidy.sourceforge.net/docs/:docs
#MASTER_SITE_SUBDIR=	. old
MASTER_SITE_SUBDIR=	thierry
PKGNAMESUFFIX?=	-devel

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	Utility to clean up and pretty print HTML/XHTML/XML
LICENSE=	unknown
# everything says look at tidy.h but there isn't one.

USE_BZIP2=	yes

SLAVEDIRS=	www/tidy-lib
WRKSRC=		${WRKDIR}/${PORTNAME}

.if !defined(WITH_SHLIB)
USE_GMAKE=	yes
PLIST_SUB=	SHLIB="@comment " NSHLIB=""
CONFLICTS=	tidy-20000804* tidy-lib-[0-9]*
.else
USE_AUTOTOOLS=	automake:15 autoconf:262 libtool:22
AUTOMAKE_ARGS+=	-a -c --foreign
CONFIGURE_TARGET=	--target=${MACHINE_ARCH}-portbld-freebsd6.1 \
			--host=${MACHINE_ARCH}-portbld-freebsd6.1 \
			--build=${MACHINE_ARCH}-portbld-freebsd6.1
USE_LDCONFIG=	yes
PLIST_SUB=	SHLIB="" NSHLIB="@comment "
CONFLICTS=	tidy-20000804* tidy-devel-[0-9]*
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
DOCFILES+=	Overview.html checked_by_tidy.gif faq.html grid.gif pending.html	\
		release-notes.html tidy.css tidy.gif
.endif

.if defined(MAINTAINER_MODE)

CVSROOT=	":pserver:anonymous@tidy.cvs.sourceforge.net:/cvsroot/tidy"
CVS_PASSFILE=	${WRKDIR}/temp-cvs-passfile

getcvs:
	${MKDIR} ${WRKDIR}/cvs
	${ECHO_CMD} ${CVSROOT} A > ${CVS_PASSFILE}
	cd ${WRKDIR}/cvs &&	\
	CVSROOT=${CVSROOT} CVS_PASSFILE=${CVS_PASSFILE} cvs -z3 co -P tidy

tarball:
	${RM} -rf ${WRKDIR}/cvs/tidy/CVSROOT
	${FIND} ${WRKDIR}/cvs -name CVS | ${XARGS} ${RM} -rf
	cd ${WRKDIR}/cvs &&	\
	${TAR} cfj ${_DISTDIR}${DISTFILES} tidy

.endif

post-patch:
	${CHMOD} a+x ${WRKSRC}/test/testxml.sh
.if !defined(WITH_SHLIB)
	${CP} ${WRKSRC}/build/gmake/Makefile ${WRKSRC}
.else
	${CP} -R -f ${WRKSRC}/build/gnuauto/* ${WRKSRC}
. for t in testone.sh testaccessone.sh
	${REINPLACE_CMD} -e 's|../bin/tidy|../console/tidy|'	\
		${WRKSRC}/test/${t}
. endfor
.endif

patch-autotools::
.if defined(WITH_SHLIB)
	(cd ${WRKSRC}				\
	&& ${LIBTOOLIZE} --force --copy		\
	&& ${ACLOCAL}				\
	&& ${REINPLACE_CMD} -e '/^_LT_AC_SHELL_INIT/d' aclocal.m4)
	(cd ${PATCH_WRKSRC};			\
	for ltf in ${LIBTOOLFILES}; do		\
		${CP} $$ltf $$ltf.tmp;	\
		${SED} -e "s^\$$ac_aux_dir/ltconfig^${LTCONFIG}^g" \
			-e "/^ltmain=/!s^\$$ac_aux_dir/ltmain.sh^${LIBTOOLFLAGS} ${LTMAIN}^g" \
			$$ltf.tmp > $$ltf;	\
	 done);
.endif

post-install:
.for pgm in ${BIN2STRIP}
	${STRIP_CMD} ${PREFIX}/bin/${pgm}
.endfor
.if defined(WITH_SHLIB)
	${STRIP_CMD} ${PREFIX}/lib/libtidy-0.99.so.0
.endif
.if !defined(NOPORTDOCS)
	@${ECHO_MSG} "===>   Installing documentation for ${PKGNAME}"
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${DOCFILES:S|^|${WRKSRC}/htmldoc/|} ${DOCSDIR}
	@${ECHO_MSG} "===>   Documentation installed in ${DOCSDIR}."
.endif

regression-test:
.for t in testaccess.sh testall.sh testxml.sh
	cd ${WRKSRC}/test && ./${t}
.endfor

.include <bsd.port.mk>
