# ex:ts=8
# Ports collection makefile for:  lsof
# Date created:			  Sat July 20, 1996
# Whom:				  David O'Brien (obrien@FreeBSD.org)
#
# $MidnightBSD: mports/sysutils/lsof/Makefile,v 1.1 2008/03/31 02:43:05 laffer1 Exp $
# $FreeBSD: ports/sysutils/lsof/Makefile,v 1.158 2008/01/26 22:28:53 wxs Exp $
#

PORTNAME=	lsof
PORTVERSION=	4.79H
CATEGORIES=	sysutils
MASTER_SITES=	http://ftp.cerias.purdue.edu/pub/tools/unix/sysutils/lsof/ \
		ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  \
		ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/NEW/ \
		ftp://ftp.ayamura.org/pub/lsof/ \
		ftp://ftp.ayamura.org/pub/lsof/NEW/ \
		ftp://ftp.cerias.purdue.edu/pub/tools/unix/sysutils/lsof/ \
		ftp://ftp.cerias.purdue.edu/pub/tools/unix/sysutils/lsof/NEW/ \
		ftp://gd.tuwien.ac.at/utils/admin-tools/lsof/ \
		ftp://gd.tuwien.ac.at/utils/admin-tools/lsof/NEW/ \
		ftp://ftp.sunet.se/pub/unix/admin/lsof/  \
		ftp://ftp.sunet.se/pub/unix/admin/lsof/NEW/ \
		ftp://ftp.cert.dfn.de/pub/tools/admin/lsof/  \
		ftp://ftp.cert.dfn.de/pub/tools/admin/lsof/NEW/ \
		ftp://ftp.tau.ac.il/pub/unix/admin/ \
		${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	wxs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lists information about open files (similar to fstat(1))
LICENSE=	other
#very bsdish

FIXUP_RELEASE=yes
.if defined(FIXUP_RELEASE)
DISTNAME=	${PORTNAME}_${PORTVERSION}.freebsd
.else
DISTNAME=	${PORTNAME}_${PORTVERSION}
.endif
.if defined(FIXUP_RELEASE)
WRKSRC=		${WRKDIR}/${DISTNAME}
.else
WRKSRC=		${WRKDIR}/${DISTNAME}/${SRCBALL_NAME}
.endif
USE_BZIP2=	yes
HAS_CONFIGURE=	yes
CONFIGURE_SCRIPT=	Configure
CONFIGURE_ARGS=	-n freebsd
CONFIGURE_ENV=	LSOF_CC="${CC}" LSOF_VERS=6000
FREEBSD_SYS?=	/usr/src/sys
PLIST_FILES=	sbin/lsof
MAN8=		lsof.8

SRCBALL_NAME=	${DISTNAME:S/_W$//}_src

.if !defined(FIXUP_RELEASE)
post-extract:
	@( cd ${WRKDIR}/${DISTNAME} ; \
	EXPMD5=`${SED} -n 's/^[[:blank:]]*\(MD5*=*\)/\1/p' README.${DISTNAME}` ; \
	CALCMD5=`${MD5} ${SRCBALL_NAME}.tar` ; \
	if [ "$${EXPMD5}"X != "$${CALCMD5}"X ]; then \
		${ECHO} "Expected and calculated MD5 signatures don't agree." ; \
		${ECHO} "($$EXPMD5 != $$CALCMD5)" ; \
		exit 1 ; \
	fi ; \
	${CAT} ${SRCBALL_NAME}.tar ${EXTRACT_AFTER_ARGS} \
	)
	@( cd ${WRKSRC} ; ${ECHO_CMD} "y" | ./Inventory || exit 1 )
.endif

#pre-patch:
#	@${ECHO_MSG} "===>  Applying distribution patches for ${PKGNAME}"
#	@${SED} -e "s|^--- d|--- dialects/freebsd/d|"  \
#		${DISTDIR}/freebsd_3.0_patch > ${WRKDIR}/p
#	${PATCH} ${PATCH_DIST_ARGS} < ${WRKDIR}/p

do-install:
	${INSTALL} ${COPY} ${STRIP} -o ${BINOWN} -m 2755 -g kmem ${WRKSRC}/lsof ${PREFIX}/sbin
	${INSTALL_MAN} ${WRKSRC}/lsof.8 ${MAN8PREFIX}/man/man8/lsof.8
	@${MKDIR} ${PREFIX}/share/lsof
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/* ${PREFIX}/share/lsof
	@${CHMOD} 0444 ${PREFIX}/share/lsof/00*

.include <bsd.port.pre.mk>

pre-configure:
	@${ECHO} ""
	@${ECHO} "*                      W a r n i n g                       *"
	@${ECHO} "* A more capable version of LSOF is built if you have      *"
	@${ECHO} "* the complete kernel source installed.                    *"
	@${ECHO} "* If your kernel sources are somewhere other than          *"
	@${ECHO} "* /usr/src/sys, you may set the FREEBSD_SYS variable       *"
	@${ECHO} "* to the correct path.                                     *"
	@${ECHO} ""

post-install:
	cd ${PREFIX} && \
	    ${FIND} -s share/lsof -type f -o -type l >>${TMPPLIST} ;\
	    ${FIND} -d share/lsof -type d \
	        | ${SED} -e 's/^/@dirrm /g' >>${TMPPLIST}

.include <bsd.port.post.mk>
