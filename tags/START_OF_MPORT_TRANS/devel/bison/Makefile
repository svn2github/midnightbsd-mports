# Ports collection makefile for:  bison
# Date created:			  27 Mar 1999
# Whom:				  Jerry Hicks
#
# $MidnightBSD$
# $FreeBSD: ports/devel/bison/Makefile,v 1.54 2005/09/04 18:33:15 ade Exp $
#

PORTNAME=	bison
PORTVERSION=	1.75
PORTREVISION=	2
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A parser generator from FSF, (mostly) compatible with Yacc

BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4
RUN_DEPENDS=	gm4:${PORTSDIR}/devel/m4

CONFLICTS=	bison-1.8[0-9]* bison-2.[0-9]*

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd${OSREL}
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		MAKEINFO="makeinfo --no-split"

MAN1=		bison.1
INFO=		bison

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
.else
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.endif

.ifdef USE_BISON
.error You have `USE_BISON' variable defined either in environment or in make(1) arguments. Please undefine and try again.
.endif

post-extract:
	@${RM} -f ${WRKSRC}/doc/bison.info*

.include <bsd.port.mk>
