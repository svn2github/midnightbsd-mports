# $MidnightBSD: mports/archivers/xz/Makefile,v 1.1 2009/12/25 17:18:03 laffer1 Exp $

PORTNAME=	xz
PORTVERSION=	4.999.9
CATEGORIES=	archivers
MASTER_SITES=	http://tukaani.org/xz/
DISTNAME=	${PORTNAME}-${PORTVERSION}beta

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	LZMA compression and decompression tools
LICENSE=	agg

CONFLICTS=	lzma-[0-9]* lzmautils-[0-9]* lzmalib-[0-9]*

MAKE_JOBS_SAFE=	yes
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack
GNU_CONFIGURE=	yes

CONFIGURE_ARGS=	--enable-dynamic=yes
CONFIGURE_ARGS+=--disable-nls	# no translations available

# pick up assembly language optimizations
CONFIGURE_TARGET=	${ARCH:S/amd64/x86_64/}-portbld-freebsd${OSREL}

.if !defined(NOPORTDOCS)
INSTALL_TARGET=	install install-dist_docDATA
.endif

MAN1=	lzmainfo.1 xz.1 xzdec.1 xzdiff.1 xzgrep.1 xzless.1 xzmore.1

MLINKS=	xz.1 lzcat.1		xzdiff.1 lzcmp.1 \
	xzdiff.1 lzdiff.1	xzgrep.1 lzegrep.1 \
	xzgrep.1 lzfgrep.1	xzgrep.1 lzgrep.1 \
	xzless.1 lzless.1	xz.1 lzma.1 \
	xzdec.1 lzmadec.1	xzmore.1 lzmore.1 \
	xz.1 unlzma.1		xz.1 unxz.1 \
	xz.1 xzcat.1		xzdiff.1 xzcmp.1 \
	xzgrep.1 xzegrep.1	xzgrep.1 xzfgrep.1

PORTDOCS=	AUTHORS COPYING COPYING.GPLv2 NEWS README THANKS TODO \
		faq.txt history.txt lzma-file-format.txt xz-file-format.txt

regression-test: build
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} check

.include <bsd.port.mk>
