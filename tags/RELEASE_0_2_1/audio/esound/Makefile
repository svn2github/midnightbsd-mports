# New ports collection makefile for:	esound
# Date created:		19 July 1998
# Whom:			Vanilla I. Shu <vanilla@FreeBSD.org>
#
# $MidnightBSD: mports/audio/esound/Makefile,v 1.2 2008/02/25 00:33:28 laffer1 Exp $
# $FreeBSD: ports/audio/esound/Makefile,v 1.62 2007/02/01 02:41:17 kris Exp $
#

PORTNAME=	esound
PORTVERSION=	0.2.38
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/0.2
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A sound library for enlightenment package
LICENSE=	gpl2

LIB_DEPENDS=	audiofile.0:${PORTSDIR}/audio/libaudiofile

USE_AUTOTOOLS=	libtool:15
USE_BZIP2=	yes
USE_GNOME=	gnometarget gnomehack
USE_LDCONFIG=	yes
GNU_CONFIGURE=  yes
CONFIGURE_ENV=	JW=false
USE_GETOPT_LONG=yes

CONFLICTS=	py*-ro-[0-9]*

MAN1=	esd-config.1 esd.1 esdcat.1 esdctl.1 esddsp.1 esdfilt.1 esdloop.1 \
	esdmon.1 esdplay.1 esdrec.1 esdsample.1

post-patch:
	@${REINPLACE_CMD} -e 's|esdconf_DATA = esd.conf|esdconf_DATA = |g' \
		${WRKSRC}/Makefile.in

post-install:
	if [ ! -f ${PREFIX}/etc/esd.conf ]; then \
		${INSTALL_DATA} ${WRKSRC}/esd.conf ${PREFIX}/etc/esd.conf; \
		${INSTALL_DATA} ${WRKSRC}/esd.conf ${PREFIX}/etc/esd.conf.default; \
	else \
		${INSTALL_DATA} ${WRKSRC}/esd.conf ${PREFIX}/etc/esd.conf.default; \
	fi

.include <bsd.port.mk>
