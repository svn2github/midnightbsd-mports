# New ports collection makefile for:	apache-ant
# Date created:		21 February 2001
# Whom:			znerd@FreeBSD.org
#
# $MidnightBSD: mports/devel/apache-ant/Makefile,v 1.1 2006/10/04 16:13:30 laffer1 Exp $
# $FreeBSD: ports/devel/apache-ant/Makefile,v 1.45 2006/09/06 21:52:18 hq Exp $
#

PORTNAME=	apache-ant
PORTVERSION=	1.6.5
PORTREVISION=	2
CATEGORIES=	devel java
MASTER_SITES=	${MASTER_SITE_APACHE:S,%SUBDIR%/,ant/binaries/:bin,} \
		${MASTER_SITE_LOCAL:S,%SUBDIR%/,hq/:man,} \
		http://www.esil.univ-mrs.fr/~hquiroz/:man
DISTFILES=	${ANT_DISTFILE}:bin \
		${MANPAGE_DISTFILE}:man
EXTRACT_ONLY=	${ANT_DISTFILE}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Java- and XML-based build tool, conceptually similar to make
LICENSE=	apache2

RUN_DEPENDS=	classpath:${PORTSDIR}/java/javavmwrapper

ANT_DISTFILE=	${PORTNAME}-${PORTVERSION}-bin.tar.bz2
MANPAGE_DISTFILE=	${PORTNAME}-manpage-${MANPAGE_VERSION}.tgz
MANPAGE_VERSION=	20030908
USE_BZIP2=	yes
USE_JAVA=	yes
JAVA_VERSION=	1.2+

NO_BUILD=	YES
DATADIR=	${JAVASHAREDIR}/${PORTNAME}

READMES=	LICENSE README WHATSNEW

.if !defined(NOPORTDOCS)
PORTDOCS=	*
.endif

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

MANPAGE_SUBDIR=	apache-ant-manpage
MANPAGE_WRKSRC=	${WRKSRC}/${MANPAGE_SUBDIR}

MAN1=		ant.1
MAN5=		build.xml.5

SUB_FILES=	ant.sh

post-extract:
	@${TAR} -C ${WRKSRC} -xzf ${DISTDIR}/${MANPAGE_DISTFILE}

do-install:
	@${ECHO_MSG} -n ">> Installing scripts..."
	@${MKDIR} ${DATADIR}/bin
	@${INSTALL_SCRIPT} ${WRKDIR}/ant.sh ${PREFIX}/bin/ant
	@${INSTALL_SCRIPT} ${WRKSRC}/bin/antRun ${DATADIR}/bin/
	@${ECHO_MSG} " [ DONE ]"

.for d in etc lib
	@${ECHO_MSG} -n ">> Installing data directory '${d}'..."
	@cd ${WRKSRC} && ${FIND} ${d} -type d -exec ${MKDIR} ${DATADIR}/\{} \;
	@cd ${WRKSRC} && ${FIND} ${d} -type f -exec ${INSTALL_DATA} \{} ${DATADIR}/\{} \;
	@${ECHO_MSG} " [ DONE ]"
.endfor

	@${ECHO_MSG} -n ">> Installing manpages..."
	@${INSTALL_MAN} ${MANPAGE_WRKSRC}/ant.1 ${MAN1PREFIX}/man/man1
	@${INSTALL_MAN} ${MANPAGE_WRKSRC}/build.xml.5 ${MAN5PREFIX}/man/man5
	@${ECHO_MSG} " [ DONE ]"

.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}

	@${ECHO_MSG} -n ">> Installing readme files..."
	@${INSTALL_DATA} ${READMES:S|^|${WRKSRC}/|} ${DOCSDIR}
	@${ECHO_MSG} " [ DONE ]"

	@${ECHO_MSG} -n ">> Installing documentation files..."
	@cd ${WRKSRC}/docs && ${FIND} . -type d -exec ${MKDIR} ${DOCSDIR}/\{} \;
	@cd ${WRKSRC}/docs && ${FIND} . -type f -exec ${INSTALL_DATA} \{} ${DOCSDIR}/\{} \;
	@${ECHO_MSG} " [ DONE ]"
.endif

.include <bsd.port.mk>
