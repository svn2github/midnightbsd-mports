# ex:ts=8
# Ports collection makefile for:	gcc with gcj+AWT
# Date created:				17 April 2006
# Whom:					Maho Nakata <maho@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/lang/gcc42-withgcjawt/Makefile,v 1.10 2006/08/18 01:39:13 maho Exp $
#

PKGNAMESUFFIX=	-withgcjawt

MAINTAINER=	ports@MidnightBSD.org

MASTERDIR=	${.CURDIR}/../../lang/gcc42

DESCR=	${.CURDIR}/pkg-descr

WITH_JAVA_AWT=	yes

.if defined (WITHOUT_JAVA)
BROKEN=		Does not build gcj
.endif

#weird libtool issue http://gcc.gnu.org/bugzilla/show_bug.cgi?id=28442
EXTRA_PATCHES+=	${.CURDIR}/files/patch-configure
USE_AUTOTOOLS=	libtool:15

pre-build:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' ${SRCDIR}/libjava/configure
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' ${SRCDIR}/libjava/classpath/configure

.include "${MASTERDIR}/Makefile"
