# Ports collection makefile for:	openmpi
# Date created:				19 Oct 2007
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/net/openmpi/Makefile,v 1.1 2007/10/19 20:40:10 laffer1 Exp $
#

# TODO:
# fix man pages
#  - etc/*.sample support

PORTNAME=	openmpi
DISTVERSION=	1.2.5
CATEGORIES=	net parallel
MASTER_SITES=	http://www.open-mpi.org/software/ompi/v1.2/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A High Performance Message Passing Library

LIB_DEPENDS=	execinfo:${PORTSDIR}/devel/libexecinfo

USE_BZIP2=	yes
HAS_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GCC=	4.2+

MPIBASE?=	mpi
MPIDIR?=	${MPIBASE}/${UNIQUENAME}

PLIST_SUB+=	MPIBASE=${MPIBASE}
PLIST_SUB+=	MPIDIR=${MPIDIR}

CONFIGURE_ARGS+=	--prefix=${PREFIX}/${MPIDIR} ${CONFIGURE_TARGET} \
			--mandir=${PREFIX}/${MPIDIR}

USE_LDCONFIG=	${PREFIX}/${MPIDIR}/lib \
		${PREFIX}/${MPIDIR}/lib/openmpi

# this has goofy man page installations
# we have to depend on them in the plist instead of the tranditional
# method.
.include <bsd.port.pre.mk>

USE_FORTRAN=	yes
CONFIGURE_ENV+=	F77=${F77} FC=${FC}
.if ${ARCH} == "sparc64"
BROKEN=		Does not compile on sparc64
.endif

.if exists(${LOCALBASE}/lib/libtorque.so)
WITH_TORQUE=	yes
.endif

.if defined(WITH_TORQUE)
LIB_DEPENDS+=	torque.0:${PORTSDIR}/sysutils/torque
CONFIGURE_ARGS+=	--with-tm=${LOCALBASE}
PLIST_SUB+=	TORQUE=""
.else
PLIST_SUB+=	TORQUE="@comment "
.endif

#######################################################################
# The following targets are for the port maintainer.  Use at your own #
# risk, no user-serviceable parts inside.                             #
#                                                                     #
# XXX: we should generate MLINKS programaticaly, but it would take    #
# some effort and there's only one entry at this time.                #
#######################################################################
build-plist: Makefile
	${RM} ${PLIST}
	${FIND} ${PREFIX}/${MPIDIR} -name man -prune -o -type f -print | \
	    ${SED} -e 's|${PREFIX}/${MPIDIR}|%%MPIDIR%%|' | \
	    ${SORT} >> ${PLIST}
	${FIND} ${PREFIX}/${MPIDIR} -name man -prune -o -type l -print | \
	    ${SED} -e 's|${PREFIX}/${MPIDIR}|%%MPIDIR%%|' | \
	    ${SORT} >> ${PLIST}
	${FIND} ${PREFIX}/${MPIDIR} -type d | \
	    egrep -v "${PREFIX}/${MPIDIR}$$" | \
	    ${SED} -e 's|${PREFIX}/${MPIDIR}|@dirrm %%MPIDIR%%|' | \
	    ${SORT} -r >> ${PLIST}
	${ECHO} "@dirrmtry %%MPIDIR%%" \
	    >> ${PLIST}
	${ECHO} "@dirrmtry %%MPIBASE%%" \
	    >> ${PLIST}
	@echo "# Do not edit!  Auto-generated file." > ${.CURDIR}/Makefile.man
	@echo "# See build-plist target in Makefile." >> ${.CURDIR}/Makefile.man
	@echo "#" >> ${.CURDIR}/Makefile.man
	@echo "MLINKS=mpic++.1 mpiCC.1" >> ${.CURDIR}/Makefile.man
	${FIND} ${PREFIX}/${MPIDIR}/man -type f | \
	    ${SED} -e 's|.*man\([0-9LN]\)/\(.*\)|MAN\1+=\2|' -e 's/\.gz$$//' \
	    >> ${.CURDIR}/Makefile.man

.include <bsd.port.post.mk>
