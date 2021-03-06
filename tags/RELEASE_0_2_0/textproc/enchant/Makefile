# New ports collection makefile for:	enchant
# Date created:				03 January 2004
# Whom:					Adam Weinberger <adamw@FreeBSD.org>
#
# $MidnightBSD: mports/textproc/enchant/Makefile,v 1.1 2007/08/22 08:53:28 laffer1 Exp $
# $FreeBSD: ports/textproc/enchant/Makefile,v 1.23 2006/11/30 20:37:18 mezz Exp $
#

PORTNAME=	enchant
PORTVERSION=	1.4.0
CATEGORIES=	textproc gnome
MASTER_SITES=	http://www.abisource.com/downloads/${PORTNAME}/${PORTVERSION}/
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dictionary/spellchecking framework
LICENSE=	lgpl

LIB_DEPENDS=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib

USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:15
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack gnometarget glib20 ltverhack
CONFIGURE_ARGS=	--disable-hspell \
		--disable-uspell
CONFIGURE_ENV+=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MAN1=		enchant.1

.ifndef(WITHOUT_ASPELL)
LIB_DEPENDS+=	pspell.16:${PORTSDIR}/textproc/aspell
CONFIGURE_ARGS+=--enable-aspell \
		--with-aspell-prefix=${LOCALBASE}
PLIST_SUB+=	ASPELL=""
.else
CONFIGURE_ARGS+=--disable-aspell
PLIST_SUB+=	ASPELL="@comment "
.endif

.include <bsd.port.pre.mk>

# Disable, it needs hspell 0.9 or above.
#.if exists(${LOCALBASE}/bin/hspell)
#WITH_HSPELL=	yes
#.endif
#
#.if defined(WITH_HSPELL)
#BUILD_DEPENDS+=	hspell:${PORTSDIR}/hebrew/hspell
#CONFIGURE_ARGS+=--enable-hspell
#PLIST_SUB+=	HSPELL=""
#.else
#CONFIGURE_ARGS+=--disable-hspell
#PLIST_SUB+=	HSPELL="@comment "
#.endif

pre-everything::
.if !defined(WITHOUT_ASPELL) || !defined(WITH_HSPELL)
	@${ECHO_CMD} '===> The following options are available for this port:'
.if !defined(WITHOUT_ASPELL)
	@${ECHO_CMD} '===>'
	@${ECHO_CMD} '===> Define WITHOUT_ASPELL to disable aspell support'
.endif
#.if !defined(WITH_HSPELL)
#	@${ECHO_CMD} '===>'
#	@${ECHO_CMD} '===> Define WITH_HSPELL to enable hspell (Hebrew) support'
#.endif
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|MKDIRPROG-mkdir|MKDIRPROG-mkdir -p|g' \
		${WRKSRC}/install-sh
.if ${OSVERSION} < 700042
	@${REINPLACE_CMD} -E -e "s|-Wunsafe-loop-optimizations ||g" \
		-e "s|-Wno-missing-field-initializers ||g" \
		-e "s|-Wno-attributes ||g" \
			${WRKSRC}/configure
.endif

.include <bsd.port.post.mk>
