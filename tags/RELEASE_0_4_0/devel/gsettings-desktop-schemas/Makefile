# $MidnightBSD: mports/devel/gsettings-desktop-schemas/Makefile,v 1.2 2013/06/17 02:59:48 laffer1 Exp $

PORTNAME=	gsettings-desktop-schemas
PORTVERSION=	3.0.1
PORTREVISION=	2
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of globally shared GSetting schemas
LICENSE=	lgpl2.1

RUN_DEPENDS=	${LOCALBASE}/etc/fonts/conf.avail/31-cantarell.conf:${PORTSDIR}/x11-fonts/cantarell-fonts

USES=		pkgconfig gettext
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_PERL5_BUILD=	yes
USE_GNOME=	gnomehack intltool glib20
GNU_CONFIGURE=	yes

GLIB_SCHEMAS=	org.gnome.desktop.a11y.applications.gschema.xml \
		org.gnome.desktop.a11y.keyboard.gschema.xml \
		org.gnome.desktop.a11y.magnifier.gschema.xml \
		org.gnome.desktop.a11y.mouse.gschema.xml \
		org.gnome.desktop.background.gschema.xml \
		org.gnome.desktop.default-applications.gschema.xml \
		org.gnome.desktop.enums.xml \
		org.gnome.desktop.interface.gschema.xml \
		org.gnome.desktop.lockdown.gschema.xml \
		org.gnome.desktop.media-handling.gschema.xml \
		org.gnome.desktop.screensaver.gschema.xml \
		org.gnome.desktop.session.gschema.xml \
		org.gnome.desktop.sound.gschema.xml \
		org.gnome.desktop.thumbnailers.gschema.xml \
		org.gnome.desktop.thumbnail-cache.gschema.xml \
		org.gnome.system.proxy.gschema.xml

.include <bsd.port.mk>
