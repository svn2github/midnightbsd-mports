# New ports collection makefile for:	cvs2svn
# Date created:		1 May 2004
# Whom:			Hye-Shik Chang
#
# $MidnightBSD: mports/devel/cvs2svn/Makefile,v 1.2 2008/08/23 20:55:39 laffer1 Exp $
# $FreeBSD: ports/devel/cvs2svn/Makefile,v 1.15 2008/03/16 23:05:51 araujo Exp $

PORTNAME=	cvs2svn
PORTVERSION=	2.1.0
CATEGORIES=	devel
MASTER_SITES=	http://cvs2svn.tigris.org/files/documents/1462/41596/ \
		http://cvs2svn.tigris.org/files/documents/1462/39919/ \
		ftp://ftp.rewt.org.uk/pub/distfiles/ \
		http://gentoo.nedlinux.nl/distfiles/ \
		${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	jkoshy

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CVS to Subversion Repository Converter
LICENSE=	other

LIB_DEPENDS=	aprutil-1.2:${PORTSDIR}/devel/apr-svn
BUILD_DEPENDS=	${PYTHON_SITELIBDIR}/gdbm.so:${PORTSDIR}/databases/py-gdbm
RUN_DEPENDS=	${LOCALBASE}/bin/svn:${PORTSDIR}/devel/subversion \
		${LOCALBASE}/bin/git:${PORTSDIR}/devel/git \
		${BUILD_DEPENDS}

DISABLE_SIZE=	yes

USE_PYTHON=	2.3+
USE_PYDISTUTILS=	yes

MAN1=		cvs2svn.1

# The only thing different in this target vs. the one found in bsd.port.mk
# is that the extract command exit code is ignored.  tar exits with status
# 1 because the distfile contains a symlink that points nowhere.
do-extract:
	@${RM} -rf ${WRKDIR}
	@${MKDIR} ${WRKDIR}
	@-for file in ${EXTRACT_ONLY}; do \
		if ! (cd ${WRKDIR} && ${EXTRACT_CMD} ${EXTRACT_BEFORE_ARGS} ${_DISTDIR}/$$file ${EXTRACT_AFTER_ARGS});\
		then \
			exit 1; \
		fi; \
	done

post-install:
	${INSTALL_MAN} ${WRKSRC}/cvs2svn.1 ${PREFIX}/man/man1/

.include <bsd.port.mk>
