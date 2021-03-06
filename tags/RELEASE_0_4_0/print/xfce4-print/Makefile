# New ports collection makefile for:	xfprint
# Date created:		7 June 2003
# Whom:			James Earl <jdearl@telus.net>
#
# $MidnightBSD: mports/print/xfce4-print/Makefile,v 1.4 2011/12/15 00:57:53 laffer1 Exp $
# $FreeBSD: ports/print/xfce4-print/Makefile,v 1.50 2008/06/06 13:58:00 edwin Exp $
#

PORTNAME=	xfce4-print
PORTVERSION=	4.6.1
PORTREVISION=	1
CATEGORIES=	print xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
MASTER_SITE_SUBDIR=xfce/4.6.1/src
DISTNAME=	xfprint-${PORTVERSION}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XFce 4 graphical frontend for printing
LICENSE=	gpl2

GNU_CONFIGURE=	yes
INSTALLS_ICONS= yes
USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	glib20 gnomehack  gtk20 intltool intlhack pkgconfig
USE_LDCONFIG=	yes
USE_XFCE=	configenv libgui libutil xfconf

OPTIONS=	LPR	"Use lpr as printing system"		on \
		CUPS	"Use cups as printing system"		off \
		LETTER	"Use letter paper format instead of A4" off

.include <bsd.port.pre.mk>

.if defined(WITH_CUPS)
CONFIGURE_ARGS+=--enable-cups
LIB_DEPENDS+=	cups.2:${PORTSDIR}/print/cups-client
PLIST_SUB+=	CUPS=""
.else
CONFIGURE_ARGS+=--disable-cups
PLIST_SUB+=	CUPS="@comment "
.endif

.if defined(WITHOUT_LPR)
CONFIGURE_ARGS+=--disable-bsdlpr
PLIST_SUB+=	LPR="@comment "
.else
CONFIGURE_ARGS+=--enable-bsdlpr --with-printcap=/etc/printcap
PLIST_SUB+=	LPR=""
.endif

.if defined(WITHOUT_LPR) && !defined(WITH_CUPS)
IGNORE=		You have to define WITH_CUPS or undefine WITHOUT_LPR in order to install this port.
.endif

.if defined(WITH_LETTER)
CONFIGURE_ARGS+=--enable-letter
BUILD_DEPENDS+=	a2ps:${PORTSDIR}/print/a2ps-letter
RUN_DEPENDS+=	a2ps:${PORTSDIR}/print/a2ps-letter
.else
CONFIGURE_ARGS+=--disable-letter
BUILD_DEPENDS+=	a2ps:${PORTSDIR}/print/a2ps-a4
RUN_DEPENDS+=	a2ps:${PORTSDIR}/print/a2ps-a4
.endif

post-patch:
	@${REINPLACE_CMD} -e 's/@LDFLAGS@/& -Wl,-E/' ${WRKSRC}/xfprint/Makefile.in \
		 ${WRKSRC}/xfprint-manager/Makefile.in

.include <bsd.port.post.mk>
