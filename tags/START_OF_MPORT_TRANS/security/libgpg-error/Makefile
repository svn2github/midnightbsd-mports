# New ports collection makefile for:	libgpg-error
# Date created:		2003-10-12
# Whom:			Sergei Kolobov <sergei@kolobov.com>
#
# $FreeBSD: ports/security/libgpg-error/Makefile,v 1.17 2006/09/22 06:57:06 sergei Exp $
# $MidnightBSD$
#

PORTNAME=	libgpg-error
PORTVERSION=	1.4
CATEGORIES=	security devel
MASTER_SITES=	${MASTER_SITE_GNUPG}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common error values for all GnuPG components

USE_GPG=		yes
SIG_SUFFIX=		.sig
USE_LDCONFIG=		yes
GNU_CONFIGURE=		yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS=	--without-nls
PLIST_SUB=	NLS="@comment "
.else
USE_ICONV=	yes
USE_GETTEXT=	yes
CONFIGURE_ARGS=	--with-libiconv-prefix=${LOCALBASE} \
		--with-libintl-prefix=${LOCALBASE}
PLIST_SUB=	NLS=""
.endif

DOCS=		AUTHORS ChangeLog NEWS README

.if !defined(NOPORTDOCS)
post-install:
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
