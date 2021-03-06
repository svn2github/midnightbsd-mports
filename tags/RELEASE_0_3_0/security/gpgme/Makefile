# $MidnightBSD: mports/security/gpgme/Makefile,v 1.10 2010/01/02 00:07:31 laffer1 Exp $

PORTNAME=	gpgme
PORTVERSION=	1.2.0
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GNUPG}
MASTER_SITE_SUBDIR=	gpgme
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}${EXTRACT_SUFX}.sig
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library to make access to GnuPG easier
LICENSE=	gpl2

BUILD_DEPENDS=	gpg2:${PORTSDIR}/security/gnupg
LIB_DEPENDS=	gpg-error.0:${PORTSDIR}/security/libgpg-error
RUN_DEPENDS=	gpg2:${PORTSDIR}/security/gnupg

MAKE_JOBS_SAFE=	yes
USE_AUTOTOOLS=	libtool:22
USE_GMAKE=	yes
USE_LDCONFIG=	yes
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS=	\
		--includedir=${PREFIX}/include/gpgme \
		--disable-gpg-test \
		--disable-gpgsm-test

INFO=		gpgme
PORTDOCS=	AUTHORS ChangeLog COPYING COPYING.LESSER INSTALL \
		NEWS README THANKS TODO

OPTIONS=	GNUPG1 "Use GNUPG 1.x instead of GNUPG 2.x" off \
		PTH "Build alternate lib with GNU portable threads" off

.include <bsd.port.pre.mk>

.if defined(WITH_GNUPG1)
BUILD_DEPENDS+=	gpg:${PORTSDIR}/security/gnupg1
RUN_DEPENDS+=	gpg:${PORTSDIR}/security/gnupg1
CONFIGURE_ARGS+=--with-gpg=${LOCALBASE}/bin/gpg \
		--with-gpgsm=no \
		--with-gpgconf=no
.else
BUILD_DEPENDS+=	gpg2:${PORTSDIR}/security/gnupg
RUN_DEPENDS+=	gpg2:${PORTSDIR}/security/gnupg
CONFIGURE_ARGS+=--with-gpg=${LOCALBASE}/bin/gpg2 \
		--with-gpgsm=${LOCALBASE}/bin/gpgsm \
		--with-gpgconf=${LOCALBASE}/bin/gpgconf
.endif

.if defined(WITH_PTH)
LIB_DEPENDS+=	pth:${PORTSDIR}/devel/pth
PLIST_SUB+=	WITH_PTH=''
.else
CONFIGURE_ARGS+=--without-pth --without-pth-test
PLIST_SUB+=	WITH_PTH='@comment '
.endif

verify: checksum
	gpg --verify ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}.sig

post-patch:
	@${REINPLACE_CMD} -e 's|EOF||g' ${WRKSRC}/assuan/assuan-errors.c
	@${REINPLACE_CMD} -e 's|-lpthread|${PTHREAD_LIBS}|g' \
					${WRKSRC}/${CONFIGURE_SCRIPT} \
					${WRKSRC}/src/Makefile.in \
					${WRKSRC}/src/gpgme-config.in
	@${REINPLACE_CMD} -e 's|^clfilesdir.*|clfilesdir=$$\(libdir\)/common-lisp/gpgme|g' \
					${WRKSRC}/lang/cl/Makefile.in

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
