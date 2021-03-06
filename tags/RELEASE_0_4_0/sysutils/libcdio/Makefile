# $MidnightBSD: mports/sysutils/libcdio/Makefile,v 1.6 2011/09/18 00:38:14 laffer1 Exp $

PORTNAME=	libcdio
PORTVERSION=	0.83
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	libcdio

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compact Disc Input and Control Library
LICENSE=	gpl3

LIB_DEPENDS=	cddb.4:${PORTSDIR}/audio/libcddb \
		popt.0:${PORTSDIR}/devel/popt \
		cdda_paranoia.0:${PORTSDIR}/audio/cdparanoia

GNU_CONFIGURE=	yes
USE_GNOME=	pkgconfig gnomehack
USE_GMAKE=	yes
USE_ICONV=	yes
USE_LDCONFIG=	yes
USE_NCURSES=	yes
CONFIGURE_ARGS+=	--with-libpopt-prefix=${LOCALBASE} \
			--with-libiconv-prefix=${LOCALBASE} \
USE_PERL5_BUILD=yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -liconv
MAN1=	cd-drive.1 cd-info.1 iso-read.1 iso-info.1 cd-read.1

INFO=		libcdio

.include <bsd.port.pre.mk>

_MANLANG=	"" ja
_MAN1=	cd-paranoia.1
.for lang in ${_MANLANG}
_MANPAGES+=	${_MAN1:S%^%${MAN1PREFIX}/man/${lang}/man1/%}
.endfor

post-patch:
	${REINPLACE_CMD} -e 's|/jp/man1|/ja/man1|' \
		${WRKSRC}/src/cd-paranoia/doc/ja/Makefile.in
	${REINPLACE_CMD} -e "s,freebsd5\.\*,freebsd*," ${WRKSRC}/configure

.include <bsd.port.post.mk>
