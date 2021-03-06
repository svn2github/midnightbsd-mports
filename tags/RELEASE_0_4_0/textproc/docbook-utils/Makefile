# New ports collection makefile for:	docbook-utils
# Date created:				3 May 2004
# Whom:					Brian Candler <B.Candler@pobox.com>
#
# $MidnightBSD$
# $FreeBSD: ports/textproc/docbook-utils/Makefile,v 1.6 2008/04/23 19:35:43 pav Exp $
#

PORTNAME=	docbook-utils
PORTVERSION=	0.6.14
PORTREVISION=	0
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_SOURCEWARE}
MASTER_SITE_SUBDIR=	docbook-tools/new-trials/SOURCES

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generates various output formats from DocBook SGML documents
LICENSE=	gpl2

BUILD_DEPENDS+=	nsgmls:${PORTSDIR}/textproc/jade \
		${LOCALBASE}/share/sgml/docbook/3.1/docbook.dtd:${PORTSDIR}/textproc/docbook-310 \
		${LOCALBASE}/share/sgml/docbook/dsssl:${PORTSDIR}/textproc/dsssl-docbook-modular
RUN_DEPENDS+=	${LOCALBASE}/share/texmf/tex/jadetex/dsssl.def:${PORTSDIR}/print/jadetex \
		sgmlspl:${PORTSDIR}/textproc/p5-SGMLSpm \
    		jade:${PORTSDIR}/textproc/jade \
		lynx:${PORTSDIR}/www/lynx

USE_PERL5_RUN=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
MAKE_ARGS+=	docdir="${DOCSDIR}" htmldir="${DOCSDIR}/html"

MAN1=		jw.1 sgmldiff.1 docbook2man-spec.pl.1 docbook2texi-spec.pl.1
MAN7=		backend-spec.7 frontend-spec.7
MLINKS=		jw.1 docbook2dvi.1 \
		jw.1 docbook2html.1 \
		jw.1 docbook2man.1 \
		jw.1 docbook2pdf.1 \
		jw.1 docbook2ps.1 \
		jw.1 docbook2rtf.1 \
		jw.1 docbook2tex.1 \
		jw.1 docbook2texi.1 \
		jw.1 docbook2txt.1
.if !defined(NOPORTDOCS)
PORTDOCS=	*
.endif

post-patch:
	 @${REINPLACE_CMD} -e '254 s/install-htmlDATA//' \
		${WRKSRC}/doc/HTML/Makefile.in

pre-configure:
	${RM} -f ${WRKSRC}/config.cache

.include <bsd.port.mk>
