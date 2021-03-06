# New ports collection makefile for:	enlightenment
# Date created:			10 June 1997
# Whom:				Yukihiro Nakai <Nakai@Mlab.t.u-tokyo.ac.jp>
#
# $MidnightBSD: mports/x11-wm/enlightenment/Makefile,v 1.3 2008/06/01 16:15:11 laffer1 Exp $
# $FreeBSD: ports/x11-wm/enlightenment/Makefile,v 1.101 2007/10/27 18:50:51 pav Exp $
#

PORTNAME=	enlightenment
PORTVERSION=	0.16.8.13
CATEGORIES=	x11-wm
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}
DISTNAME=	e16-${PORTVERSION}-0.01

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A very artistic X window manager
LICENSE=	unknown

LIB_DEPENDS=	Imlib2.5:${PORTSDIR}/graphics/imlib2

DATADIR=	${PREFIX}/share/e16

USE_XORG=	xbitmaps xft x11
USE_EFL=	Imlib2
USE_ICONV=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-fsstd --disable-esdtest --disable-dependency-tracking \
		--disable-rpath
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.if !defined(WITHOUT_ESOUND)
USE_GNOME=	esound
.else
CONFIGURE_ARGS+=--disable-sound
.endif

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
PLIST_FILES=	share/locale/bg/LC_MESSAGES/e16.mo \
		share/locale/bs/LC_MESSAGES/e16.mo \
		share/locale/da/LC_MESSAGES/e16.mo \
		share/locale/de/LC_MESSAGES/e16.mo \
		share/locale/en_US/LC_MESSAGES/e16.mo \
		share/locale/es/LC_MESSAGES/e16.mo \
		share/locale/fr/LC_MESSAGES/e16.mo \
		share/locale/hu/LC_MESSAGES/e16.mo \
		share/locale/ja/LC_MESSAGES/e16.mo \
		share/locale/ko/LC_MESSAGES/e16.mo \
		share/locale/nl/LC_MESSAGES/e16.mo \
		share/locale/no/LC_MESSAGES/e16.mo \
		share/locale/pl/LC_MESSAGES/e16.mo \
		share/locale/pt/LC_MESSAGES/e16.mo \
		share/locale/pt_BR/LC_MESSAGES/e16.mo \
		share/locale/ru/LC_MESSAGES/e16.mo \
		share/locale/sv/LC_MESSAGES/e16.mo \
		share/locale/tr/LC_MESSAGES/e16.mo
.else
CONFIGURE_ARGS+=--disable-nls
.endif

post-patch:
	@${REINPLACE_CMD}  \
		-e 's|%%PREFIX%%|${PREFIX}|g' ${WRKSRC}/scripts/e_gen_menu

.include <bsd.port.mk>
