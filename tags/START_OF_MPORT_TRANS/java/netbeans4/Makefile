# New ports collection makefile for:	netbeans
# Date Created:				2 Jun 2003
# Whom:				 	olgeni@FreeBSD.org
#
# $MidnightBSD$
# $FreeBSD: ports/java/netbeans4/Makefile,v 1.21 2006/09/07 10:10:50 olgeni Exp $
#

PORTNAME=	netbeans4
PORTVERSION=	4.1
CATEGORIES=	java devel
MASTER_SITES=
DISTNAME=	netbeans-4_1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A full-featured integrated environment for Java

USE_BZIP2=	yes
USE_JAVA=	yes
JAVA_VERSION=	1.4+
NO_BUILD=	yes
RESTRICTED=	Restrictive license

WRKSRC=		${WRKDIR}/netbeans

DOWNLOAD_URL?=	http://www.netbeans.info/downloads/download.php?p=1&a=bd&os=1&lang=1&rv=4.1&b_bt=2

.include <bsd.port.pre.mk>

.if !exists(${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}) && !defined(PACKAGE_BUILDING)
IGNORE=		you must manually fetch the source distribution (${DISTFILES}) from ${DOWNLOAD_URL}, place it in ${DISTDIR} and then run make again
.endif

post-patch:
	@${RM} ${WRKSRC}/etc/netbeans.conf.orig

do-configure:
	@${REINPLACE_CMD} 's|%%JAVA_HOME%%|${JAVA_HOME}|' ${WRKSRC}/etc/netbeans.conf
	@${RM} ${WRKSRC}/etc/netbeans.conf.bak

do-install:
	@${MKDIR} ${PREFIX}/netbeans4
	@${CP} -r ${WRKSRC}/* ${PREFIX}/netbeans4
	@${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${PREFIX}/netbeans4
	@${LN} -sf ${PREFIX}/netbeans4/bin/netbeans ${PREFIX}/bin/netbeans4

.include <bsd.port.post.mk>
