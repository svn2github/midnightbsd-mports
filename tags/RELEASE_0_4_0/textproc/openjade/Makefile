# $MidnightBSD: mports/textproc/openjade/Makefile,v 1.2 2009/11/09 00:42:09 laffer1 Exp $

PORTNAME=	openjade
PORTVERSION=	1.3.3p1
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/1.3.3
DISTNAME=	${PORTNAME}-${PORTVERSION:S/p/-pre/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Object-oriented SGML/XML parser toolkit and DSSSL engine
LICENSE=	mit

LIB_DEPENDS=	osp.5:${PORTSDIR}/textproc/opensp
RUN_DEPENDS=	${XMLCATMGR}:${PORTSDIR}/textproc/xmlcatmgr

USE_GCC=	any
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_PERL5=	yes
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-default-catalog=${PREFIX}/share/sgml/catalog \
		--datadir=${DATADIR}
INSTALL_TARGET=	install install-man
PLIST_SUB=	XMLCATMGR=${XMLCATMGR} \
		CATALOG_PORTS_SGML=${CATALOG_PORTS_SGML}

CATALOG_PORTS_SGML=	${PREFIX}/share/sgml/catalog.ports
XMLCATMGR=	${LOCALBASE}/bin/xmlcatmgr

MAN1=		openjade.1
DATADIR=	${PREFIX}/share/sgml/openjade

post-patch:
	@${REINPLACE_CMD} -e 's|echo aout|echo elf|' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|<iostream.h>|<iostream>|' ${WRKSRC}/style/MultiLineInlineNote.cxx

post-install:
	@${CAT} ${PLIST} | \
		${SED} ${PLIST_SUB:S/$/!g/:S/^/ -e s!%%/:S/=/%%!/} | \
		${AWK} '/^@comment INSTALL_DATA:/ \
			{printf "if ! ${GREP} -q \"%s\" ${PLIST}; then ${ECHO_CMD} \"%s\" >> %s; fi;  %s %s/%s %s/%s\n", \
			$$4, $$4, "${TMPPLIST}", "${INSTALL_DATA}", \
			"${WRKSRC}", $$3, "${PREFIX}", $$4}' | \
		${SH}

.include <bsd.port.pre.mk>

# This port cannot be CFLAGS safe, using optimizations such as
# 'march=-mpentium -Os' produces core dumps with certain input files
# Therefore, we'd better remove all machine optimizations and any -O
# other than -O{0,1,}. Idea taken from palm/prc-tools-gcc.
CPPFLAGS:=	-O ${CFLAGS:N-O*:N-m*}
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.post.mk>
