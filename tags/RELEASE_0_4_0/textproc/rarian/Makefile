# $MidnightBSD: mports/textproc/rarian/Makefile,v 1.5 2011/12/15 00:39:59 laffer1 Exp $

PORTNAME=	rarian
PORTVERSION=	0.8.1
PORTREVISION=	2
CATEGORIES=	textproc gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An OMF help system based on the Freedesktop specification
LICENSE=        gpl2

BUILD_DEPENDS=	${LOCALBASE}/share/xsl/docbook/xhtml/chunk.xsl:${PORTSDIR}/textproc/docbook-xsl \
    		${LOCALBASE}/share/xml/docbook/${DOCBOOK_VERSION}/catalog.xml:${PORTSDIR}/textproc/docbook-xml \
		${LOCALBASE}/share/xml/docbook/4.1.2/docbookx.dtd:${PORTSDIR}/textproc/docbook-sk \
		bash:${PORTSDIR}/shells/bash
RUN_DEPENDS=	bash:${PORTSDIR}/shells/bash \
    		${LOCALBASE}/bin/getopt:${PORTSDIR}/misc/getopt \
		${LOCALBASE}/share/xsl/docbook/xhtml/chunk.xsl:${PORTSDIR}/textproc/docbook-xsl \
		${LOCALBASE}/share/xml/docbook/${DOCBOOK_VERSION}/catalog.xml:${PORTSDIR}/textproc/docbook-xml \
		${LOCALBASE}/share/xml/docbook/4.1.2/docbookx.dtd:${PORTSDIR}/textproc/docbook-sk

DOCBOOK_VERSION=4.2

CONFLICTS=	scrollkeeper-[0-9]*

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehier gnomehack libxslt
USE_PYTHON=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--with-convert-dir=${LOCALBASE}/share/omf \
		--datadir=${PREFIX}/share \
		--localstatedir=/var
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

post-patch:
	@${REINPLACE_CMD} -e 's|/lib/rarian|/db/rarian|' \
		${WRKSRC}/util/Makefile.in
	@${REINPLACE_CMD} -e 's|@localstatedir@/lib/rarian|@localstatedir@/db/rarian|g ; \
		s|getopt|${LOCALBASE}/bin/getopt|' \
	    	${WRKSRC}/util/rarian-sk-config.in \
		${WRKSRC}/util/rarian-sk-extract.in \
		${WRKSRC}/util/rarian-sk-rebuild.in \
		${WRKSRC}/util/rarian-sk-update.in
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|' \
	    	${WRKSRC}/librarian/rarian-main.c \
		${WRKSRC}/librarian/rarian-man.c \
		${WRKSRC}/librarian/rarian-info.c

.include <bsd.port.mk>
