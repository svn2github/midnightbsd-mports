# ex:ts=8
# Ports collection makefile for:	open-cobol
# Date created:			Aug 6, 2002
# Whom:				ijliao
#
# $MidnightBSD$
# $FreeBSD: ports/lang/open-cobol/Makefile,v 1.28 2007/03/27 16:29:08 pav Exp $
#

PORTNAME=	open-cobol
PORTVERSION=	0.32
PORTREVISION=	2
CATEGORIES=	lang
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An open-source COBOL compiler

LIB_DEPENDS=	gmp.7:${PORTSDIR}/math/libgmp4

USE_GETOPT_LONG=yes
USE_AUTOTOOLS=	libltdl:15 libtool:15
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
USE_LDCONFIG=	yes

INFO=		open-cobol

CPPFLAGS=	-I${LOCALBASE}/include
LDFLAGS=	-L${LOCALBASE}/lib

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
.else
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|__gmp_rand|__gmpz_init|g' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|^SUBDIRS = lib |SUBDIRS = |g' \
		${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's|$$(top_builddir)/lib/libsupport\.a||g' \
		${WRKSRC}/cobc/Makefile.in

.if defined(MAINTAINER_MODE)
test:	build
	(cd ${WRKSRC}/tests;	\
	./syntax;		\
	./run)
.endif

.include <bsd.port.mk>
