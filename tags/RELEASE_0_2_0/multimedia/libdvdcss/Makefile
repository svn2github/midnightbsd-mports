# ex:ts=8
# New ports collection makefile for:	libdvdcss
# Date created:		Jul 6, 2001
# Whom:			ijliao
#
# $MidnightBSD: mports/multimedia/libdvdcss/Makefile,v 1.2 2008/06/17 22:13:22 stevan Exp $
# $FreeBSD: ports/multimedia/libdvdcss/Makefile,v 1.28 2006/05/10 22:37:31 edwin Exp $
#

PORTNAME=	libdvdcss
PORTVERSION=	1.2.9
PORTREVISION=	3
CATEGORIES=	multimedia
MASTER_SITES=	http://download.videolan.org/pub/%SUBDIR%/
MASTER_SITE_SUBDIR=	${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable abstraction library for DVD decryption
LICENSE=	gpl2

NO_CDROM=	CSS code may violate the DMCA

USE_AUTOTOOLS=	libtool:15
USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

.ifndef(WITH_DOXYGEN)
NOPORTDOCS=	yes
.endif

.ifndef(NOPORTDOCS)
BUILD_DEPENDS+=	doxygen:${PORTSDIR}/devel/doxygen

PORTDOCS=	*
.endif

pre-everything::
.if !defined(WITH_DOXYGEN)
	@${ECHO_MSG} '==> Define WITH_DOXYGEN to build API documentation'
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|malloc.h|stdlib.h|' ${WRKSRC}/src/ioctl.c
# should we disable doc building?
.ifdef(NOPORTDOCS)
	@${REINPLACE_CMD} -E \
		-e 's|^([[:space:]]*SUBDIRS[[:space:]]*=.*)doc|\1|' \
		${BUILD_WRKSRC}/Makefile.in
.else
# we do not want the latex documents... too many dependencies just
# to get in ps what we already have in html
	@${REINPLACE_CMD} -E \
		-e 's|^([[:space:]]*all:[[:space:]]*.*)stamp-latex|\1|' \
		${BUILD_WRKSRC}/doc/Makefile.in
.endif

post-install:
.ifndef(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${INSTALL_WRKSRC}/doc/html/* ${DOCSDIR}
.endif

.include <bsd.port.mk>
