# ports collection makefile for:   lame
# Date created:        11 January 1998
# Whom:                yoshiaki Uchikawa
#
# $MidnightBSD: mports/audio/lame/Makefile,v 1.2 2007/04/04 21:25:38 laffer1 Exp $
# $FreeBSD: ports/audio/lame/Makefile,v 1.42 2006/09/02 23:47:19 kris Exp $
#

PORTNAME=	lame
PORTVERSION=	3.97
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE} \
		ftp://ftp.fu-berlin.de/unix/sound/%SUBDIR%/
MASTER_SITE_SUBDIR=	lame

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ISO code based fast MP3 encoder kit
LICENSE=	restricted

USE_AUTOTOOLS=	libtool:15
USE_LDCONFIG=	yes
GNU_CONFIGURE=  yes
USE_GMAKE=	yes
CONFIGURE_ARGS=	--enable-nasm --enable-mp3rtp --disable-gtktest

RESTRICTED=	patent issues, see http://www.mp3licensing.com/

MAN1=		lame.1

DOC_FILES=	API LICENSE README TODO USAGE

.include <bsd.port.pre.mk>

.if ${ARCH} == "i386"
BUILD_DEPENDS=	nasm:${PORTSDIR}/devel/nasm
.endif

.if defined(NOPORTDOCS)
do-install:
	@cd ${INSTALL_WRKSRC} && ${SETENV} ${MAKE_ENV} ${GMAKE} \
		${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} install-exec
	@cd ${INSTALL_WRKSRC}/include && ${SETENV} ${MAKE_ENV} ${GMAKE} \
		${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} install-data
	@cd ${INSTALL_WRKSRC}/doc/man && ${SETENV} ${MAKE_ENV} ${GMAKE} \
		${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} install-data
.else
post-install: install-doc

install-doc:
	@${MKDIR} ${DOCSDIR}
.for file in ${DOC_FILES}
	@${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.post.mk>
