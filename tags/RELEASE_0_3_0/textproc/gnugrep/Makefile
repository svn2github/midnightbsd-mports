# $MidnightBSD$

PORTNAME=	grep
PORTVERSION=	2.5.4
CATEGORIES=     textproc
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}
PKGNAMEPREFIX=	gnu

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU grep
LICENSE=	gpl3

GNU_CONFIGURE=	yes
MAN1=		egrep.1 \
		fgrep.1 \
		grep.1
INFO=		grep
PLIST_FILES=    bin/egrep \
		bin/fgrep \
		bin/grep

OPTIONS=	PCRE	"Compile with Perl-compatible regex support"	off

CONFLICTS=	bsd-grep-*

.include <bsd.port.pre.mk>

CONFIGURE_ARGS+=	--disable-nls

.if defined(WITH_PCRE)
LIB_DEPENDS+=	pcre.0:${PORTSDIR}/devel/pcre
.else
CONFIGURE_ARGS+=	--disable-perl-regexp
.endif

post-patch:
	@${REINPLACE_CMD} 's|mkinstalldirs = .*|mkinstalldirs = mkdir -p|g' \
		${WRKSRC}/intl/Makefile.in

.include <bsd.port.post.mk>
