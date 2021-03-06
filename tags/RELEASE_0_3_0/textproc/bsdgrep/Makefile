# $MidnightBSD: mports/textproc/bsdgrep/Makefile,v 1.1 2010/07/31 03:31:11 laffer1 Exp $

PORTNAME=	grep
PORTVERSION=	20091130
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	gabor
PKGNAMEPREFIX=	bsd-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	BSD-licensed version of grep from OpenBSD
LICENSE=	bsd3

WRKSRC=		${WRKDIR}/${PORTNAME}
MANCOMPRESSED=	maybe
MAN1=		grep.1
MLINKS=		grep.1 egrep.1 \
		grep.1 fgrep.1 \
		grep.1 zgrep.1 \
		grep.1 zegrep.1 \
		grep.1 zfgrep.1

MAKE_ENV+=	BINDIR="${PREFIX}/bin" \
		MANDIR="${MANPREFIX}/man/man" \
		CATDIR="${MANPREFIX}/man/man" \
		NLSDIR="${PREFIX}/share/nls"

OPTIONS=	NLS	"Compile with NLS support"	on \
		GNU_COMPAT	"Use GNU regex library (recommended)"	on

CONFLICTS=	gnugrep-*

.include <bsd.port.pre.mk>

.if defined(WITHOUT_NLS)
MAKE_ENV+=	WITHOUT_NLS=yes
PLIST_SUB+=	NLS="@comment "
.else
PLIST_SUB+=	NLS=""
.endif

.if defined(WITHOUT_GNU_COMPAT)
MAKE_ENV+=	WITHOUT_GNU_COMPAT=yes
.endif

pre-install:
.if defined(WITH_NLS)
	${MKDIR} -p ${PREFIX}/share/nls/gl_ES.ISO8859-1
.endif

post-install:
	${LN} -s ${PREFIX}/bin/grep ${PREFIX}/bin/bsdgrep
	${LN} -s /usr/bin/grep ${PREFIX}/bin/gnugrep

.include <bsd.port.post.mk>
