# $MidnightBSD$

PORTNAME=	zfstools
PORTVERSION=	0.3.2
CATEGORIES=	sysutils ruby
MASTER_SITES=	GH \
		http://mirror.shatow.net/freebsd/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenSolaris-compatible auto snapshotting for ZFS

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USE_GITHUB=	yes
GH_ACCOUNT=	bdrewery
GH_COMMIT=	6794ec1
GH_TAGNAME=	v${DISTVERSION}

USE_RUBY=	yes
NO_BUILD=	yes

SUB_FILES=	pkg-message

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

do-install:
	@cd ${WRKSRC}/bin && ${COPYTREE_BIN} . ${PREFIX}/sbin
	@cd ${WRKSRC}/lib && ${COPYTREE_SHARE} . ${RUBY_SITELIBDIR}
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/README.md ${DOCSDIR}
.endif

.include <bsd.port.mk>
