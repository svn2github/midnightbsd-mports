# $MidnightBSD: mports/news/slrn/Makefile,v 1.1 2006/11/02 22:27:23 wintellect Exp $

PORTNAME=	slrn
PORTVERSION=	0.9.9p1
CATEGORIES=	news ipv6
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE} \
		ftp://angel.sovam.com/pub/tools/net/news/ \
		ftp://ftp.fu-berlin.de/pub/unix/news/slrn/ \
		ftp://ftp.ntua.gr/pub/lang/slang/slrn/ \
		ftp://ftp.plig.org/pub/slrn/
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SLang-based newsreader
LICENSE=	gpl2

LIB_DEPENDS=	slang.2:${PORTSDIR}/devel/libslang2

USE_GMAKE=	yes
USE_ICONV=	yes

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
.else
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.endif

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--enable-ipv6 --disable-inews --with-slrnpull \
			--with-libiconv-prefix=${LOCALBASE}

.if !defined(WITHOUT_SSL)
USE_OPENSSL=	YES
CONFIGURE_ARGS+=	--with-ssl
.endif

.if defined(WITH_DEVIEW)
LIB_DEPENDS+=	uu.3:${PORTSDIR}/converters/uulib
CONFIGURE_ARGS+=	--with-uulib
.endif

.if defined(NOPORTDOCS)
# Use dummy target rather than rewriting makefile
CONFIGURE_ARGS+=	--with-docdir=${WRKSRC}/dummy
.endif

ALL_TARGET=	all

MAN1=		slrn.1 slrnpull.1

post-patch:
	@${REINPLACE_CMD} -e 's,/usr/lib/sendmail,/usr/sbin/sendmail,' \
		${WRKSRC}/src/slrnfeat.hin
	@${REINPLACE_CMD} -e 's,malloc.h,stdlib.h,' \
		${WRKSRC}/src/jdmacros.h

.include <bsd.port.mk>
