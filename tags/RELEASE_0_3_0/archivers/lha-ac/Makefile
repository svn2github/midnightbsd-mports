# New ports collection makefile for:    lha-autoconf
# Date created:         24 Sep 2004
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/archivers/lha-ac/Makefile,v 1.1 2007/05/01 23:43:40 laffer1 Exp $
# $FreeBSD: ports/archivers/lha-ac/Makefile,v 1.4 2006/09/05 05:01:47 dinoex Exp $
#

PORTNAME=	lha
PORTVERSION=	1.14i
PORTREVISION=	9
CATEGORIES=	archivers
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE_JP} \
		http://qgpop.dl.sourceforge.jp/%SUBDIR%/ \
		http://osdn.dl.sourceforge.jp/%SUBDIR%/
MASTER_SITE_SUBDIR=	lha/22231
PKGNAMESUFFIX=	-ac${PKGNAMESUFFIX2}
DISTNAME=	${PORTNAME}-${PORTVERSION}-ac20050924p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Archive files using LZSS and Huffman compression (.lzh files)
LICENSE=	restricted

MAN1=		lha.1
MANLANG=	ja
PLIST_FILES=	bin/lha
#PLIST_DIRS=	man/ja/man1
GNU_CONFIGURE=	yes

RESTRICTED=	no permission to redistribute

.if !defined(WITHOUT_NLS)
CONFIGURE_ARGGS+=	--disable-multibyte-filename
.else
CONFIGURE_ARGGS+=	--enable-multibyte-filename=auto
.endif

do-install:
	-${MKDIR} ${MANPREFIX}/man/ja/man1
	${INSTALL_PROGRAM} ${WRKSRC}/src/lha ${PREFIX}/bin/lha
	${INSTALL_MAN} ${WRKSRC}/man/lha.n ${MANPREFIX}/man/ja/man1/lha.1

.include <bsd.port.mk>
