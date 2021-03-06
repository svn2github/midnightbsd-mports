# New ports collection makefile for:    mtools
# Date created:         5 October 1994
# Whom:                 jmz
#
# $FreeBSD: ports/emulators/mtools/Makefile,v 1.56 2006/05/29 10:02:22 jmz Exp $
# $MidnightBSD: mports/emulators/mtools/Makefile,v 1.2 2007/04/25 04:54:09 ctriv Exp $
#

PORTNAME=	mtools
PORTVERSION=	3.9.10
CATEGORIES=	emulators
MASTER_SITES=	ftp://ftp.tux.org/pub/knaff/mtools/  \
		http://mtools.linux.lu/

PATCH_SITES=	http://mtools.linux.lu/
PATCHFILES=	mtools-3.9.10-20060525.diff.gz
PATCH_DIST_STRIP=	-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A collection of tools for manipulating MSDOS files
SUB_FILES= 	pkg-message

GNU_CONFIGURE=	yes
.if !defined(WITHOUT_X11)
USE_XLIB=	yes
CONFIGURE_ARGS=	--enable-xdf --enable-floppyd
PLIST_SUB=	WITH_X11=""
.else
CONFIGURE_ARGS=	--enable-xdf
PLIST_SUB=	WITH_X11="@comment "
.endif

USE_GMAKE=	yes
INFO=		mtools

MAN1=		mattrib.1 mbadblocks.1 mcat.1 mcd.1 mclasserase.1 mcopy.1 mdel.1 mdeltree.1 \
		mdir.1 mdu.1 mformat.1 mkmanifest.1 minfo.1 mlabel.1 mmd.1 mmount.1 \
		mmove.1 mpartition.1 mrd.1 mren.1 mshowfat.1 \
		mtoolstest.1 mtools.1 mtype.1 mzip.1
MAN5=		mtools.5

.if !defined(WITHOUT_X11)
MAN1+=		floppyd.1 floppyd_installtest.1
.endif

post-patch:
	@cd ${WRKSRC}; for f in config.c mformat.c mtools.5 mtools.texi; do \
	 ${MV} -f $$f $$f.orig; \
	 ${SED} -e s:/etc/mtools.conf:${PREFIX}/etc/mtools.conf: \
	 < $$f.orig > $$f; done
	@cd ${WRKSRC}/scripts; for f in ocopy xcopy; do \
	 if [ ! -f $$f -a -f $$f.orig ]; then ${CP} -p $$f.orig $$f ; fi \
	 done

post-install:
#	mwrite has been removed by author, but we'll keep it just a bit longer
	@cd ${PREFIX}/bin && ${LN} -sf mtools mwrite
	@${LN} -sf ${PREFIX}/man/man1/mcopy.1.gz ${PREFIX}/man/man1/mwrite.1.gz
	@${INSTALL_DATA} ${WRKSRC}/mtools.conf ${PREFIX}/etc/mtools.conf.sample

.include <bsd.port.mk>
