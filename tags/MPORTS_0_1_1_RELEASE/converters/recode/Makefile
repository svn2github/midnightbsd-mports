# New ports collection makefile for:	recode
# Date created:		14 Jul 1995
# Whom:			torstenb@FreeBSD.org
#
# $MidnightBSD: mports/converters/recode/Makefile,v 1.3 2007/08/07 18:17:37 laffer1 Exp $
# $FreeBSD: ports/converters/recode/Makefile,v 1.36 2006/02/23 10:35:00 ade Exp $
#

PORTNAME=	recode
PORTVERSION=	3.6
PORTREVISION=	7
CATEGORIES=	converters
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	recode

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Converts files between character sets and usages

LICENSE=	gpl2

USE_GETTEXT=	yes
USE_AUTOTOOLS=	libtool:15
USE_PERL5=	yes
INSTALLS_SHLIB=	yes
CONFIGURE_ARGS=	--without-included-gettext
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CFLAGS+=	-fPIC

MAN1=		recode.1
INFO=		recode

post-extract: copy-po-files remove-info-files

copy-po-files:
	@${CP} ${FILESDIR}/ru.po ${WRKSRC}/i18n

remove-info-files:
	@${RM} -f ${WRKSRC}/doc/${PORTNAME}.info*

post-patch:
	@${PERL} -pi -e '\
		if (/Project-Id-Version/) { \
			s/3\.[45](r|\.[0-9])?/3.6/; \
			s/: (Free )?recode/: GNU recode/; \
		} \
	' ${WRKSRC}/i18n/*.po

.include <bsd.port.mk>
