# New ports collection Makefile for:	geany
# Date Created:				15 Jan 06
# Whom:					Remington Lang <MrL0Lz@gmail.com>
#
# $MidnightBSD: mports/devel/geany/Makefile,v 1.3 2011/09/04 17:39:36 laffer1 Exp $
# $FreeBSD: ports/devel/geany/Makefile,v 1.10 2008/06/06 13:21:12 edwin Exp $
#

PORTNAME=	geany
PORTVERSION=	0.21
CATEGORIES=	devel editors
MASTER_SITES=	http://download.geany.org/ SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A fast and lightweight GTK+ IDE
LICENSE=	gpl2

GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gtk20
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

OPTIONS=	VTE	"Enable Virtual Terminal Emulation support"	on \
		NLS	"Enable Native Language support"		on

MAN1=		geany.1

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.if !defined(WITHOUT_VTE)
USE_GNOME+=	vte
CONFIGURE_ARGS+=--enable-vte
.else
CONFIGURE_ARGS+=--disable-vte
.endif

post-patch:
.if defined(NOPORTDOCS)
	@${REINPLACE_CMD} -e '/^SUBDIRS/ s|doc||' ${WRKSRC}/Makefile.in
.endif
.if defined(WITHOUT_NLS)
	@${REINPLACE_CMD} -e '/^SUBDIRS/ s|po||' ${WRKSRC}/Makefile.in
.endif

post-configure:
	@${REINPLACE_CMD} -e 's|(libdir)/pkgconfig|(prefix)/libdata/pkgconfig|' \
		${WRKSRC}/Makefile

post-install:
	${INSTALL_DATA} ${WRKSRC}/geany.desktop ${PREFIX}/share/applications/
	${INSTALL_MAN} ${WRKSRC}/doc/geany.1 ${MAN1PREFIX}/man/man1

.include <bsd.port.post.mk>
