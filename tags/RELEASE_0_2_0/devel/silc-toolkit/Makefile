# New ports collection makefile for:	silc-toolkit
# Date created:				2003.12.15
# Whom:					Evgueni V. Gavrilov <aquatique@rusunix.org>
#
# $MidnightBSD: mports/devel/silc-toolkit/Makefile,v 1.3 2007/11/15 01:23:50 laffer1 Exp $
# $FreeBSD: ports/devel/silc-toolkit/Makefile,v 1.25 2007/10/03 22:44:56 edwin Exp $
#

PORTNAME=	silc
PORTVERSION=	1.0.2
PORTREVISION=	2
CATEGORIES=	devel ipv6 net security
MASTER_SITES=	http://www.silcnet.org/download/%SUBDIR%/ \
		http://ftp.silcnet.org/%SUBDIR%/ \
		http://www.nic.funet.fi/pub/mirrors/ftp.silcnet.org/silc/%SUBDIR%/ \
		http://www.fi.silcnet.org/download/%SUBDIR%/ \
		http://munitions.vipul.net/software/mirrors/silc/%SUBDIR%/ \
		http://www.pl.silcnet.org/download/%SUBDIR%/ \
		http://ftp.sunet.se/pub/network/silc/%SUBDIR%/ \
		ftp://ftp.silcnet.org/silc/%SUBDIR%/ \
		ftp://ftp.au.silcnet.org/pub/silcnet/%SUBDIR%/ \
		ftp://ftp.funet.fi/pub/mirrors/ftp.silcnet.org/silc/%SUBDIR%/ \
		ftp://ftp.pl.silcnet.org/pub/silc/%SUBDIR%/ \
		ftp://ftp.sunet.se/pub/network/silc/%SUBDIR%/
MASTER_SITE_SUBDIR=	toolkit/sources
PKGNAMESUFFIX=	-toolkit
DISTNAME=	${PORTNAME}${PKGNAMESUFFIX}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Secure Internet Live Conferencing (SILC) network toolkit
LICENSE=	bsd3

USE_AUTOTOOLS=	libtool:15
USE_BZIP2=	yes
USE_PERL5=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd6.0
USE_GNOME=    glib12
USE_GMAKE=	yes
CONFIGURE_ARGS=	--with-etcdir=${PREFIX}/etc/${PORTNAME}${PKGNAMESUFFIX} \
		--with-simdir=${PREFIX}/lib/silcsim \
		--with-helpdir=${PREFIX}/share/${PORTNAME}${PKGNAMESUFFIX}/help \
		--includedir=${PREFIX}/include/silc \
		--with-docdir=${DOCSDIR}${PKGNAMESUFFIX} \
		--enable-shared --without-libtoolfix
CONFIGURE_ENV=	CFLAGS+="${CFLAGS}" \
		CPPFLAGS+="${CPPFLAGS}"
USE_LDCONFIG=	yes
PLIST_SUB=	INSTALL_DIR="${INSTALL_DIR}"

INSTALL_DIR?=	${INSTALL} -d -o ${BINOWN} -g ${BINGRP} -m 755

.ifndef(WITH_PTHREADS)
CONFIGURE_ARGS+=	--without-pthreads
.else
CONFIGURE_ENV+=	CFLAGS="${CFLAGS} ${PTHREAD_CFLAGS} ${PTHREAD_LIBS}"
.endif

MAN1=		silc.1

pre-everything::
.ifndef(WITHOUT_IPV6)
	@${ECHO_MSG} '===> Define WITHOUT_IPV6 to disable IPv6 support'
.endif
.ifndef(WITHOUT_OPTIMIZED_ASM)
	@${ECHO_MSG} '===> Define WITHOUT_OPTIMIZED_ASM to disable assembler optimizations'
.endif
.ifndef(WITH_PTHREADS)
	@${ECHO_MSG} '===> Define WITH_PTHREADS to enable pthreads support'
.endif
	@${ECHO_MSG}
.ifndef(WITH_OPTIMIZED_CFLAGS)
	@${ECHO_MSG} '===> Define WITH_OPTIMIZED_CFLAGS to enable compilation optimizations'
	@${ECHO_MSG} '===> which is known to break some platforms (e.g., alpha)'
.endif

.include <bsd.port.pre.mk>

.if ${ARCH} != "i386"
WITHOUT_OPTIMIZED_ASM=	yes
.endif

.if !defined(WITHOUT_IPV6)
CONFIGURE_ARGS+=	--enable-ipv6
.endif

.ifdef(WITHOUT_OPTIMIZED_ASM)
CONFIGURE_ARGS+=	--disable-asm
.endif

post-patch:
.ifndef(WITH_OPTIMIZED_CFLAGS)
	@${PERL} -pi -e 's/ ?(-g)? -O2//' ${WRKSRC}/${CONFIGURE_SCRIPT}
.endif
	@${REINPLACE_CMD} -e 's|(libdir)/pkgconfig|(prefix)/libdata/pkgconfig|g' \
		${WRKSRC}/lib/Makefile.in

.include <bsd.port.post.mk>
