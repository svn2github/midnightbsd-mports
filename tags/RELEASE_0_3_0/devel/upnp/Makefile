# New ports collection makefile for:	upnp
# Date created:				02 August 2002
# Whom:	      				Yen-Ming Lee <leeym@leeym.com>
#
# $MidnightBSD: mports/devel/upnp/Makefile,v 1.3 2010/10/20 18:50:24 laffer1 Exp $
# $FreeBSD: ports/devel/upnp/Makefile,v 1.24 2008/04/29 12:41:16 miwi Exp $
#

PORTNAME=	upnp
PORTVERSION=	1.6.8
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	SF/p${PORTNAME}/p${PORTNAME}/libUPnP%20${PORTVERSION}
DISTNAME=	lib${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Universal Plug and Play Software Development Kit
LICENSE=	bsd3

CONFLICTS=	upnp-1.0.*
USE_BZIP2=	yes
USE_AUTOTOOLS=	libtool:22
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
MAKE_JOBS_SAFE=	yes

MAKE_ENV=	PTHREAD_LIBS=${PTHREAD_LIBS}
CONFIGURE_ENV+=	LIBS="-llwres -lcompat" 

.if defined(NOPORTDOCS)
CONFIGURE_ARGS=	--without-documentation
.else
CONFIGURE_ARGS=	--with-documentation=${DOCSDIR}
.endif

PORTDOCS=	*

post-patch:	.SILENT
	${REINPLACE_CMD} '/^pkgconfigexecdir/s|$$(libdir)|$$(prefix)/libdata|' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
