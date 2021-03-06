# New ports collection makefile for:	Ruby-BDB
# Date created:		8 March 2001
# Whom:			Akinori MUSHA aka knu <knu@idaemons.org>
#
# $MidnightBSD: mports/databases/ruby-bdb/Makefile,v 1.3 2008/06/26 19:43:27 laffer1 Exp $
# $FreeBSD: ports/databases/ruby-bdb/Makefile,v 1.52 2006/07/15 19:31:45 sem Exp $
#

PORTNAME=	bdb
PORTVERSION=	0.6.4
CATEGORIES=	databases ruby
MASTER_SITES=	ftp://moulon.inra.fr/pub/ruby/
PKGNAMEPREFIX=	${RUBY_PKGNAMEPREFIX}
PKGNAMESUFFIX=	${WITH_BDB_VER}
DIST_SUBDIR=	ruby

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby interface to Sleepycat's Berkeley DB revision 2 or later
LICENSE=	gpl2
# same terms as ruby

USE_BDB=	YES
WITH_BDB_VER=	43

CONFLICTS=	${PKGNAMEPREFIX}${PORTNAME}[2-4]*

USE_RUBY=	yes
USE_RUBY_EXTCONF=	yes
USE_RUBY_RDOC=		yes

CONFIGURE_ARGS=	--with-db-include=${BDB_INCLUDE_DIR} \
		--with-db-lib=${BDB_LIB_DIR} \
		--with-db-version=${BDB_LIB_NAME:S/^db//}
INSTALL_TARGET=	site-install

DOCS=		Changes \
		README.en \
		bdb.html \
		bdb.rd \
		docs/*.html \
		docs/*.rd \
		docs/doc

post-build:
.if !defined(NOPORTDOCS)
	cd ${BUILD_WRKSRC}; ${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} rdoc
.endif

.include <bsd.port.pre.mk>

DOCSDIR=	${RUBY_MODDOCDIR}
PORTDOCS=	*

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${RUBY_MODEXAMPLESDIR}/
	${CP} -R ${WRKSRC}/examples/* ${RUBY_MODEXAMPLESDIR}/
	${MKDIR} ${RUBY_MODDOCDIR}
.for f in ${DOCS}
	${CP} -R ${WRKSRC}/${f} ${RUBY_MODDOCDIR}/
.endfor
.if ${RUBY_VER} >= 1.8
	cd ${INSTALL_WRKSRC}; ${RUBY_RDOC} -R --op "${RUBY_SITERIDIR}" 
.endif
.endif

.include <bsd.port.post.mk>
