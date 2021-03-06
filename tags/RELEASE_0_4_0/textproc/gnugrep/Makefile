# $MidnightBSD: mports/textproc/gnugrep/Makefile,v 1.1 2010/07/31 03:28:23 laffer1 Exp $

PORTNAME=	grep
PORTVERSION=	2.7
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}
PKGNAMEPREFIX=	gnu

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU grep
LICENSE=	gpl3

CONFLICTS=	bsd-grep-*

USE_XZ=		yes

GNU_CONFIGURE=	yes

MAN1=		egrep.1 \
		fgrep.1 \
		grep.1
INFO=		grep

OPTIONS=	PCRE	"Compile with Perl-compatible regex support"	off

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
CONFIGURE_ENV+=	LDFLAGS="${LDFLAGS}"
LDFLAGS+=	-lintl -L${LOCALBASE}/lib
PLIST_SUB+=	NLS=
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.if defined(WITH_PCRE)
LIB_DEPENDS+=	pcre.0:${PORTSDIR}/devel/pcre
.else
CONFIGURE_ARGS+=	--disable-perl-regexp
.endif

post-patch:
.if defined(WITHOUT_NLS)
	@${REINPLACE_CMD} '/install-exec-local:/s/install-exec-localcharset//' \
		${WRKSRC}/lib/Makefile.in
.endif
	@${REINPLACE_CMD} 's|mkinstalldirs = .*|mkinstalldirs = mkdir -p|g' \
		${WRKSRC}/po/Makefile.in.in

.include <bsd.port.post.mk>
