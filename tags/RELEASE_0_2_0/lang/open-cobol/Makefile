# ex:ts=8
# Ports collection makefile for:	open-cobol
# Date created:			Aug 6, 2002
# Whom:				ijliao
#
# $MidnightBSD: mports/lang/open-cobol/Makefile,v 1.1 2007/07/21 18:06:06 laffer1 Exp $
# $FreeBSD: ports/lang/open-cobol/Makefile,v 1.28 2007/03/27 16:29:08 pav Exp $
#

PORTNAME=	open-cobol
PORTVERSION=	1.0
CATEGORIES=	lang
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An open-source COBOL compiler

LIB_DEPENDS=	gmp.7:${PORTSDIR}/math/libgmp4

USE_GNOME=	gnometarget
USE_BDB=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:15
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
USE_LDCONFIG=	yes

INFO=		open-cobol

CPPFLAGS=	-I${BDB_INCLUDE_DIR} -I${LOCALBASE}/include
LDFLAGS=	-L${LOCALBASE}/lib

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
.else
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|__gmp_randinit|__gmpz_init|g ; \
		s|db-4.[0-9]|${BDB_LIB_NAME}|g' ${WRKSRC}/configure

.include <bsd.port.mk>
