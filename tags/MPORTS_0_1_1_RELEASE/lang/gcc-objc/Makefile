# New ports collection makefile for:	gnustep-objc
# Date created:		28.Mar.2003
# Whom:			dirk.meyer@dinoex.sub.org
#
# $MidnightBSD$
# $FreeBSD: ports/lang/gcc-objc/Makefile,v 1.17 2006/04/06 13:31:42 dinoex Exp $
#

PORTEPOCH?=		3
CATEGORIES=		lang
PKGNAMESUFFIX=		-objc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Compiler Collection ${COMMENT2} with threads and shared libs

WITHOUT_JAVA=		yes

.if !defined(GNUSTEP_WITH_GCC32) && !defined(GNUSTEP_WITH_GCC33) && !defined(GNUSTEP_WITH_GCC34)
.if !defined(GNUSTEP_WITH_GCC40) && !defined(GNUSTEP_WITH_GCC41) && !defined(GNUSTEP_WITH_GCC42)
GNUSTEP_WITH_GCC32=	yes
.endif
.endif

.if defined(GNUSTEP_WITH_GCC32)
MASTERDIR?=		${.CURDIR}/../gcc32
CONFLICTS?=		gcc-3.2*
COMMENT2=		3.2.x
WANT_SHAREDLIBS=	yes
WANT_THREADS_SUPPORT=	yes
.endif
.if defined(GNUSTEP_WITH_GCC33)
MASTERDIR?=		${.CURDIR}/../gcc33
CONFLICTS?=		gcc-3.3*
COMMENT2=		3.3.x
BROKEN=			libobjc.so missing
.endif
.if defined(GNUSTEP_WITH_GCC34)
MASTERDIR?=		${.CURDIR}/../gcc34
CONFLICTS?=		gcc-3.4*
COMMENT2=		3.4.x
BROKEN=			libobjc.so missing
.endif
.if defined(GNUSTEP_WITH_GCC40)
MASTERDIR?=		${.CURDIR}/../gcc40
CONFLICTS?=		gcc-4.0*
COMMENT2=		4.0.x
.endif
.if defined(GNUSTEP_WITH_GCC41)
MASTERDIR?=		${.CURDIR}/../gcc41
CONFLICTS?=		gcc-4.1*
COMMENT2=		4.1.x
.endif
.if defined(GNUSTEP_WITH_GCC42)
MASTERDIR?=		${.CURDIR}/../gcc42
CONFLICTS?=		gcc-4.2*
COMMENT2=		4.2.x
.endif

.if exists(${.CURDIR}/Makefile.local)
.include "${.CURDIR}/Makefile.local"
.endif

.include "${MASTERDIR}/Makefile"
