# New ports collection makefile for:	netbeans
# Date Created:				2 Jun 2003
# Whom:				 	olgeni@FreeBSD.org
#
# $MidnightBSD: mports/java/netbeans/Makefile,v 1.3 2008/06/10 00:47:38 laffer1 Exp $
# $FreeBSD: ports/java/netbeans/Makefile,v 1.29 2008/02/12 11:24:13 olgeni Exp $
#

PORTNAME=	netbeans
PORTVERSION=	6.1
CATEGORIES=	java devel
MASTER_SITES=	http://download.netbeans.org/netbeans/6.1/final/zip/
DISTNAME=	netbeans-${PORTVERSION}-200805300101-ml

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A full-featured integrated environment for Java
LICENSE=	agg

USE_ZIP=	yes
USE_JAVA=	yes
JAVA_VERSION=	1.5+
NO_BUILD=	yes

WRKSRC=		${WRKDIR}/netbeans

SUB_FILES=	pkg-install pkg-deinstall

.include <bsd.port.pre.mk>

post-patch:
	@${RM} ${WRKSRC}/etc/netbeans.conf.orig
	@${REINPLACE_CMD} -e "s@%%GREP%%@${GREP}@" \
		-e "s@%%GCONFTOOL%%@${LOCALBASE}/bin/gconftool-2@" \
		${WRKSRC}/platform8/lib/nbexec

do-configure:
	@${REINPLACE_CMD} 's|%%JAVA_HOME%%|${JAVA_HOME}|' ${WRKSRC}/etc/netbeans.conf
	@${RM} ${WRKSRC}/etc/netbeans.conf.bak

do-install:
	@${MKDIR} ${PREFIX}/netbeans
	@${CP} -r ${WRKSRC}/* ${PREFIX}/netbeans
	@${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${PREFIX}/netbeans
	@${LN} -sf ${PREFIX}/netbeans/bin/netbeans ${PREFIX}/bin/netbeans
	@(cd ${WRKDIR}; ${FIND} -s netbeans -not -type d) >> ${TMPPLIST}
	@(cd ${WRKDIR}; ${FIND} -s -d netbeans -type d) | ${SED} -ne 's,^,@dirrm ,p' >> ${TMPPLIST}
	@(cd ${WRKDIR}; ${FIND} -s -d netbeans -type d -empty) | ${SED} -ne 's,^,@exec mkdir -p %D/,p' >> ${TMPPLIST}

.include <bsd.port.post.mk>
