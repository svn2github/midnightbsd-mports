# $MidnightBSD: mports/dns/libidn/Makefile,v 1.10 2013/02/23 01:22:47 laffer1 Exp $

PORTNAME=	libidn
PORTVERSION=	1.26
CATEGORIES=	dns
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Internationalized Domain Names command line tool
LICENSE=	gpl3

USE_GNOME=	gnomehack pkgconfig
USE_ICONV=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
USE_PERL5_BUILD=	yes
CONFIGURE_ENV=	LIBS="-L${LOCALBASE}/lib"
CPPFLAGS+=	-I${LOCALBASE}/include

INFO=	libidn

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|@image{components}||g' \
		${WRKSRC}/doc/libidn.texi
	@${REINPLACE_CMD} -e 's|$$(AUTOMAKE)|${TRUE}|' \
			-e 's|imagesdir = $$(infodir)|imagesdir = $$(docdir)|' \
		${WRKSRC}/doc/Makefile.in
.if ! ${PORT_OPTIONS:MDOCS}
	@${REINPLACE_CMD} -e 's|install-data-am: install-imagesDATA install-info-am install-man|install-data-am: install-info-am install-man|' \
		${WRKSRC}/doc/Makefile.in
.endif

post-install:
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}
.for i in FAQ NEWS README
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.endif

.include "Makefile.man"
.include <bsd.port.mk>
