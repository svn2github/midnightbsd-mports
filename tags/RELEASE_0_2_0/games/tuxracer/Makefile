# New ports collection makefile for:	tuxracer
# Date created:				8 August 2000
# Whom:					Eric Anholt
#
# $FreeBSD: ports/games/tuxracer/Makefile,v 1.23 2006/09/20 11:21:32 stas Exp $
# $MidnightBSD: mports/games/tuxracer/Makefile,v 1.1 2006/11/24 17:15:42 laffer1 Exp $
#

PORTNAME=	tuxracer
PORTVERSION=	0.61
PORTREVISION=	4
CATEGORIES=	games
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=tuxracer
DISTFILES=	${PORTNAME}-${PORTVERSION}.tar.gz \
		${PORTNAME}-data-${PORTVERSION}.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A 3d penguin racing game using OpenGL

LIB_DEPENDS=	tcl83.1:${PORTSDIR}/lang/tcl83

USE_SDL=	mixer sdl
USE_GL=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	automake:14 autoconf:261
AUTOMAKE_ARGS=	-a
CONFIGURE_ENV=	THREAD_LIB="${PTHREAD_LIBS}"
MAKE_ENV=	${CONFIGURE_ENV}
CONFIGURE_ARGS=	--with-tcl-inc="${LOCALBASE}/include/tcl8.3" \
		--with-tcl-libs="${LOCALBASE}/lib" \
		--with-gl-libs="${X11BASE}/lib" \
		--with-gl-inc="${X11BASE}/include" \
		--with-data-dir=${PREFIX}/share/tuxracer

WORKDATA=	${WRKDIR}/${PORTNAME}-data-${PORTVERSION}
COURSEDIRS=	1 2 3 4 5 6 7 8 9 10 11

post-extract:
	${RM} ${WRKSRC}/missing

post-install:
	${MKDIR} ${DATADIR}
	(${CHMOD} -R o+r ${WORKDATA} && cd ${WORKDATA} && ${TAR} -c -f - *) | \
		(cd ${DATADIR} && ${TAR} -x -f - )

.include <bsd.port.mk>
