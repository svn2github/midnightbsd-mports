# New ports collection makefile for:	netbeans
# Date Created:				2 Jun 2003
# Whom:				 	olgeni@FreeBSD.org
#
# $MidnightBSD$
# $FreeBSD: ports/java/netbeans/Makefile,v 1.21 2006/09/07 10:16:34 olgeni Exp $
#

PORTNAME=	netbeans
PORTVERSION=	5.0
CATEGORIES=	java devel
MASTER_SITES=
DISTNAME=	netbeans-5_0

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A full-featured integrated environment for Java

USE_BZIP2=	yes
USE_JAVA=	yes
JAVA_VERSION=	1.4+
NO_BUILD=	yes
RESTRICTED=	Restrictive license

WRKSRC=		${WRKDIR}/netbeans

DOWNLOAD_URL?=	http://www.netbeans.info/downloads/download.php?type=5.0&p=1&a=bsd&os=1&lang=1&rv=5.0&b_bt=2

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
	@${MKDIR} ${PREFIX}/netbeans
	@${CP} -r ${WRKSRC}/* ${PREFIX}/netbeans
	@${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${PREFIX}/netbeans
	@${LN} -sf ${PREFIX}/netbeans/bin/netbeans ${PREFIX}/bin/netbeans

.include <bsd.port.post.mk>
