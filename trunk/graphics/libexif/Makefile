# $FreeBSD: ports/graphics/libexif/Makefile,v 1.25 2006/03/29 06:54:33 pav Exp $
# $MidnightBSD$

PORTNAME=	libexif
PORTVERSION=	0.6.21
PORTREVISION=	2
CATEGORIES=	graphics
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to read digital camera file meta-data

LICENSE=	lgpl2.1

OPTIONS_DEFINE=	DOCS NLS

USES=		gmake libtool:keepla pathfix pkgconfig tar:bzip2
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-docs
USE_LDCONFIG=	yes

PORTDOCS=	AUTHORS ChangeLog NEWS README
OPTIONS_SUB=	yes

NLS_USES=	gettext
NLS_CONFIGURE_ENV_OFF=	am_cv_func_iconv=no
NLS_CONFIGURE_ENABLE=	nls

post-patch:
	@${REINPLACE_CMD} -e '/^SUBDIRS =/s|doc||g ; \
		 /^am__installdirs =/s|$$(docdir)||g ; \
		 /^install-data-am:/s|install-docDATA||g' ${WRKSRC}/Makefile.in

post-install:
	@${MKDIR} ${DOCSDIR}
.for file in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor

.include <bsd.port.mk>
