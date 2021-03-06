# New ports collection makefile for:	libcdio
# Date created:				2004-04-04
# Whom:					arved
#
# $MidnightBSD: mports/sysutils/libcdio/Makefile,v 1.2 2008/03/21 05:06:57 ctriv Exp $
# $FreeBSD: ports/sysutils/libcdio/Makefile,v 1.23 2006/09/04 14:37:15 mich Exp $

PORTNAME=	libcdio
PORTVERSION=	0.78.2
PORTREVISION=	0
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	libcdio

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compact Disc Input and Control Library

LIB_DEPENDS=	cddb.4:${PORTSDIR}/audio/libcddb \
		popt.0:${PORTSDIR}/devel/popt

GNU_CONFIGURE=	yes
USE_GNOME=	gnometarget pkgconfig gnomehack
USE_GMAKE=	yes
USE_ICONV=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS+=	--with-libpopt-prefix=${LOCALBASE} \
			--with-libiconv-prefix=${LOCALBASE} \
USE_PERL5_BUILD=yes
CONFIGURE_ENV+=	CPPFLAGS="${CPPFLAGS} -I${LOCALBASE}/include" LDFLAGS="${LDFLAGS} -L${LOCALBASE}/lib -liconv"

INFO=		libcdio

OPTIONS=	PARANOIA "Support for accessing audio via CD Paranoia" on

.include <bsd.port.pre.mk>

.ifdef(WITH_PARANOIA)
LIB_DEPENDS+=	cdda_paranoia.0:${PORTSDIR}/audio/cdparanoia
PLIST_SUB+=	PARANOIA=""
MAN1=	cd-paranoia.1
.else
CONFIGURE_ARGS+=	--without-cd-paranoia
PLIST_SUB+=	PARANOIA="@comment "
.endif

post-patch:
.ifndef(WITH_PARANOIA)
	${REINPLACE_CMD} -e 's|libcdio_paranoia.pc||; s|libcdio_cdda.pc||' \
		 ${WRKSRC}/Makefile.in
.endif
	${REINPLACE_CMD} -e "s,freebsd5\.\*,freebsd5\.\*|freebsd6\.\*|freebsd7\.\*," ${WRKSRC}/configure

.include <bsd.port.post.mk>
