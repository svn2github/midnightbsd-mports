# $MidnightBSD$

PORTNAME=	libmusicbrainz3
PORTVERSION=	3.0.3
CATEGORIES=	audio
MASTER_SITES=	ftp://ftp.musicbrainz.org/pub/musicbrainz/ \
    		http://uk.musicbrainz.org/pub/musicbrainz/ \
		http://ftp.osuosl.org/pub/musicbrainz/
DISTNAME=	${PORTNAME:S/3//}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MusicBrainz client library for audio metadata lookup
LICENSE=	lgpl

LIB_DEPENDS=	discid:${PORTSDIR}/audio/libdiscid \
		neon.27:${PORTSDIR}/www/neon29

USE_CMAKE=	yes
USE_GNOME=	pkgconfig
USE_LDCONFIG=	yes

MAKE_JOBS_SAFE=	yes

.include <bsd.port.pre.mk>

pre-configure:
	${REINPLACE_CMD} -e '/pkgconfig/s|$${LIB_INSTALL_DIR}|libdata|' \
		-e '/CppUnit/d' ${WRKSRC}/CMakeLists.txt

.include <bsd.port.post.mk>
