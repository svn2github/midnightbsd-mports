# New ports collection makefile for:	silc-toolkit
# Date created:				2003.12.15
# Whom:					Evgueni V. Gavrilov <aquatique@rusunix.org>
#
# $MidnightBSD: mports/devel/silc-toolkit/Makefile,v 1.1 2006/09/26 16:39:44 archite Exp $
# $FreeBSD: ports/devel/silc-toolkit/Makefile,v 1.22 2006/08/14 22:55:16 clsung Exp $
#

PORTNAME=	silc
PORTVERSION=	0.9.12
PORTREVISION=	1
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

OPTIONS=	IPV6 "Enable IPv6 support" on \
		OPTIMIZED_ASM "Enable assembler optimizations" on \
		PTHREADS "Enable pthreads support." off \
		OPTIMIZED_CFLAGS "Enable compilation optimizations" off

USE_BZIP2=	yes
USE_PERL5=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd${OSREL}
USE_GNOME=	glib12
USE_GMAKE=	yes
CONFIGURE_ARGS=	--with-etcdir=${PREFIX}/etc/${PORTNAME} \
		--with-simdir=${PREFIX}/lib/silcsim \
		--with-helpdir=${PREFIX}/share/${PORTNAME}/help \
		--includedir=${PREFIX}/include/silc \
		--with-docdir=${DOCSDIR} \
		--without-irssi --without-silcd --enable-shared
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

post-patch:
.ifndef(WITH_OPTIMIZED_CFLAGS)
	@${PERL} -pi -e 's/ ?(-g)? -O2//' ${WRKSRC}/${CONFIGURE_SCRIPT}
	@${PERL} -pi -e 's/ ?(-g)? -O2//' ${WRKSRC}/lib/silcmath/mpi/${CONFIGURE_SCRIPT}
.endif
	@${PERL} -pi -e 's/-D_THREAD_SAFE//; \
			s/^(SILC_DIST_SUBDIRS.+?)doc/\1/' \
		${WRKSRC}/${CONFIGURE_SCRIPT}
	@${PERL} -pi -e 's/ etc-install-server//; \
			s|-cp -R \$$\(srcdir\)/tutorial \$$\(prefix\)|-mkdir -p \$$\(DESTDIR\)${EXAMPLESDIR}/mybot\n\t-\$$\(INSTALL_DATA\) \$$\(srcdir\)/tutorial/[M-R]* \$$\(DESTDIR\)${EXAMPLESDIR}\n\t-\$$\(INSTALL_DATA\) \$$\(srcdir\)/tutorial/mybot/[M-m]* \$$\(DESTDIR\)${EXAMPLESDIR}/mybot|; \
			s|\$$\(distdir\)/tutorial|\$$\(DESTDIR\)${EXAMPLESDIR}|; \
			s|sim-install:$$|sim-install:\n\t-mkdir -p \$$\(DESTDIR\)${PREFIX}/lib/silcsim|; \
			s,doc-install-(client|server) ,,g; \
			s, install-dirs-(client|server),,g; \
			s, etc-install-client,,g; \
			s, generate-server-key,,g; \
			s, examples-install,,g' \
		 ${WRKSRC}/Makefile.in
	@${PERL} -pi -e '' ${WRKSRC}/Makefile.in
	@${PERL} -pi -e 's/example_silcd.conf \\\n//' ${WRKSRC}/doc/Makefile.in
	@${PERL} -pi -e 's/--libtool-enable-shared//' \
		${WRKSRC}/lib/silccrypt/Makefile.in
	@${RM} -f ${WRKSRC}/tutorial/mybot/mybot.c.\~1.5.\~

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

.include <bsd.port.post.mk>
