# New ports collection makefile for:	soundjuicer
# Date created:		20 Jan 2004
# Whom:			Alexander Nedotsukov <bland@FreeBSD.org>
#
# $MidnightBSD: mports/audio/sound-juicer/Makefile,v 1.3 2008/04/10 05:04:46 ctriv Exp $
# $FreeBSD: ports/audio/sound-juicer/Makefile,v 1.39 2007/10/24 23:34:51 marcus Exp $
#   $MCom: ports/audio/sound-juicer/Makefile,v 1.71 2007/10/15 00:27:00 marcus Exp $
#

PORTNAME=	sound-juicer
PORTVERSION=	2.20.1
PORTREVISION=	1
CATEGORIES=	audio gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Clean, mean and lean CD ripper for GNOME2
LICENSE=	gpl2

LIB_DEPENDS=	musicbrainz.4:${PORTSDIR}/audio/libmusicbrainz \
		gnome-media-profiles.0:${PORTSDIR}/audio/gnome-media \
		cdio.8:${PORTSDIR}/sysutils/libcdio \
    		tag.5:${PORTSDIR}/audio/taglib

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_XLIB=	yes
USE_GMAKE=	yes
INSTALLS_OMF=	yes
USE_GNOME=	gnomehack intlhack gnomeprefix libgnomeui nautiluscdburner \
		gnomedocutils
USE_GSTREAMER=	cdparanoia vorbis flac gconf good
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-ignore-missing-cd
INSTALLS_ICONS=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MAN1=		sound-juicer.1
GCONF_SCHEMAS=	sound-juicer.schemas

post-patch:
	@${REINPLACE_CMD} -e 's|^\(SUBDIRS = .*\)tests\(.*\)|\1\2|' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
