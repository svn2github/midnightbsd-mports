# New ports collection makefile for:	libxslt
# Date created:				9th February 2001
# Whom:					Ade Lovett <ade@FreeBSD.org>
#
# $MidnightBSD: mports/textproc/libxslt/Makefile,v 1.7 2009/10/27 13:23:13 laffer1 Exp $
# $FreeBSD: ports/textproc/libxslt/Makefile,v 1.80 2006/06/07 19:27:27 marcus Exp $
#

PORTNAME=	libxslt
PORTVERSION=	1.1.26
PORTREVISION?=	1
CATEGORIES?=	textproc gnome
MASTER_SITES=	ftp://fr.rpmfind.net/pub/libxml/ \
		ftp://gd.tuwien.ac.at/pub/libxml/ \
		ftp://xmlsoft.org/libxml2/
DIST_SUBDIR=	gnome2

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	The XSLT C library for GNOME
LICENSE=	bsd3

.if !defined(REFERENCE_PORT)

USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_GNOME?=	gnomehack gnometarget libxml2
CONFIGURE_ARGS?= --with-html-dir=${PREFIX}/share/doc \
		--without-python
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.if defined(MASTERDIR)
_SLAVE_PORT=	yes
.else
MAN3=		libexslt.3 libxslt.3
MAN1=		xsltproc.1

OPTIONS=	MEM_DEBUG "Enable memory debugging" off \
		CRYPTO "Enable crypto support for exslt" on
.endif

.include <bsd.port.pre.mk>

.if defined(WITH_MEM_DEBUG)
CONFIGURE_ARGS+=	--with-mem-debug
.endif

.if defined(WITH_CRYPTO)
LIB_DEPENDS+=	gcrypt.17:${PORTSDIR}/security/libgcrypt
.else
CONFIGURE_ARGS+=--without-crypto
.endif

post-patch:
	@${REINPLACE_CMD} -e '/^install-data-am:/ s|install-data-local||' \
		${WRKSRC}/doc/Makefile.in
	@${REINPLACE_CMD} -e 's|[$$](bindir)/xsltproc|../xsltproc/xsltproc|g ; \
		s|[$$](bindir)/xmllint|../xmllint/xmllint|g' \
		${WRKSRC}/doc/Makefile.in

.include <bsd.port.post.mk>

.endif
