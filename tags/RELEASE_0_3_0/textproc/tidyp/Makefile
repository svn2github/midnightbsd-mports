# $MidnightBSD$
# $FreeBSD: ports/textproc/tidyp/Makefile,v 1.1 2010/05/16 09:23:35 miwi Exp $

PORTNAME=	tidyp
PORTVERSION=	1.02
CATEGORIES=	textproc www
MASTER_SITES=	http://cloud.github.com/downloads/petdance/tidyp/ \
		http://sunpoet.net/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library and program to validate and fix HTML
LICENSE=	unknown

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

OPTIONS=	ACCESS	"Support Accessibility checks" off \
		ASIAN	"Support Asian encoding" off \
		DEBUG	"Enable debugging" off \
		UTF16	"Support UTF-16 encoding" off

PLIST_SUB+=	TIDYP_VER="${PORTVERSION}"

.include <bsd.port.pre.mk>

.if defined(WITH_ACCESS)
CONFIGURE_ARGS+=--enable-debug
.endif

.if defined(WITH_ASIAN)
CONFIGURE_ARGS+=--enable-asian
.endif

.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=--enable-debug
.endif

.if defined(WITH_UTF16)
CONFIGURE_ARGS+=--enable-utf16
.endif

.include <bsd.port.post.mk>
