# $MidnightBSD$
# $FreeBSD: ports/misc/susv2/Makefile,v 1.4 2006/01/14 10:07:33 sem Exp $

PORTNAME=	susv2
PORTVERSION=	1.0
CATEGORIES=	misc
MASTER_SITES=	#
DISTNAME=	susv2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Single UNIX Specification Version 2

LICENSE=	restricted

RESTRICTED=	Redistribution of the documents is not permitted

USES=		tar:bzip2
NO_BUILD=	yes
PORTDOCS=	*

.include <bsd.port.pre.mk>

.if !exists(${DISTDIR}/${DISTNAME}${EXTRACT_SUFX})
IGNORE=		"may not be redistributed because of licensing reasons. Please visit http://www.unix-systems.org/online.html to accept their license and download ${DISTFILES} into ${DISTDIR}"
.endif

do-install:
	@${MKDIR} ${DOCSDIR}
	@${FIND} ${WRKSRC} | ${SED} -e 's#^${WRKSRC}##' | while read file; do \
		if ${TEST} -d "${WRKSRC}$$file"; then \
			${MKDIR} "${DOCSDIR}$$file"; \
		else \
			${INSTALL_DATA} "${WRKSRC}$$file" "${DOCSDIR}$$file"; \
		fi; \
	done

.include <bsd.port.post.mk>
