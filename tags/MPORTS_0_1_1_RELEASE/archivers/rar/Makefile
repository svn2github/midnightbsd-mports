# New ports collection makefile for:    rar
# Date created:         15 May 1996
# Whom:                 ache
#
# $MidnightBSD: mports/archivers/rar/Makefile,v 1.1 2006/09/18 00:19:26 laffer1 Exp $
# $FreeBSD: ports/archivers/rar/Makefile,v 1.58 2006/09/03 01:35:39 kris Exp $
#

PORTNAME=	rar
PORTVERSION=	3.60
PORTEPOCH=	1
CATEGORIES=	archivers
MASTER_SITES=	http://files.rarlab.com/rar/ \
		http://files2.rarlab.com/rar/
DISTNAME=	rarbsd-3.6.0

MAINTAINER=	gkovesdan@t-hosting.hu
COMMENT=	File archiver (binary port)

IA32_BINARY_PORT=	YES
RESTRICTED=	only unmodified original package can be distributed
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/rar
PLIST_FILES=	bin/rar lib/default.sfx etc/rarfiles.lst man/cat1/rar.1
PORTDOCS=	technote.txt license.txt whatsnew.txt order.htm \
		readme.txt file_id.diz

.include <bsd.port.pre.mk>

LIB_DEPENDS+=	c.5:${PORTSDIR}/misc/compat5x

.if ${PORTOBJFORMAT} == "elf"
STRIP=
.endif

do-install:
.if !defined(WITH_STATIC)
	${INSTALL_PROGRAM} ${WRKSRC}/rar ${TARGETDIR}/bin/rar
.else
	${INSTALL_PROGRAM} ${WRKSRC}/rar_static ${TARGETDIR}/bin/rar
.endif
	${INSTALL_MAN} ${WRKSRC}/rar.txt ${TARGETDIR}/man/cat1/rar.1
	${INSTALL_DATA} ${WRKSRC}/rarfiles.lst ${TARGETDIR}/etc
	${INSTALL_DATA} ${WRKSRC}/default.sfx ${TARGETDIR}/lib

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for i in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.post.mk>
